class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.boolean :admin, default: 0
      t.integer :happiness, default: 1
      t.integer :nausea, default: 1
      t.integer :height, default: 0
      t.integer :tickets, default: 0

      t.timestamps
    end
  end
end
