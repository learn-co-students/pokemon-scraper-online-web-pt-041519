class Pokemon

attr_accessor :id, :name, :type, :db, :hp

def initialize(id: nil,name:,type:,db:, hp: 60)
  @id,@name,@type,@db, @hp = id, name, type, db, hp
end

def self.save(name, type, db)
  sql = <<-SQL
    INSERT INTO pokemon (name, type)
    values (?, ?)
  SQL
  db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL
    about_pokemon = db.execute(sql, id).first
    new = Pokemon.new(id:about_pokemon[0], name:about_pokemon[1], type:about_pokemon[2], db:db, hp:about_pokemon[3])
  end


  def alter_hp(hp, db)
    self.hp = hp
    sql = <<-SQL
     UPDATE pokemon SET hp = ? WHERE id = ?
    SQL
    db.execute(sql, hp, self.id)
   #db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
