class GoodDog
    attr_accessor :name, :height, :weight

    def initialize(n, h, w)
        self.name = n
        self.height = h
        self.weight = w
    end

    def change_info(n, h, w)
        self.name = n
        self.height = h
        self.weight = w
    end

    def info
        "#{self.name} weighs #{self.weight} and is #{self.height} tall."
      end

    def what_is_self
        self
      end
end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info 
sparky.change_info("Sparky", "13 inches", "11 lbs")
puts sparky.info

p sparky.what_is_self




