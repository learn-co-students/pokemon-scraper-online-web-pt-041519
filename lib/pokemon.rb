class Pokemon
	attr_accessor :name, :type, :db, :hp
	attr_reader :id

	def initialize(id:nil, name:, type:, db:nil, hp:nil)
		@id = id
		@name = name
		@type = type
		@db = db
		@hp = hp
	end

	def self.save(name, type, db)
		new_pokemon = Pokemon.new(name:name,type:type,db:db)
		new_pokemon.name = name
		new_pokemon.type = type
		new_pokemon.db = db
		new_pokemon

		sql = <<-SQL
		INSERT INTO pokemon (name, type)
		VALUES (?, ?)
		SQL

		new_pokemon.db.execute(sql,new_pokemon.name,new_pokemon.type)
		@id = new_pokemon.db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
		# DB[:conn].execute(sql, id)

	end


	def self.new_from_db(row)
  new_pokemon = self.new(id:row[0], name:row[1], type:row[2], hp:row[3])  # self.new is the same as running Song.new
  # new_pokemon.id = row[0]
  # new_pokemon.name =  row[1]
  # new_pokemon.type = row[2]
  new_pokemon  # return the newly created instance
end

	def self.find(id, db)
		sql = "SELECT * FROM pokemon WHERE id = ?"

		# to continue
		db.execute(sql, id).map do |row|
      self.new_from_db(row)
  end.first
		# self.save
	end



	def alter_hp(hp, db)
		sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
		# db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)

		# sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
		# # binding.pry
		db.execute(sql, hp, self.id)
	end

	# def hp()
	# 	sql = "SELECT hp FROM pokemon WHERE id = ?"
	# 	self.db.execute(sql, self.id)
	# end
end
