class CreateRatings < ActiveRecord::Migration[7.2]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.references :wine, foreign_key: true

      t.timestamps
    end
  end
end
