class Pokemon

    attr_accessor :name, :type, :db, :id

    def initialize(arg)

    end

    def self.save(name, type, db) 
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id)[0]
        new_pokemon = new(pokemon)
        new_pokemon.id = pokemon[0]
        new_pokemon.name = pokemon[1]
        new_pokemon.type = pokemon[2]
        new_pokemon
    end
end
