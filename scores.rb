scores = [83, 71, 92, 64, 98, 87, 75, 69]

highscores = scores.select {|s| s > 80}
p highscores

lowscores = scores.reject {|s| s > 80}
p lowscores

puts scores.detect {|s| s < 70}

p scores
scores.select! {|s| s > 70}
p scores
scores.reject! {|s| s.even?}
p scores

scores = [83, 71, 92, 64, 98, 87, 75, 69]
scores_doubled = scores.map {|s| s * 2}
p scores_doubled

class_sum = scores.reduce(0,:+)
puts "Total score: #{class_sum}"

evens, odds = scores.partition {|s| s.even?}
puts "Evens:"
p evens
puts "Odds:"
p odds