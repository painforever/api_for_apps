class Songyu
  def initialize
    @name=""
  end

  def name
    @name
  end

  def name=(str)
    @name=str
  end

  def shabi
    puts local_variables
    x =1
    y=13
    puts local_variables
  end
end

s = Songyu.new
puts [1, 3, 4, 5, 7, 8, 9, 10, 12].slice_when { |a, b| a + 1 != b }