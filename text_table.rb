class Array
  def concatl(*a)
    return a.join
  end

  def pair
    r = Array.new 
    i = 0
    
    for elm in [*self]
      r << (yield i, elm)
      i += 1
    end 
    return r
  end

  def sum
    t = 0
    for i in self
      begin
        i = i.to_i
      rescue
        i = 0
      end
      t += i
    end
    return t
  end
end

class Table
  def calc_cell_sizes(table_data)
    @cell_sizes = Array.new table_data[0].size, 0
    for row in table_data
      raise "Expected Array" unless row.is_a? Array
      row.pair do |i,c|
        c = String.new c
        @cell_sizes[i] = c.size if c.size > @cell_sizes[i]
      end
    end
  end

  def initialize(*table_data)
    return make *table_data
  end

  def make(*table_data)
    raise "Expected header, and at least one row" if table_data.size < 2
    @rows = table_data

    calc_cell_sizes table_data
    @max_width = @cell_sizes.sum + (@cell_sizes.length * 3) + 1

    @table = build
    return self
  end

  def build
    table = line = "+" + ("-" * (@max_width - 2) ) + "+\n"

    return [
      table,
      @rows.pair do |n,row|
        r = Array.new
              
        r << [
          "|",
          row.pair { |y, cell| "-" * (@cell_sizes[y] + 2) }.join("+"),
          "|\n"
        ] if n == 1

        r << [
          "|",
          row.pair { |i, c| " " + [c].pack("A#{ @cell_sizes[i] }") }.join(' |'),
          " |\n"
        ]
      end,
      line
    ].join
  end

  def print
    puts @table
    return self
  end
end

