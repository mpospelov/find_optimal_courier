class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :destination
      t.date :start_date
      t.date :end_date
      t.text :comment
      t.references :user, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
