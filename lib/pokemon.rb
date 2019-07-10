class Pokemon

    attr_accessor :name, :type, :db, :id

    def initialize(id:nil, name:, type:, db:)
        @name = name
        @type = type
        @id = id
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?, ?);
        SQL

        db.execute(sql, name, type)
    end

    #finds a pokemon from the database by their id number 
    #returns a new Pokemon object
    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ? LIMIT 1;
        SQL

        pokemon = db.execute(sql, id).first
        self.new(id: id, name: pokemon[1], type: pokemon[2], db: db)
    end
end
