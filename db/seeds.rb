file = File.open('db/fixtures/words', 'r')

file.each do |line|
  Word.create(value: line.chomp)
end
