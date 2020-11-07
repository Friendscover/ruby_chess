class Piece
  attr_accessor :name, :icon

  def initialize(name, icon)
    @name = name
    @icon = icon
  end

  def to_json(*a)
    {
      'json_class' => self.class.name,
      'data' => [name]
    }.to_json(*a)
  end

  def self.json_create(o)
    new(*o['data'])
  end
end
