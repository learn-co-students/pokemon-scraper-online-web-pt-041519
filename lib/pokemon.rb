class Pokemon

  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(id=nil, name, type, dp)
    @id = id
    @name = name
    @type = type
    @dp = dp
  end

  def self.save
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)")
  end

end
