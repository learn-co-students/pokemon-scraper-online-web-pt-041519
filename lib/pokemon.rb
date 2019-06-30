class Pokemon
    attr_accessor :name, :type, :db, :hp
    attr_reader :id

    def initialize(id: nil, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT * FROM pokemon WHERE id = ?
        SQL
        arr = db.execute(sql, id).first
        Pokemon.new(id: id, name: arr[1], type: arr[2], db: db)

    end



    # def alter_hp(health, db)
    #     sql = <<-SQL 
    #     UPDATE pokemon SET name = ?, 
    #     type = ?, 
    #     hp = ? WHERE id = ? 
    #     SQL
    #     db.execute(sql, self.name, self.type, health, self.id)
    # end

    # def alter_hp(health, db)
    #     sql = <<-SQL
    #       UPDATE pokemon 
    #       SET hp = ?
    #       WHERE id = ?
    #     SQL
    #     db.execute(sql, health, @id)
    #   end

    # def alter_hp(health, db)
    #     db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", health, self.id)
    # end 


end
