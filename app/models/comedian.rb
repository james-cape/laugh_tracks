class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name, :age, :birthplace, :image_url

  def self.filter_by_age(age)
    where ({age:age})
  end

end
