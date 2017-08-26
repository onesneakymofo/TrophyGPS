require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  # plugins and uploading logic
  Shrine.plugin :determine_mime_type
  Shrine.plugin :direct_upload
  Shrine.plugin :processing
  Shrine.plugin :cached_attachment_data

  process(:store) do |io, context|
    # mmi = MiniMagick::Image.read(io)
    # mmi.exif
  end

end
