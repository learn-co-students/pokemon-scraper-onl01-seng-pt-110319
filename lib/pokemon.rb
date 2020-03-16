class Pokemon
  attr_accessor :id ,:name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name 
    @type = type
    @db = db
  end
  
  def save(name, type, db)
    if self.id
      db.execute("UPDATE pokemon SET name = ? SET type = ? WHERE id = ? ",name,type,self.id)
      self.name = name 
      self.type = type
      new_pokemon = self
    else
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM students")[0][0]
    new_pokemon = self.new(id: @id name: name, type: type, db: db)
    end
    new_pokemon
  end
  
  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    if poke.length >-1
    name = poke[1]
    type = poke[2]
    poke_found = Pokemon.new(id: id, name: name, type: type, db: db)
    pokemon_found
 end

end
