class Flyer
    attr_reader :name, :email, :miles_flown
  
    def initialize(name, email, miles_flown)
      @name = name
      @email = email
      @miles_flown = miles_flown
    end
  
    def to_s
      "#{name} (#{email}): #{miles_flown}"
    end
end
  
flyers = []

1.upto(5) do |n| 
    flyers << Flyer.new("Flyer #{n}", "flyer#{n}@example.com", 1000 * n) 
end

flyers.each {|f| puts "#{f.name} - #{f.miles_flown} miles"}

total_miles_flown = 0

flyers.each {|f| total_miles_flown += f.miles_flown}

puts "\nTotal miles flown: #{total_miles_flown}"

promotions = { "United" => 1.5, "Delta" => 2.0, "Lufthansa" => 2.5 }
puts "\n"
promotions.each {|k, v| puts "Earn #{v}x miles by flying #{k}!"}