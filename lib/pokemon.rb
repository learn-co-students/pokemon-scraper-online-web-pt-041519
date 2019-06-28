class Pokemon

  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(id: nil, name:, type:, db:, hp: nil)
    @id, @name, @type, @db, @hp = id, name, type, db, hp
  end
  
  # Save instance data to database
	def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  # Find a pokemon from the database by id number; return new Pokemon object
  def self.find(id, db)
    # Select row from db by id
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL
    # Create new pokemon object from row
    db.execute(sql, id).map { |row| self.new(id:row[0], name:row[1], type:row[2], hp:row[3], db:db) }.first
  end

  # Update pokemon health points
  def alter_hp(new_hp, db)
    self.hp = new_hp
    sql = <<-SQL
      UPDATE pokemon 
      SET hp = ?
      WHERE id = ?
    SQL
    db.execute(sql, new_hp, @id)
  end

end
