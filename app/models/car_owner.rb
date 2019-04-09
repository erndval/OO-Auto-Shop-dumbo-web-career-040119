class CarOwner
  attr_reader :name, :car
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all #1
    @@all
  end

  def garage #2
    Car.all.select{|car| car.car_owner == self}
  end

  def preferred_mechanics #3
    self.garage.map{|car| car.mechanic}.uniq
  end

  def self.average #4
    Car.all.size/@@all.size
  end

  def check_in(make, model, classification)
    new_job = Car.new(make, model, classification)
    new_job.car_owner = self
    new_job.mechanic = Mechanic.all.find{|mechanic| mechanic.specialty == new_job.classification}
  end

end
