class Special < ApplicationRecord
  belongs_to :comedian
  validates_presence_of :name, :runtime_mins, :comedian_id, :image_url
end
