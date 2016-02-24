class Table
  attr_accessor :space, :numcols, :numrows
  def initialize(cols, rows, inputNumber)
    iterator = 1
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
    @space[0][0].color = "red"
    counter = 0
    @space.each do |p|
      next unless p
      break if p*p > inputNumber
      counter += 1
      (p*p).step(inputNumber,p) { |m| @space[m/@numcols][m % @numrows] = nil}
    end
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
