class Mechanic

  attr_reader :name, :specialty, :car

  @@all = []

def initialize(name, specialty)
  @name = name
  @specialty = specialty
  @@all << self
end

def self.all #1
  @@all
end

def client_cars #2
  Car.all.select{|car| car.mechanic == self}
end

def clients #3
  self.client_cars.map{|car| car.car_owner}
end

def client_names #4
  self.clients.map{|owner| owner.name}
end

end
