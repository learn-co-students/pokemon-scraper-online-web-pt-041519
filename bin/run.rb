require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")
#puts all_pokemon.inspect

# Find Nidoran
nidoran = Pokemon.find(29, @db)
puts nidoran.inspect
# #<Pokemon:0x00007ff6fd97e720 
#   @id=29, 
#   @name="Nidoran♀", 
#   @type="Poison",  
#   @db=#<SQLite3::Database:0x00007ff6fe9b3960 @tracefunc=nil, @authorizer=nil, @encoding=#<Encoding:UTF-8>, @busy_handler=nil, @collations={}, @functions={}, @results_as_hash=nil, @type_translation=nil, @readonly=false>, 
#   @hp=nil
# >

# Add hp column
@sql_runner.execute_create_hp_column

# Increase Nidoran's health
nidoran.alter_hp(120, @db)
puts nidoran.inspect
