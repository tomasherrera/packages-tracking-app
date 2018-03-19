FactoryBot.define do
  factory(:package) do
    content "Computer Dell"
    current_location "1000 EverGreen Av, Springfield, Massachussets"
    latitude 42.2702162439235
    longitude -89.0930397771484
    receiver_address "1000 EverGreen Av, Springfield, Massachussets"
    receiver_name "Cersei Lannister"
    sender_address "Cra 38 #29-15 Soledad, Colombia"
    sender_name "Jon Snow"
    status "In Transport"
    tracking_id "FDVW"
    truck_id 14
    weight 10.0
  end
end
