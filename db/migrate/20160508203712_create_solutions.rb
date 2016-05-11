class CreateSolutions < ActiveRecord::Migration
  def change
    enable_extension 'hstore'
    create_table :solutions do |t|
      t.hstore :result, default: {}
      t.string :state, default: 'start'

      t.timestamps null: false
    end
  end
end
