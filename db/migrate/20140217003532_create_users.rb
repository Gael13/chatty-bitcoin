class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,             length: 100,  null: false
      t.string :email,            length: 150,  null: false
      t.string :password_hash,    length: 60,   null: false
      t.string :password_salt,    length: 29,   null: false

      t.timestamps
    end
  end
end
