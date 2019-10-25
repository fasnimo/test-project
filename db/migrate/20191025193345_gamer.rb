class Gamer < ActiveRecord::Migration
  def change
    create_table :gamers do |t|
      t.string :name
      t.string :email
    end
  end
end
