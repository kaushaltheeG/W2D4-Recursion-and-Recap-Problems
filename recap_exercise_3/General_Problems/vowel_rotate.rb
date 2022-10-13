=begin
Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel that appears before it sequentially in the original string. 
The first vowel of the string should be replaced with the last vowel.

Example:
    p vowel_rotate('computer')      # => "cempotur"
    p vowel_rotate('oranges')       # => "erongas"
    p vowel_rotate('headphones')    # => "heedphanos"
    p vowel_rotate('bootcamp')      # => "baotcomp"
    p vowel_rotate('awesome')       # => "ewasemo"
=end


def vowel_rotate(str)
    new_str, vowels = '', 'aeiou'
    rotated = reverse_rotate(get_vowels(str))
    str.each_char {|char| new_str += vowels.include?(char) ? rotated.shift : char}
    new_str
end

def get_vowels(str)
    vowels = 'aeiou'
    vols = []
    str.each_char {|char| vols << char if vowels.include?(char) }
    vols
end

def reverse_rotate(arr)
    arr.unshift(arr.pop)
end


p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"