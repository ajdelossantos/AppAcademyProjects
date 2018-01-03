require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  count = HashMap.new
  string.chars.each { |letter| count.include?(letter) ? count[letter] += 1 : count[letter] = 1 }

  odds = 0
  count.each { |_letter, count| odds += 1 if count.odd? }

  odds > 1 ? false : true
end
