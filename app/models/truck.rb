class Truck < ApplicationRecord
  belongs_to :fleet
  has_many :packages

  validates :fleet, presence: true

  def identifier
    "Truck #0#{self.id}"
  end
end
