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










end
