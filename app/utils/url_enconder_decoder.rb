module UrlEnconderDecoder
  class Bijective
    ALPHABET =
      "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
      # make your own alphabet using:
      # (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).shuffle.join

    def encode(i)
      # from http://refactormycode.com/codes/125-base-62-encoding
      # with only minor modification
      raise TypeError.new("Not an integer") unless i.is_a? Integer
      return ALPHABET[0] if i == 0
      s = ''
      base = ALPHABET.length
      while i > 0
        s << ALPHABET[i.modulo(base)]
        i /= base
      end
      s.reverse
    end

    def decode(s)
      # based on base2dec() in Tcl translation 
      # at http://rosettacode.org/wiki/Non-decimal_radices/Convert#Ruby
      raise TypeError("Not a string") unless i.is_a? String
      i = 0
      base = ALPHABET.length
      s.each_char { |c| i = i * base + ALPHABET.index(c) }
      i
    end
  end
end