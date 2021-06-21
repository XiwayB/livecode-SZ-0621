class Recipe
  attr_reader :name, :description

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end

end
