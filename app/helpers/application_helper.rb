module ApplicationHelper
  def city_and_state(address)
    if Geocoder.coordinates(address).nil?
      return
    else 
      city = Geocoder.search(address).first.city
      state = Geocoder.search(address).first.state_code
      [city, state]
    end
  end
end
