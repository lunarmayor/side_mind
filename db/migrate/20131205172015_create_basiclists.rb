class CreateBasiclists < ActiveRecord::Migration
  def change
    create_table :basiclists do |t|
      t.string :name
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
