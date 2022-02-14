def with_debugging
  puts "Got Here!"
  result = yield
  puts "Result was #{result}"
end

with_debugging do
  magic_number = (23 - Time.now.hour) * Math::PI
  magic_number
end

def with_expectation(expected_result)
  puts "\nRunning test..."
  result = yield
  if result == expected_result
    puts "Passed."
  else
    puts "Failed!"
    puts "  Expected: #{expected_result}"
    puts "  Got:#{" ".ljust(6, " ")}#{result}"
  end
end

with_expectation(4) { 2 + 2 }
with_expectation(4) { 2 + 1 }
