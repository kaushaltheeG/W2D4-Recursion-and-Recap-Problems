=begin
Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

ex:
    no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
    no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
    no_dupes?([true, true, true])            # => []
=end

def no_dupes?(arr)
    non_dupes = []
    arr.each.with_index do |ele, i|
        non_dupes << ele if !arr[i+1..-1].include?(ele) && !arr[0...i].include?(ele)
    end
    non_dupes
end


p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []