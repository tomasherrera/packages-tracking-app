class Package < ApplicationRecord
  validates :tracking_id, presence: true, uniqueness: true
  validates :weight, :content, :sender_address, :receiver_address, :sender_name, :receiver_name, presence: true
  enum status: [ "In Warehouse", "In Transport", "Delivered" ]
  scope :status, -> (status) { where status: status }
  scope :public_packages, -> { where.not(status: 2) }
  belongs_to :truck
  geocoded_by :current_location
  after_validation :sender_valid?, :receiver_valid?
  after_validation :geocode, on: :create
  before_validation :generate_tracking_id_and_current_location, on: :create
  before_validation :update_current_location, on: :update

  private 

  def generate_tracking_id_and_current_location
    range = [*'0'..'9',*'A'..'Z']
    self.tracking_id = (0...rand(4..7)).map{ range.sample }.join
    self.current_location = self.truck.fleet.location if self.truck.present?
  end

  def update_current_location
    geo_localization = "#{self.latitude},#{self.longitude}"
    self.current_location = Geocoder.search(geo_localization).first.address
  end

  def sender_valid?
    if Geocoder.coordinates(self.sender_address).nil?
      self.errors.add(:sender_address, "is not valid") 
      return false
    end
    return true
  end

  def receiver_valid?
    if Geocoder.coordinates(self.receiver_address).nil?
      self.errors.add(:receiver_address, "is not valid")
      return false
    else 
      country = Geocoder.search(self.receiver_address).first.country
      self.errors.add(:receiver_address, "cannot be outside the US") unless country == "United States"
    end
    return true
  end
end
