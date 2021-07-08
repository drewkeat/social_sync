class CreateFreetimes < ActiveRecord::Migration[5.2]
  def change
    create_table :freetimes do |t|
      t.datetime :start
      t.datetime :end
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
