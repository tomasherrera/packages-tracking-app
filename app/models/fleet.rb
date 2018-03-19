class Fleet < ApplicationRecord
  has_many :trucks
  scope :all_except, ->(fleet) { where.not(id: fleet) }
  validates :city, :state, presence: true
  validates :city, uniqueness: { scope: :state,
    message: "and state already have a fleet" }

  geocoded_by :location
  after_validation :geocode

  def location
    self.city + ', ' + self.state
  end

  def codename
    "#{self.city}"[0..3].upcase + self.state.upcase + self.id.to_s 
  end

  def infoname
    "#{self.city}"[0..3].upcase + self.state.upcase + self.id.to_s + " - " + self.city + ", " + self.state 
  end
end
