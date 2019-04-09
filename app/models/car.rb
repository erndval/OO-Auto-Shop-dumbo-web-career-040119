class Car

  attr_reader :make, :model, :classification, :mechanic
  attr_accessor :car_owner, :mechanic

  @@all = []

  def initialize(make, model, classification)
    @make = make
    @model = model
    @classification = classification
    @@all << self
  end

  def self.all #1
    @@all
  end

  def self.car_conditions #2?
    @@all.map{|car| car.classification}
  end

  def expertise #3
    Mechanic.all.select{|mechanic| mechanic.specialty == self.classification}
  end

end
