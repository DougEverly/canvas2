class CreateUserToRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_to_roles do |t|
      t.references :user, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
