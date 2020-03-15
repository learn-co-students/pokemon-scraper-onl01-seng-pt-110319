class Pokemon
  attr_accessor :id ,:name, :type, :db
  
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name 
    @type = type
    @db = db
  end
  
  def save(name:, type:, db:)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, database_connection)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]
    pokemon_found = Pokemon.new(id: id, name: name, type: type, db: database_connection)
    pokemon_found
 end
end
