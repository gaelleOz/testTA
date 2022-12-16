class AddColumnToParties < ActiveRecord::Migration[7.0]
  def change
    add_reference :parties, :game, foreign_key: true
  end
end
