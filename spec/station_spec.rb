require("spec_helper")

describe(Station) do
  describe("#name") do
    it("returns the name of the station") do
      test_station = Station.new({:name => "Central", :id => nil})
      expect(test_station.name()).to eq("Central")
    end
  end

  describe('.all') do
    it("is empty at first") do
      expect(Station.all()).to eq([])
    end
  end

  describe('#save') do
    it("adds a station to the station table") do
      test_station = Station.new({:name => "Central", :id => nil})
      test_station.save()
      expect(Station.all()).to eq([test_station])
    end
  end

  describe('#==') do
    it("sets equal objects with the same properties") do
      test_station = Station.new({:name => "Central", :id => nil})
      test_station2 = Station.new({:name => "Central", :id => nil})
      test_station.save()
      test_station2.save()
      expect(test_station).to eq(test_station2)
    end
  end
end
