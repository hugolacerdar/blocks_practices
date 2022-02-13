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