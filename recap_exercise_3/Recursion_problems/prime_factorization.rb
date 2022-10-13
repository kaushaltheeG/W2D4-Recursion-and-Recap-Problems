=begin
The Fundamental Theorem of Arithmetic states that every positive integer is either a prime or can be represented as a product of prime numbers.

Write a method prime_factorization(num) that accepts a number and returns an array representing the prime factorization of the given number. 
This means that the array should contain only prime numbers that multiply together to the given num. 
The array returned should contain numbers in ascending order. Do this recursively.

Ex:
    p prime_factorization(12)     # => [2, 2, 3]
    prime_factorization(24)     # => [2, 2, 2, 3]
    prime_factorization(25)     # => [5, 5]
    prime_factorization(60)     # => [2, 2, 3, 5]
    prime_factorization(7)      # => [7]
    prime_factorization(11)     # => [11]
    prime_factorization(2017)   # => [2017]
=end



def prime_factorization(n, arr=[])
    return [n] if is_prime?(n)
    (2...n).each do |div|
        if n % div == 0
            arr = prime_factorization(div, arr)
            arr += prime_factorization(n/div, arr )
            break
        end
    end
    arr 
end

def is_prime?(num)
    (2...num).each {|n| return false if num % n == 0}
    true
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(49)      # => [7, 7]
p prime_factorization(22)     # => [2, 11]
p prime_factorization(2017)   # => [2017]