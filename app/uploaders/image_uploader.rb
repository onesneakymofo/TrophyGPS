require "image_processing/mini_magick"

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  # plugins and uploading logic
  # Shrine.plugin :determine_mime_type
  # Shrine.plugin :direct_upload
  plugin :processing

  process(:store) do |io, context|
    mmi = MiniMagick::Image.read(io)
    mmi.exif
    context[:record][:exif_tags] = mmi.exif.to_json
    context[:record][:coordinates] = get_coordinates(mmi.exif)
    io.download
  end

  def get_coordinates(exif_data)
    unless exif_data.blank?
      lat_multiplier = 1
      lon_multiplier = 1
      lat_string = exif_data['GPSLatitude']
      lon_string = exif_data['GPSLongitude']

      return if lat_string.blank? || lon_string.blank?

      lat_degrees = lat_string.split(',').first
      lat_minutes = lat_string.split(',').last
      lon_degrees = lon_string.split(',').first
      lon_minutes = lon_string.split(',').last
      if(lat_minutes[-1] != 'N')
        lat_multiplier = -1
      end
      if(lon_minutes[-1] != 'E')
        lon_multiplier = -1
      end

      latitude = (lat_degrees.to_f + (lat_minutes.to_f ) / 60.0) * lat_multiplier
      longitude = (lon_degrees.to_f + (lon_minutes.to_f ) / 60.0) * lon_multiplier
      [latitude, longitude]
    end

  end



end
