class Pokemon
  
  attr_accessor :name, :type, :db, :id
  
  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end  
  
  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
     #binding.pry
    db.execute(sql, name, type)
    
   @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
 
  end
  
  def self.find(x, db) 
    sql = "SELECT * FROM pokemon WHERE id = ?"
    row = db.execute(sql,x)[0]
    #binding.pry
    new_pokemon = self.new(id: row[0], name: row[1], type: row[2], db: db)
    #binding.pry
    new_pokemon
  end  
end
