class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(keywords)
        # @id = id,
        # @name = name
        # @type = type
        # @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon(name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, name, type)

    end

    def self.find(num, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        result = db.execute(sql, num)[0]
        pokemon = self.new(result)
        pokemon.id = result[0]
        pokemon.name = result[1]
        pokemon.type = result[2]
        return pokemon
        #self.new(id: result[0], name: result[1], type: result[2])
    end


end
