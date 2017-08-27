class AddPropertiesToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :exif_tags, :jsonb
  end
end
