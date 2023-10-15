pioneers = %q(
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
Tregehqr Oynapu)

alphabet = ('a'..'z').to_a

DECRYPT_KEY = {}

for idx in (0..(alphabet.size/2 - 1))
  DECRYPT_KEY[alphabet[idx]] = alphabet[idx + 13]
end

def char_case(end_char, upcase_it)
  if upcase_it
    end_char.upcase
  else
    end_char
  end
end

def decrypt(string)
  string.chars.map do |char|
    upcase_it = true if char.downcase != char
    begin_char = char.downcase

    if DECRYPT_KEY.has_key?(begin_char)
      end_char = DECRYPT_KEY[begin_char]
    elsif DECRYPT_KEY.has_value?(begin_char)
      end_char = DECRYPT_KEY.key(begin_char)
    else
      end_char = char
    end

    char_case(end_char, upcase_it)

  end.join
end

puts decrypt(pioneers)
