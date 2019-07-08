class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(keywords)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(num, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ?
    SQL
    pokemon = db.execute(sql, num).first
    new_pokemon = Pokemon.new(pokemon)

    new_pokemon.id = pokemon[0]
    new_pokemon.name = pokemon[1]
    new_pokemon.type = pokemon[2]

    return new_pokemon
  end

  # def alter_hp(new_hp, db)
  #   sql = <<-SQL
  #     UPDATE pokemon SET hp = ? WHERE id = ?
  #   SQL
  #
  #   db.execute(sql, new_hp, self.id).first
  #   self.hp = new_hp
  # end

end
