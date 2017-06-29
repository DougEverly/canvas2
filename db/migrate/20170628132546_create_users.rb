class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first
      t.string :last

      t.timestamps
    end
  end
end
