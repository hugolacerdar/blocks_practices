require "open-uri"
require "timeout"

def try_with_timeout(timeout_in_secs)
  begin
    Timeout.timeout(timeout_in_secs) do
      yield
    end
  rescue Timeout::Error
    puts "Took too long!"
  end
end

try_with_timeout(2.0) do
  sleep 1.0
  puts "That was refreshing..."
end

try_with_timeout(2.0) do
  sleep 3.0
  puts "Yawn..."
end

web_page = try_with_timeout(1.0) do
  URI.open("http://example.com/")
end

puts web_page.read
