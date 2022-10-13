=begin
Extend the string class by defining a String#select method that accepts a block. 
The method should return a new string containing characters of the original string that return true when passed into the block. 
If no block is passed, then return the empty string. 
Do not use the built-in Array#select in your solution.

ex:
    p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
    p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
    p "HELLOworld".select          # => ""
=end


class String

    def select(&proc)
        return '' if !proc
        new_str = ''
        self.each_char { |char| new_str += char if proc.call(char)}
        new_str
    end


end


p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""