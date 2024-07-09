class CreateWines < ActiveRecord::Migration[7.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :color
      t.integer :price_cents
      t.string :website

      t.timestamps
    end
  end
end
