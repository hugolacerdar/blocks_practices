class Flyer
    attr_reader :name, :email, :miles_flown
    attr_accessor :status
  
    def initialize(name, email, miles_flown, status=:bronze)
      @name = name
      @email = email
      @miles_flown = miles_flown
      @status = status
    end
  
    def to_s
      "#{name} (#{email}): #{miles_flown} - #{status}"
    end
end
  
flyers = []
flyers << Flyer.new("Larry", "larry@example.com", 4000, :platinum)
flyers << Flyer.new("Moe", "moe@example.com", 1000)
flyers << Flyer.new("Curly", "curly@example.com", 3000, :gold)
flyers << Flyer.new("Shemp", "shemp@example.com", 2000)
  
puts "\n"
frequent_flyers = flyers.select {|f| f.miles_flown >= 3000}
puts frequent_flyers
puts "\n"
infrequent_flyers = flyers.reject {|f| f.miles_flown >= 3000}
puts infrequent_flyers
puts "\n"
puts flyers.any? {|f| f.status == :platinum}
puts "\n"
first_bronze_flyer = flyers.detect {|f| f.status == :bronze}
puts first_bronze_flyer
puts "\n"

platinum_flyers, non_platinum_flyers = flyers.partition {|f| f.status == :platinum}
puts "Platinum flyers:"
puts platinum_flyers
puts "Non-platinum flyers:"
puts non_platinum_flyers
puts "\n"
tagged_flyers = flyers.map {|f| "#{f.name} (#{f.status.upcase})"}
p tagged_flyers
puts "\n"
totals_in_kms = flyers.map { |f| f.miles_flown * 1.6 }
p totals_in_kms
puts "\n"
miles_sum = flyers.reduce(0) {|acc, f| acc + f.miles_flown}
puts "Total miles: #{miles_sum}"
kms_sum = totals_in_kms.reduce(0, :+)
puts "Total kilometers: #{kms_sum}"


bronze_kms_flown = flyers.select {|f| f.status == :bronze}.reduce(0) {|acc, f| acc + f.miles_flown * 1.6}
puts "\nKilometers flown by bronze flyers: #{bronze_kms_flown}"

top_client = flyers.max_by {|f| f.miles_flown}
puts "\nTop flyer: #{top_client}"