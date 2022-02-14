require "benchmark"

def time_it(description)
  elapsed_time = Benchmark.realtime do
    yield
  end
  puts "#{description} took #{elapsed_time}"
end

time_it("Sleepy code") do
  sleep(1)
end
