# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    max = num_1 * num_2
    start = num_1 > num_2 ? num_1 : num_2

    (start..max).each do |num|
        return num if num % num_1 == 0 && num % num_2 == 0
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    freq = freq_hash(str)
    max,bigram = 0,''

    freq.each do |key, val|
        if max < val    
            max = val
            bigram = key
        end
    end

    bigram
end

def freq_hash(str)
    hash = Hash.new {|h, k| h[k] = 0}
    i,k = 0,1

    while k < str.length
        sub = str[i..k]
        hash[sub] += 1
        k += 1
        i += 1
    end
    hash
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hash = Hash.new
        self.each do |key, val|
            hash[val] = key
        end 
        hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        found = []
        self.each do |ele|
            search = num - ele
            if self.include?(search) && !found.include?(search) 
                count += 1
                found.push(search, ele)
            end
        end
        count 
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new {|a,b| a <=> b}

        i = 1
        while i < self.length
            swapped = false
            prev,curr = self[i-1], self[i]
            
            if prc.call(prev, curr) == 1
                self[i-1], self[i] = self[i], self[i-1]
                swapped = true
            end
            
            swapped ? i = 1 : i += 1
        end

        self
    end
end
