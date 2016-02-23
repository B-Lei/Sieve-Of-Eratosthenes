class SieveTable
  attr_accessor :space
  def initialize(cols=12, rows=12)
    @space = []
    y = 0
    x = 0
    rows.times do
      row = []
      cols.times do
        square = Square.new({:color => 'grey'})
        square.y = y
        square.x = x
        row.push square
        x += 1
      end
      y += 1
      x = 0
      @space.push row
    end
  end
end

class Square
  attr_reader :color, :x, :y
  def initialize(args)
    @color = args['color'] || 'grey'
  end

  def x=(x)
    @x = x
  end

  def y=(y)
    @y = y
  end
end
