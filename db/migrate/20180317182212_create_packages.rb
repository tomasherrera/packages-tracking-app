class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.references :truck, foreign_key: true
      t.string :tracking_id
      t.float :weight
      t.string :content
      t.string :receiver_address
      t.string :receiver_name
      t.string :sender_address
      t.string :sender_name
      t.integer :status, default: 0
      t.float :latitude
      t.float :longitude
      t.string :current_location

      t.timestamps
    end
  end
end
