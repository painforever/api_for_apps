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
end

s = Songyu.new
s.send("name=", "lalalalal")
puts s.name