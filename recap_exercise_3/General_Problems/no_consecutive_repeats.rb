=begin
Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. 
The method should return true if an element never appears consecutively in the array; it should return false otherwise.

Ex:
no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
no_consecutive_repeats?(['x'])                              # => true

=end

def no_consecutive_repeats?(arr)
    #return true if arr.length == 1 # not necessary
    arr.each.with_index {|ele, i| return false if ele == arr[i+1] && i+1 != arr.length}
    true
end


p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true
