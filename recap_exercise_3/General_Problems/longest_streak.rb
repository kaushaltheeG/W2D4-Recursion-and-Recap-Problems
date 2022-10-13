=begin
Write a method longest_streak(str) that accepts a string as an arg. 
The method should return the longest streak of consecutive characters in the string. 
If there are any ties, return the streak that occurs later in the string.

ex
longest_streak('a')           # => 'a'
longest_streak('accccbbb')    # => 'cccc'
longest_streak('aaaxyyyyyzz') # => 'yyyyy
longest_streak('aaabbb')      # => 'bbb'
longest_streak('abc')         # => 'c'
=end 

def longest_streak(str)
    str_hash = hash_helper(str)
    longest_streak = str_hash.values
    return longest_streak[-1] if longest_streak.all? {|a| a.length == longest_streak[0].length}
    longest_streak.max {|a, b| a.length <=> b.length}
end

def hash_helper(str)
    hash = Hash.new {|h,k| h[k] = ''}
    str.each_char {|char| hash[char] += char}
    hash
end


p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
 p longest_streak('abc')         # => 'c'