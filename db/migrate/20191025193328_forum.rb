class Forum < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :title
      t.text :body
      t.integer :gamer_id
      
      t.timestamps
    end
  end
end
