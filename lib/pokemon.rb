class Pokemon

  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id: nil, name:, type: , db:)
    @id = id
    @name = name
    @type = type
    @db = db
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

    Pokemon.new(id:ele[0], name:ele[1], type:ele[2], db: db)
  end

end
