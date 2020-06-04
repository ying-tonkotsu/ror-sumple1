class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.number :member-id
      t.string :pw

      t.timestamps
    end
  end
end
