class Stop
  attr_reader(:line_id, :station_id)

  define_method(:initialize) do |attributes|
    @line_id = attributes.fetch(:line_id)
    @station_id = attributes.fetch(:station_id)
  end

  define_singleton_method(:all) do
    returned_stops = []
    stops = DB.exec("SELECT * FROM stops;")
    stops.each() do |stop|
      line_id = stop.fetch("line_id").to_i()
      station_id = stop.fetch("station_id").to_i()
      returned_stops.push(Stop.new({ :line_id => line_id, :station_id => station_id }))
    end
    returned_stops
  end

  define_singleton_method(:stations) do |line_object|
    matching_stations = []
    stops = DB.exec("SELECT * FROM stops WHERE line_id = #{line_object.id()};")
    stops.each() do |stop|
      station_id = stop.fetch("station_id").to_i()
      station = DB.exec("SELECT * FROM stations WHERE id = #{station_id};")
      name = station.first().fetch("name")
      matching_stations.push(Station.new({ :id => station_id, :name => name }))
    end
    matching_stations
  end

  define_method(:save) do
    DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{@station_id}, #{@line_id});")
  end

  define_method(:==) do |another_stop|
    self.line_id().==(another_stop.line_id()).&(self.station_id().==(another_stop.station_id()))
  end
end
