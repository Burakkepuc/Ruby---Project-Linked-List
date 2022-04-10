require_relative "node.rb"
class LinkedList
  attr_accessor :head
  @@length = 0
  
  def initialize
    @head = nil
  end

  def prepend(value)
    @head = Node.new(value,@head)
    @@length += 1
  end

  def append(value)
    new_node = Node.new(value)
    current_node = @head

    if @head.nil?
      current_node = new_node 
    else
      until current_node.next.nil? #traverse until end of the list
      current_node = current_node.next
    end
    current_node.next = new_node
    end
      @@length += 1
  end

  def size
    @@length
  end

  def head 
    @head.value
  end

   def tail 
     current_node = @head
    i = 1 # We have already 1 node at the beginning
    until current_node.next.nil?
      i +=1
      current_node = current_node.next
    end
    current_node.value
  end


  def at(value) # Starts from 0
    current_node = @head
    value.times do
      current_node = current_node.next
    end
    current_node.value
  end

  def contains?(value)
     current_node = @head
     
     until current_node.nil?
      p current_node.value
      if current_node.value == value
        return true
      end
      current_node = current_node.next
     end
     false
  end
  
end

  linked_list = LinkedList.new
  linked_list.prepend(4)
  linked_list.prepend(3)
  linked_list.append(5)

p linked_list.at(1)
