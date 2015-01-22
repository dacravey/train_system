class Line
  attr_reader(:number, :id)

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_lines = []
    lines = DB.exec("SELECT * FROM lines;")
    lines.each() do |line|
      number = line.fetch("number").to_i()
      id = line.fetch("id").to_i()
      returned_lines.push(Line.new({ :number => number, :id => id }))
    end
    returned_lines
  end

  define_singleton_method(:find) do |id|
    Line.all().each() do |line|
      if line.id().==(id)
        return line
      end
    end
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lines (number) VALUES (#{@number}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_line|
    self.number().==(another_line.number())
  end

end
