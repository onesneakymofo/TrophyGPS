class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.integer :following, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
