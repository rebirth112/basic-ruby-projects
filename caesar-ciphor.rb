#ordinal numbers for symbols:
#space = 32, ! = 33, comma = 44, period = 46, single quote = 39. These numbers should not be replaced
def caesar_cipher(string, num)
    new_string = string.split('')
    remember_upcase_indexes = new_string.each_index.select{|i| new_string[i] == new_string[i].upcase}
    #ASCII characters vary depending on upper and lower case. Store indexes of values that changed, and then downcase everything
    lower_list = string.downcase.split('')
    ###Below checks if num is above 26 or below -26 and recorrects so we fall in the range of 97 to 122
    if num > 26
        d = num.div(26)
        num = num - (26*d)
    elsif num < -26
        d = num.div(-26)
        num = num + (26*d)
    end
    new_lower_list = lower_list.map { |c| c.ord }
    new_lower_list.map! do |n|
        if n == 32 || n == 33 || n == 44 || n == 46 || n == 39
          n
        else
        #recorrecting values above 122 and below 97
          if n+num > 122
            n = (n+num) - 122 + 96
          elsif n+num < 97
            n = 123 - (97 - (n+num))
          else
            n+num
          end
        end
      end
      new_lower_list
      reconvert_list = new_lower_list.map{ |x| x.chr}
      remember_upcase_indexes.each do |v|
        reconvert_list[v] = reconvert_list[v].upcase
      end
      return reconvert_list.join('')
end

p caesar_cipher('Hello World', 75)
p caesar_cipher('Hello World', -55)
p caesar_cipher("What a string!", 5)

