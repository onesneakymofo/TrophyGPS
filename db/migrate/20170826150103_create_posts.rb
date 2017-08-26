class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.bigint :user_id
      t.jsonb :properties
      t.point :coordinates

      t.timestamps
    end
  end
end
