# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels_only = volArr_maker(words)
    pairs = []
    found_pairs = []

    vowels_only.each.with_index do |vol_word, i|
        found = false
        missing = missing_vowels(vol_word)
        vowels_only.each.with_index do |others, k| #[i+1..-1]
            found = missing.all? {|ele| others.include?(ele)}
            if found && !found_pairs.include?([words[k], words[i]])
                found_pairs << [words[i], words[k]]
                pair = words[i] + ' ' + words[k]
                pairs << pair
            end
        end 
    end
    
    pairs

end

def volArr_maker(words)
    vowel_arr = []
    vowels = 'aeiou'
    words.each do |word|
        new_str = ''
        word.each_char {|char| new_str += char if vowels.include?(char) && !new_str.include?(char)}
        vowel_arr << new_str
    end
    vowel_arr
end

def missing_vowels(vowel_str)
    vowels, new_arr = 'aeiou', []
    vowels.each_char {|char| new_arr << char if !vowel_str.include?(char)}
    new_arr
end




# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |n|
        return true if num % n == 0
    end 
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    str_arr = str.split(' ')
    found = []
    bigrams.each do |ele|
        str_arr.each do |word|
            found << ele if word.include?(ele) && !found.include?(ele)
        end
    end
    found
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new { |k, v| k == v}
        hash = Hash.new

        self.each do |k, v|
            hash[k] = v if prc.call(k,v)
        end

        hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        subs = []
        i = 0
        k = 0
        
        while i < self.length
            subs << self[i..k] if self[i..k] != ""
            k += 1 if k < self.length
            if k == self.length
                i += 1
                k = 1
            end
        end

        return length ? subs.filter {|ele| ele.length == length} : subs
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = ("a".."z").to_a
        new_str = ''
        self.each_char.with_index do |char, i|
            alpha_idx = alpha.index(char)
            new_i = alpha_idx + num
            new_i -= 26 if new_i > 25
            new_str += alpha[new_i]
        end
        new_str
    end
end
