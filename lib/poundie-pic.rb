require "google_image_api"

class PoundiePicture < Poundie::Plugin
  register :poundie_picture

  prefix %r/poundie pic\s+/ do |term|
    speak GoogleImageApi.find(term).images.first["unescapedUrl"]
  end
end

Poundie.use :poundie_picture
