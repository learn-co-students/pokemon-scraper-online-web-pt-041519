require 'pry'

class Pokemon
  
  attr_accessor :name, :type, :db 
  attr_reader :id
  
  def initialize(id:, name:, type:, db:)
    @name = name 
    @type = type
    @db = db
    @id = id
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(name: data[1], type: data[2], db: db, id: id)
  end
  
end
