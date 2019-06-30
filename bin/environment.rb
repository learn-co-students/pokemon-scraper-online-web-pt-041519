require 'bundler/setup'

Bundler.require

require 'pry'

require_relative "../lib/pokemon"
require_relative "../lib/scraper"
require_relative "sql_runner"

DB = {:conn => SQLite3::Database.new('../pokemon.db')}
DB[:conn].execute("DROP TABLE IF EXISTS pokemon;")
@sql_runner = SQLRunner.new(DB[:conn])
@sql_runner.execute_schema_migration_sql
