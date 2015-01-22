require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/line")
require("./lib/station")
require("./lib/stop")
require("pg")

DB = PG.connect({:dbname => "train_system"})

get("/") do
  @lines = Line.all()
  @stations = Station.all()
  erb(:index)
end

post("/add_station") do
  name = params.fetch("name")
  new_station = Station.new({ :name => name, :id => nil })
  new_station.save()
  @lines = Line.all()
  @stations = Station.all()
  erb(:index)
end

post("/add_line") do
  number = params.fetch("number")
  new_line = Line.new({ :number => number, :id => nil })
  new_line.save()
  @lines = Line.all()
  @stations = Station.all()
  erb(:index)
end

get("/stations/:id") do
  @station = Station.find(params.fetch("id").to_i()).
  erb(:station)
end
