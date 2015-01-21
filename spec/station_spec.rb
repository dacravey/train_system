require("spec_helper")

describe(Station) do
  describe("name") do
    it("returns the name of the station") do
      test_station = Station.new({:name => "Central"})
    end
  end

  describe('#all') do
    it("is empty at first") do
      expect(Station.all()).to eq([])
    end
  end

  describe('#save') do
    it("adds a station to the station table") do
      test_station = Station.new({:name => "Central"})
      test_station.save()
      expect(Station.all()).to eq([test_station])
    end
  end
end
