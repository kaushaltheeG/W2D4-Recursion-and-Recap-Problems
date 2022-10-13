=begin
    The Lucas Sequence is a sequence of numbers. The first number of the sequence is 2. 
    The second number of the Lucas Sequence is 1. To generate the next number of the sequence, we add up the previous two numbers. 
    For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

    Write a method lucasSequence that accepts a number representing a length as an arg. 
    The method should return an array containing the Lucas Sequence up to the given length. Solve this recursively.

    ex:
        lucas_sequence(0)   # => []
        lucas_sequence(1)   # => [2]    
        lucas_sequence(2)   # => [2, 1]
        lucas_sequence(3)   # => [2, 1, 3]
        lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
        lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
=end

def lucas_sequence(n) #arr=[]
    return [] if n == 0
    return [2] if n == 1
    return [2, 1] if n == 2

    arr = lucas_sequence(n - 1) 
    next_ele = arr[-1] + arr[-2] 
    arr << next_ele

end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3]
p lucas_sequence(8)   # => [2, 1, 3]