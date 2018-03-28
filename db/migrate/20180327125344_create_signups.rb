class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :username
      t.string :password
      t.string :confirmpwd

      t.timestamps null: false
    end
  end
end
