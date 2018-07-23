class Node 
	attr_accessor :value, :next

	def initialize(value, next_node = nil)
		@value = value
		@next = next_node
		
	end
end




class LinkedList 

	def initialize
		@head = nil
	end
	
	def append(val)
		if @head.nil?
			@head = Node.new(val)
		else
			node = @head
			while node.next != nil
				node = node.next
			end	
			node.next = Node.new(val)
		end	
	end

	def prepend(val)
		@head = Node.new(val, @head)	
	end

	

	def list_size
		return 0 if @head.nil?
		node = @head
		list_size = 1
		while node.next != nil
			node = node.next
			list_size += 1	
		end
			return list_size
	end	

	def head
		return @head.value
	end

	def tail
		node = @head
		while node.next != nil
			node = node.next
		end
		return node.value
	end

	def at(index)
		node = @head
		count = 0
		max_size = list_size - 1	
		if index == max_size 
			return tail			
		elsif index == 0
			return head
		else	
			while count < index && node.next != nil
				node = node.next
				count +=  1
			end	
				if node.next.nil?
					print "No value at that index point"
				else
					return node.value	
				end	
			end
	end

	def pop
		node = @head
			while node.next
				prev = node
				node = node.next
			end
				prev.next = nil
				popped = node.value
				node = nil
				return popped
	end

	def contains(check_val)
			node = @head
			size = list_size
			size.times do 
				return true if node.value == check_val
					node = node.next
			end
				return false
	end

	def find(data)
			return "Value not in list" if contains(data) == false
			node = @head
			size = list_size
			size.times do |index|
				return index if node.value == data
				node = node.next 
			end
	end

	def print_list
		list_array = []
		node = @head
		while node != nil
			list_array<<node.value
			node = node.next
		end
		puts list_array.inspect
	end	

	def to_s
		return "nil" if list_size == 0
		string = ""
		size = list_size 
		node = @head
		size.times do |index|
			string<<"(#{node.value}) -> "
			node = node.next	
		end
		
		string <<"nil"
		return string	
	end

	def insert_at(data, index)
		if index == 0
			prepend(data) 
		elsif index > list_size
			append(data)		
		else
			node = @head
			(index - 1).times {node = node.next}
			new_next = node.next
			node.next = Node.new(data, new_next)
		end 
	end

	def delete_at(index)
		node = @head
		if index >= list_size
			puts "No entry at that index point"
			return nil 
		elsif index == 0
				node.value = node.next.value
				node.next = node.next.next	
		else
			(index - 1).times {node = node.next}
			node.next = node.next.next
		end			
	end

end




#### "Test of Linked List ++++++++++++++"###
test = LinkedList.new
test.append("banana")
test.prepend("apple")
test.prepend("pear")
test.prepend("orange")
test.append("fig")
test.append("watermelon")
test.append("blueberry")
test.append("onion")
test.append("potato")
test.prepend("carrot")
test.print_list
puts test.list_size
puts "head #{test.head}"
puts "tail #{test.tail}"
puts "#{test.at(3)} is at point 3"
puts "#{test.pop} removed" 
puts test.contains("watermelon")
puts test.find("fig")
puts test.to_s
test.insert_at("strawberry", 6)
test.insert_at("grapes", 0)

test.print_list
test.delete_at(0)
test.print_list
test.delete_at(5)
test.print_list