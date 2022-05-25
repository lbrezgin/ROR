vowels = ["a", "e", "i", "o", "u"]
letters_hash = Hash.new

vowels.each {|vowel| letters_hash[vowel] = vowel.ord - 96 }
p letters_hash
