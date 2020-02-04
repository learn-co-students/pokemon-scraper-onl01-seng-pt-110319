class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(args)
    args.each { |k, v| self.send("#{k}=", v) }
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    self.all(db).find { |pokemon|
      pokemon.id == id
    }
  end

  def self.all(db)
    sql = "SELECT * FROM pokemon"
    db.execute(sql).map { |pokemon|
      Pokemon.new_from_db(pokemon)
    }
  end

  def self.new_from_db(row)
    Pokemon.new({:id => row[0], :name => row[1], :type => row[2], :db => row[3]})
  end
end
