class Station
  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_stations = []
    stations = DB.exec("SELECT * FROM stations;")

    stations.each() do |station|
      name = station.fetch("name")
      returned_stations.push(Station.new({:name => name}))
    end

    returned_stations
  end

  define_method(:save) do
    DB.exec("INSERT INTO stations (name) VALUES ('#{@name}');")
  end

  define_method(:==) do |another_station|
    self.name().==(another_station.name())
  end


end
