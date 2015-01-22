class Station
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = nil
  end

  define_singleton_method(:all) do
    returned_stations = []
    stations = DB.exec("SELECT * FROM stations;")

    stations.each() do |station|
      name = station.fetch("name")
      id = station.fetch("id")
      returned_stations.push(Station.new({:name => name, :id => id}))
    end

    returned_stations
  end

  define_singleton_method(:find) do |id|
    Station.all().each() do |station|
      if station.id().==(id)
        return station
      end
    end
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_station|
    self.name().==(another_station.name())
  end


end
