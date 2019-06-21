class Pokemon

    attr_accessor :id, :name, :type, :db, :hp

    def initialize(id:nil, name:, type:, db:, hp:nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        values (?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def alter_hp(newhp, db)
        sql = "UPDATE pokemon SET name = ?, type = ?, hp = ? WHERE id = ?"
        db.execute(sql, self.name, self.type, newhp, self.id)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        result = db.execute(sql, id)[0]
        new = Pokemon.new(id:result[0], name:result[1], type:result[2], db:db, hp:result[3])
    end

    
end
