class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name, :age, :birthplace

  def self.filter_by_age(age)
    where(age: age.to_i)
  end

  def count_specials
    Special.where(comedian_id: self.id).count
  end

  def self.average_age
    average(:age)
  end

  def self.unique_cities
    select(:birthplace).distinct.pluck(:birthplace)
  end

  def self.unique_ages
    select(:age).distinct.pluck(:age)
  end
end
