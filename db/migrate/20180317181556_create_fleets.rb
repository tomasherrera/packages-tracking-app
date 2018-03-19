class CreateFleets < ActiveRecord::Migration[5.1]
  def change
    create_table :fleets do |t|
      t.string :country, required: true, default: 'us'
      t.string :state, required: true
      t.string :city, required: true

      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
