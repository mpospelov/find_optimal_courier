class MoveHstoreToJsonb < ActiveRecord::Migration
  def change
    remove_column :solutions, :result
    add_column :solutions, :result, :jsonb, default: {}
  end
end
