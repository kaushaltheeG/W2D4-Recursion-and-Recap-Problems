=begin
Write a method multiply(a, b) that takes in two numbers and returns their product.

        You must solve this recursively (no loops!)
        You must not use the multiplication (*) operator

Ex:
   p multiply(3, 5)        # => 15
   p multiply(5, 3)        # => 15
   p multiply(2, 4)        # => 8
   p multiply(0, 10)       # => 0
   p multiply(-3, -6)      # => 18
   p multiply(3, -6)       # => -18
   p multiply(-3, 6)       # => -18


=end


def multiply(a,b)
    if a.negative? && b.negative?
        b = -b #changes -b to +b
        a = -a #changes -a to +a
    elsif a.negative? && !b.negative?
        a = -a #changes -a to +a
        b = -b #changes b to +b
    end 

    return 0 if a == 0
    a = a.negative? ? a+1 : a-1

    (a.negative?) ^ (b.negative?) ? b + multiply(a,b) : b.abs + multiply(a, b)

end

p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18