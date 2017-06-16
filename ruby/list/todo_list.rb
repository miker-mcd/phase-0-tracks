# Create TodoList class
# Create initialize method
# Create get_item method
# Create add_item method
# Create delete_item method
# Create get_item method

class TodoList

  def initialize(array)
    @list = array
  end

  def get_items
    @list
  end

  def add_item(item)
    @list << item
  end

  def delete_item(item)
    @list.delete(item)
  end

  def get_item(index)
    @list[index]
  end

end