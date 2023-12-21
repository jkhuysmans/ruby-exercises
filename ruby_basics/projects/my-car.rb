class Vehicle 

  def age 
    puts "The car is #{age_of_vehicle} years old."
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@number_of_vehicles += 1
  end

  attr_accessor :color
  attr_reader :year

  def spray_paint=(color)
      @color = color
  end

  def self.gas_mileage(gallons, miles)
      puts "#{miles / gallons} miles per gallon of gas"
  end

  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "#{@@number_of_vehicles} car(s) have been initialized"
  end

end

private 

def age_of_vehicle
  current_time = Time.now.year
  current_time - self.year
end


module TowingCapacity
  def can_tow?(pounds)
    pounds < 2000
  end
end

class MyCar < Vehicle

    def to_s
        "This car is a #{@model} from #{@year}, and its color is #{@color}."
    end

    NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  include TowingCapacity

    NUMBER_OF_DOORS = 2

    def to_s
      "This truck is a #{@model} from #{@year}, and its color is #{@color}."
    end
end
  
  lumina = MyCar.new(1997, 'chevy lumina', 'white')
  lumina.speed_up(20)
  lumina.current_speed
  lumina.speed_up(20)
  lumina.current_speed
  lumina.brake(20)
  lumina.current_speed
  lumina.brake(20)
  lumina.current_speed
  lumina.shut_down
  lumina.current_speed
  puts ""
  puts lumina.color
  puts lumina.year
  lumina.color = "red"
  puts lumina.color

  lumina.spray_paint = "blue"
  puts lumina.color

  MyCar.gas_mileage(14, 346)
  puts lumina
  Vehicle.number_of_vehicles

  puts "---- MyCar ancestors ----"
  puts MyCar.ancestors
  puts "---- MyTruck ancestors ----"
  puts MyTruck.ancestors
  puts "---- Vehicle ancestors ----"
  puts Vehicle.ancestors

  puts lumina.age
