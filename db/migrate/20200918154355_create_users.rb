class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username, index: true
      t.string :password_digest
      t.string :auth_token

      t.timestamps
    end
  end
end
