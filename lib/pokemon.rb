
class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(arg)
      
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end

    def self.find(id, db)
        result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
        new_pokemon = Pokemon.new(result)
        new_pokemon.id = result[0]
        new_pokemon.name = result[1]
        new_pokemon.type = result[2]
        new_pokemon
    
    end
end
