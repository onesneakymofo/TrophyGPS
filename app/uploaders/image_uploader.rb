class ImageUploader < Shrine
  # plugins and uploading logic
  Shrine.plugin :determine_mime_type
end
