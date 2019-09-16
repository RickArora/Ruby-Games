require 'byebug'

class Array
  def my_each(&prc) # takes in a proc input 
    self.length.times do |i| # read the length, i is the index
      prc.call(self[i]) # passes in the index @ i for the array
    end
    self # returns array
  end
  
  return_value = [1, 2, 3].my_each do |num|
    puts num
  end.my_each do |num|
    puts num
  end
  
  def my_select(&prc)
    truth_values_in_array = []
    self.my_each() do |el|
      if proc.call(el) == true 
        truth_values_in_array.push(el)
      end
    end
    truth_values_in_array
  end

  def my_reject(&prc) 
    false_values_in_array = []
    self.my_each() do |el|
      if proc.call(el) == false
        false_values_in_array.push(el)
      end
    end
    false_values_in_array
  end
  

  def my_any?(&prc) 
    self.my_each() do |el| 
      if proc.call(el) == true
        return true 
      end
    end
    return false
  end

  def my_all?(&prc)
    self.my_each() do |el|
      if proc.call(el) == false
        return false 
      end
    end
    return true
  end


  "testing my accept"
  a = [1, 2, 3]
  a.my_select { |num| num > 1 } # => [2, 3]
  a.my_select { |num| num == 4 } # => []

  "testing my reject"

  a.my_reject { |num| num > 1 } # => [1]
  a.my_reject { |num| num == 4 } # => [1, 2, 3]

  "testing my_any?"

  a.my_any? { |num| num > 1 } # => true
  a.my_any? { |num| num == 4 } # => false

  "testing my_all?"

  a.my_all? { |num| num > 1 } # => false
  a.my_all? { |num| num < 4 } # => true

p "testing my_flatten"

def my_flatten() 
  flat_array = []
  self.each do |el|
    if el.kind_of?(Array)
      el.my_flatten
    else 
      flat_array.push(el)
    end
  end 
  flat_array
end


[1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

def my_zip(*array) # takes an in put of n arguments named array
  self
  concatenated_arguments = array.unshift(self)
  concatenated_arguments
  new_array = [] # empty array 
  self.each_with_index do |el_outer, i| # iterates through selfs array 
    array_temp = [] # empty array
    concatenated_arguments.each do |el_inner| 
      array_temp.push(el_inner[i])
    end
    while array_temp.length < self.length
        array_temp.push("nil")
      end
    new_array.push(array_temp)
  end
  new_array
end

"testing my_zip"


a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
 [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
 a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
 [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]


c = [10, 11, 12]
d = [13, 14, 15]
[1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

def my_rotate(rotateIndex=1)
  if rotateIndex < 0
    rotateIndex = self.length + rotateIndex 
  end
  if rotateIndex > self.length
    rotateIndex = rotateIndex % self.length
  end
  self[rotateIndex..self.length] + self[0...rotateIndex]
end

a = [ "a", "b", "c", "d" ]
a.my_rotate         #=> ["b", "c", "d", "a"]
a.my_rotate(2)      #=> ["c", "d", "a", "b"]
a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
a.my_rotate(15)     #=> ["d", "a", "b", "c"]

def my_join(seperator = "")
  concatenated_string = ""
  self.each do |el|
    concatenated_string = concatenated_string + el + seperator
  end
  concatenated_string
end

a = [ "a", "b", "c", "d" ]
a.my_join         # => "abcd"
a.my_join("$")    # => "a$b$c$d"

def my_reverse
  copyOfSelf = []
  self.reverse_each do |el|
    copyOfSelf.push(el)
  end
  copyOfSelf
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]

end

def factors(num)
  listOfFactors = []
  (2...num).each do |el| 
    if num % el == 0
      listOfFactors.push(el)
    end
  end
  listOfFactors
end

p "factors test"

p factors(10)

p factors(7)


