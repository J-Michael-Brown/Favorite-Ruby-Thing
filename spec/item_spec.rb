require('rspec')
require('item')

describe("Item") do
  before() do
    Item.clear
  end

  describe(".all") do
    it("is empty at first") do
      expect(Item.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an item to the list of items") do
      item = Item.new("tacos")
      item.save
      expect(Item.all()).to(eq([item]))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      item = Item.new("tacos")
      item.save
      Item.clear
      expect(Item.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      item = Item.new("tacos")
      item.save
      item2 = Item.new("pizza")
      item2.save
      expect(item.id()).to(eq(1))
      expect(item2.id()).to(eq(2))
    end
  end

  describe(".find") do
    it("finds an item based on its id") do
      item = Item.new("tacos")
      item.save
      item2 = Item.new("pizza")
      item2.save
      expect(Item.find(1)).to(eq(item))
      expect(Item.find(2)).to(eq(item2))
    end
  end

  describe("#increase_score") do
    it("increases an item's score when it is viewed") do
      item = Item.new("tacos")
      item.save
      expect(item.increase_score()).to(eq(1))
    end
  end

  describe(".sort") do
    it("sorts the class list of objects based score of the item") do
      taco = Item.new("tacos")
      taco.increase_score(1)
      taco.save
      pizza = Item.new("pizza")
      pizza.increase_score(3)
      pizza.save
      icecream = Item.new("icecream")
      icecream.increase_score(2)
      icecream.save
      expect(Item.all).to(eq([taco,pizza,icecream]))
      expect(Item.sort).to(eq([pizza,icecream,taco]))
    end
  end

  describe("#validate") do
    it("checks whether an item already exists in the list before adding") do
      item1 = Item.new("tacos")
      item1.save
      item2 = Item.new("tacos")
      expect(item2.valid?).to(eq(false))
    end
  end
end
