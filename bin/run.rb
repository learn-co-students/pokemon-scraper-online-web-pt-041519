require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!

db = SQLite3::Database.new('../db/pokemon.db')
sql_runner = SQLRunner.new(db)

sql_runner.execute_sql_file
