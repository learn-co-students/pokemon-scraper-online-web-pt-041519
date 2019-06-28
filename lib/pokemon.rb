require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id, @name, @type, @db, @hp = id, name, type, db, hp
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end 
  
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    
    pokemon = db.execute(sql, id).flatten
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db, hp: pokemon[3])
  end 
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end 
  
end
