class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :user, index: true
      t.integer :followed_id

      t.timestamps
    end

    add_index :relationships, :followed_id
    add_index :relationships, [:user_id, :followed_id], unique: true
  end
end
