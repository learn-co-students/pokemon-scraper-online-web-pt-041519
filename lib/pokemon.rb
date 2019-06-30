require "pry"

class Pokemon
attr_accessor :name, :type, :id, :hp, :db

def initialize(id:, name:, type:, hp: nil, db:)
  @id = id
  @name = name
  @type = type
  @hp = hp
  @db = db
end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
end

def self.find(id, db)
  pokemon_details = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
  new_pokemon = Pokemon.new(id: id, name: pokemon_details[1], type: pokemon_details[2], hp: pokemon_details[3], db: db)
end

def alter_hp(new_hp, db)
db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
end

end
