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
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      Values (?,?)
    SQL

    db.execute(sql, name, type)

    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)

    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL

    ele = db.execute(sql, id).first

    Pokemon.new(id:ele[0], name:ele[1], type:ele[2], db: db, hp: ele[3])
  end

  def alter_hp(hp, db)
   
    sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
    
    db.execute(sql, hp, self.id)
    self.hp = hp
   
  end

end
