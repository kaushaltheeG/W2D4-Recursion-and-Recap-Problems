=begin
Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime. 
A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.
    Example:
        14 is a bi-prime because 2 * 7
        22 is a bi-prime because 2 * 11
        25 is a bi-prime because 5 * 5
        24 is not a bi-prime because no two prime numbers have a product of 24
    Test Cases:
        p bi_prime?(14)   # => true
        p bi_prime?(22)   # => true
        p bi_prime?(25)   # => true
        p bi_prime?(94)   # => true
        p bi_prime?(24)   # => false
        p bi_prime?(64)   # => false
=end

#need to retrive all the possible divisors and loop through the pairs to check if it prime 


def bi_prime?(num)
    (2...num).each do |div_1|
        if num % div_1 == 0
            return true if is_prime?(div_1) && is_prime?(num/div_1)
        end 
    end
    false
end


def is_prime?(num)
    (2...num).each {|ele| return false if num % ele == 0 }
    true
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false