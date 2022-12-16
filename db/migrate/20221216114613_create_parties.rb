class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.string :ten_letters_list
      t.string :word
      t.boolean :available

      t.timestamps
    end
  end
end
