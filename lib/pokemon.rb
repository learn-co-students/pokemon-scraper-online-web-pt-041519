class Pokemon
   attr_accessor :id, :name, :type, :db, :hp

   @@all = []

   def initialize(name:, type:, db:, id:)
      @id = id
      @name = name
      @type = type
      @hp = hp
      @db = db
      @@all << self
   end

   def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
   end

   def self.find(id, db)
      query_result = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
      id = query_result[0]
      name = query_result[1]
      type = query_result[2]
      Pokemon.new(id: id, name: name, type: type, db: db)
   end


end
