require('spec_helper')

describe(Stop) do
  describe("#line_id") do
    it("returns the id of the line of the stop") do
      test_stop = Stop.new({ :line_id => 1, :station_id => 2 })
      expect(test_stop.line_id()).to eq(1)
    end
  end

  describe("#station_id") do
    it("returns the id of the station of the stop") do
      test_stop = Stop.new({ :line_id => 1, :station_id => 2 })
      expect(test_stop.station_id()).to eq(2)
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Stop.all()).to eq([])
    end
  end

  describe("#save") do
    it("add the station_id and line_id of the stop object to the stop table") do
      test_stop = Stop.new({ :line_id => 1, :station_id => 2 })
      test_stop.save()
      expect(Stop.all()).to eq([test_stop])
    end
  end

  describe("#==") do
    it("sets equal stops with the same line_id and station_id") do
      test_stop = Stop.new({ :line_id => 1, :station_id => 2 })
      test_stop.save()
      test_stop2 = Stop.new({ :line_id => 1, :station_id => 2 })
      test_stop2.save()
      expect(test_stop).to eq(test_stop2)
    end
  end

  describe(".stations") do
    it("returns all stations for a given line_id") do
    test_line = Line.new({ :number => 99, :id => nil})
    test_line.save()
    test_station = Station.new( {:name => "central", :id => nil})
    test_station.save()
    line_id = test_line.id()
    station_id = test_station.id()
    test_stop = Stop.new({ :line_id => line_id, :station_id => station_id })
    test_stop.save()
    expect(Stop.stations(test_line)).to eq([test_station])
    end
  end
end
