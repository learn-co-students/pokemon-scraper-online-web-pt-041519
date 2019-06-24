class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        pokemon = db.execute(sql, id).first
        self.new(id: id, name: pokemon[1], type: pokemon[2], db: db)
    end
end
