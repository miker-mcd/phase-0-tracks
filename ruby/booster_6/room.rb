# ROOM CLASS
# Attributes:
# - name
# - width
# - length
# - items (a collection of Item instances)
# Methods:
# - getters for items, name, width, length
# - setter for items, name
# - total_value (adds up prices of items)
# - to_s override

# add require_relative so that file can reference objects in a different class file.
require_relative 'item'

class Room
  attr_reader :length, :width
  attr_accessor :items, :name

  def initialize(name, width, length)
    @name = name
    @width = width
    @length = length
    @items = []
  end

  def total_value
    total = 0
    @items.each do |item|
      total += item.price # .price from attr_reader in item.rb
    end
    total
  end

  def to_s
    "#{@name} #{@width} x #{@length}"
  end

end


# TEST CODE
# living_room = Room.new("Living room", 20, 35)
# puts living_room
# piano = Item.new("Piano","black", 10000)
# box = Item.new("cardboard box", "brown", 0)
# living_room.items << piano
# living_room.items << box
# puts living_room.total_value