class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    change_table :recipes do |t|
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
