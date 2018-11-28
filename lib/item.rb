class Item
  @@list = []
  attr_accessor :name
  attr_reader :id, :score

  def initialize(name)
    @name = name
    @id = @@list.length + 1
    @score = 0
  end

  def self.all
    @@list
  end

  def self.find(id)
    item_id = id.to_i()
    @@list.each do |item|
      if item.id == item_id
        return item
      end
    end
  end

  def save
    @@list.push(self)
  end

  def self.clear
    @@list = []
  end

  def increase_score(add_by =  1)
    @score += add_by
  end

  def self.sort
    @@list.sort_by! { |item| -item.score}
  end

  def valid?
    index = 0
    while index < @@list.length
      if @name == @@list[index].name
        return false
      end
      index += 1
    end
    true
  end

end
