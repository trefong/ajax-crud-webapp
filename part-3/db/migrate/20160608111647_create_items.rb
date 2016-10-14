class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.date :bid_start
      t.date :bid_end
      t.integer :user_id

      t.timestamps
    end
  end
end
