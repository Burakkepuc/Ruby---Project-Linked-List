require_relative "node.rb"
class LinkedList
  attr_accessor :head

  @@length = 0

  def initialize
    @head = nil
  end

  def prepend(value)
    @head = Node.new(value, @head) # next node is current head, new head points new node.
    @@length += 1
  end

  def append(value)
    new_node = Node.new(value)
    current_node = @head

    if @head.nil?
      @head = Node.new(value, @head)
    else
      until current_node.next.nil? # traverse until end of the list
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
    current_node = @head # We have already 1 node at the beginning
    until current_node.next.nil?
      current_node = current_node.next
    end
    current_node.value
  end

  def at(value) # Starts from 0
    current_node = @head
    value.times do
      current_node = current_node.next
    end
    current_node
  end

  def pop
    if @head.nil?
      return "This list already empty"
    else
      current_node = @head
      popped_node = nil
      until current_node.next.next.nil?
        current_node = current_node.next
      end

      popped_node = current_node.next.value
      current_node.next = nil
      @@length -= 1
      popped_node
    end
  end

  def contains?(value)
    current_node = @head

    until current_node.nil?
      current_node.value
      if current_node.value == value
        return true
      end

      current_node = current_node.next
    end
    false
  end

  def find(value)
    if @head.nil?
      return "Not found a value"
    else
      current_node = @head
      value.times do # traverse until end of the list
        current_node = current_node.next
      end
      current_node.value
    end
  end

  def to_s
    if @head.nil?
      return "Not found a value"
    else
      current_node = @head
      until current_node.nil?
        print "(#{(current_node.value)}) -> "
        current_node = current_node.next
      end
      print " nil "
    end
    return " "
  end
end

linked_list = LinkedList.new
puts "Append and Prepend methods"
linked_list.append(5)
linked_list.append(6)
linked_list.prepend(4)
puts

puts "Pop method"
p linked_list.pop
puts

puts "Head value"
p linked_list.head
puts

puts "Tail value"
p linked_list.tail
puts

puts "List size"
p linked_list.size
puts

puts "String represantation"
puts linked_list
puts

puts "at method(returns node at the given index)"
p linked_list.at(0)

puts "find method(returns value at the given index)"
p linked_list.find(0)
