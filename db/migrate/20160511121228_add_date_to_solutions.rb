class AddDateToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :date, :date
  end
end
