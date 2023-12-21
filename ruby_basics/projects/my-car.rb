class MyCar

    def initialize(year, model, color)
      @year = year
      @model = model
      @color = color
      @current_speed = 0
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

    attr_accessor :color
    attr_reader :year

    def spray_paint=(color)
        @color = color
    end

    def self.gas_mileage(gallons, miles)
        puts "#{miles / gallons} miles per gallon of gas"
    end

    def to_s
        puts "This car is a #{@model} from #{@year}, its color is #{@color}"
    end

  end

  class Vehicle 

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