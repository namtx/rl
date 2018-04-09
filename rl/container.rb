class Container
  def initialize
    @data = {}
  end

  def resolve key
    @data.fetch key
  end

  def register key, value
    @data[key] = value
  end
end
