=begin
The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.

Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

Write a program that deciphers and prints each of these names.
=end

ALPHABET = ("a".."z")
ROT13KEY = ("a".."z").to_a * 2

name_list = "Nqn Ybirynpr\nTenpr Ubccre\nNqryr Tbyqfgvar\nNyna Ghevat\nPuneyrf Onoontr\nNoqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv\nWbua Ngnanfbss\nYbvf Unvog\nPynhqr Funaaba\nFgrir Wbof\nOvyy Tngrf\nGvz Orearef-Yrr\nFgrir Jbmavnx\nXbaenq Mhfr\nFve Nagbal Ubner\nZneiva Zvafxl\nLhxvuveb Zngfhzbgb\nUnllvz Fybavzfxv\nTregehqr Oynapu"

def rot13(string)
  output_string = ""
  string.each_char do |char|
    if !ROT13KEY.include?(char.downcase)
      output_string << char
    else
      decode_index = ROT13KEY.index(char.downcase) + 13
      output_string << ROT13KEY[decode_index]
    end
  end
  output_string
end

# def rot13(string)
#   output = ""
#   string.each_char do |char|
#     if !ALPHABET.include?(char.downcase)
#       output << char
#     else
#       decoded_char = char.clone
#       13.times {decoded_char.next!}
#       output << decoded_char[-1]
#     end
#   end
#   output
# end

puts rot13(name_list)