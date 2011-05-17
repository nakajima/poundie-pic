require "google_image_api"

class PoundiePicture < Poundie::Plugin
  register :poundie_picture

  prefix %r/poundie pic\s+/ do |term|
    if image = GoogleImageApi.find(term).images.first
      speak image["unescapedUrl"]
    else
      speak "Google Images ain't got nothing on #{term.inspect}"
    end
  end
end

Poundie.use :poundie_picture
