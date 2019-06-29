require 'sqlite3'
class Pokemon
  attr_accessor :name, :type, :id, :db, :hp 
  #pokemon_db = SQLite3::Database.new("../db/pokemon.db")
  def initialize(arguments)
    arguments.each {|key, value| self.send(("#{key}="), value)}
    
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end
  
  def self.find(id, db)
    pokemon = db.execute("SELECT *FROM pokemon WHERE id=?", id)[0]
    pokemon_hash = {:id => pokemon[0], :name => pokemon[1], :type => pokemon[2]}
    self.new(pokemon_hash)
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
