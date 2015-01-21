require("spec_helper")

describe(Line) do
  describe("number") do
    it("returns the number of the train line") do
      test_line = Line.new({:number => 1, :id => nil})
      expect(test_line.number()).to eq(1)
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Line.all()).to eq([])
    end
  end

  describe("#save") do
    it("adds the train line to the lines table") do
      test_line = Line.new({ :number => 1, :id => nil })
      test_line.save()
      expect(Line.all()).to eq([test_line])
    end
  end

  describe('#==') do
    it("sets equal objects with the same properties") do
      test_line = Line.new({:number => 1, :id => nil})
      test_line2 = Line.new({:number => 1, :id => nil})
      test_line.save()
      test_line2.save()
      expect(test_line).to eq(test_line2)
    end
  end
end
