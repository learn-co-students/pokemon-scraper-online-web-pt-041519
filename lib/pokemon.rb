require 'pry'
class Pokemon
  attr_accessor :name, :type, :id, :db, :hp

  def initialize(name:, type:, id: nil, db:, hp: 60)
    self.name, self.type, self.id, self.db, self.hp = name, type, id, db, hp
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL

    db.execute(sql, id).map { |row| self.new(name: row[1], type: row[2], id: row[0], db: db, hp: row[3]) }.first
  end

  def alter_hp(new_hp, db)
    sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
    db.execute(sql, new_hp, self.id)
  end
end
