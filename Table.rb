class Table
  attr_accessor :space, :numcols, :numrows, :input
  def initialize(cols, rows, inputNumber)
    iterator = 0
    @input = inputNumber
    @numcols = cols
    @numrows = rows
    @space = []
    y = 0
    x = 0
    rows.times do
      row = []
      cols.times do
        if iterator > inputNumber
          break
        end
        square = Square.new("grey")
        if iterator == 0 || iterator == 1
          square.color = "darkgrey"
        end
        square.y = y
        square.x = x
        square.value = iterator
        square.truth = true
        row.push square
        x += 1
        iterator += 1
      end
      y += 1
      x = 0
      @space.push row
    end
    #@space[0][0].color = "red"
  end
  # The actual Sieve algorithm (WIP)
  def sieve()
    @space[0][0].color = @space[0][1].color = "red"
    for i in 2..Math.sqrt(@input)
      
    end
=begin
    counter = 0
    @space.each do |p|
      next unless p
      break if p*p > inputNumber
      counter += 1
      (p*p).step(inputNumber,p) { |m| @space[0][0] = nil}
    end
=end
  end
end

class Square
  attr_reader :color, :x, :y, :value, :truth
  def initialize(color)
    @color = color
  end

  def color=(color)
    @color = color
  end

  def x=(x)
    @x = x
  end

  def y=(y)
    @y = y
  end

  def value=(value)
    @value = value
  end

  def truth=(truth)
    @truth = truth
  end
end
