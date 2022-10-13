=begin
    Background: 
                A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, called the key. 
                Given a key of 3, for example: a -> d, p -> s, and y -> b.

                A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. 
                For example, if we encrypt "bananasinpajamas" with the key sequence [1, 2, 3], then the result would be "ccqbpdtkqqcmbodt":
                Example: 
                    # Message:  b a n a n a s i n p a j a m a s
                    # Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
                    # Result:   c c q b p d t k q q c m b o d t

    Description: 
        Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message. 
        Assume that the message consists of only lowercase alphabetic characters.
    Test Cases:
        p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
        p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
        p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
        p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
        p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

=end

def vigenere_cipher(message, key)
    i,vig_cip = 0,''
    alpha = ('a'..'z').to_a

    message.each_char do |char|
        alpha_idx = alpha.index(char)
        new_idx = alpha_idx + key[i] > 25 ? (alpha_idx + key[i]) - 26  : alpha_idx + key[i]
        vig_cip += alpha[new_idx]

        i == key.length-1 ? i = 0 : i += 1
    end

    vig_cip
 end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"