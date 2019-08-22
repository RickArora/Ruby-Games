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

def my_zip(*array)
  new_array = []
  self.each_with_index do |el_outer, i|
    array_temp = []
    self.each do |el_inner|
      array_temp.push(el_inner * i)
    end
    new_array.push(array_temp)
  end
  new_array
end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
[1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

end

