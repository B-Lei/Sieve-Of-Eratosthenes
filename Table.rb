class Table
  attr_accessor :space, :numcols, :numrows, :input, :primeList
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
  end
  # The actual Sieve algorithm. colors non-prime boxes red.
  def sieve()
    @primeList = []
    @space[0][0].color = @space[0][1].color = "red"
    @space[0][0].truth = @space[0][1].truth = false
    for i in 2..Math.sqrt(@input+1)
      j = i**2
      if @space[i / @numcols][i % @numcols].truth == true
        while (j < @input+1)
          @space[j / @numcols][j % @numcols].truth = false
          @space[j / @numcols][j % @numcols].color = "red"
          j += i
        end
      end
    end
    # Color the remaining boxes green
    for i in 2..@input
      if @space[i / @numcols][i % @numcols].truth == true
        @space[i / @numcols][i % @numcols].color = "green"
        @primeList.push @space[i / @numcols][i % @numcols].value
      end
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
