class VideoFu::YouTube
  attr_accessor :id
  EMBED_TEMPLATE = %Q|<object width="425" height="344"><param name="movie" value="http://www.youtube.com/v/{id}&hl=en&fs=1"></param><param name="allowFullScreen" value="true"></param><embed src="http://www.youtube.com/v/{id}&hl=en&fs=1" type="application/x-shockwave-flash" allowfullscreen="true" width="425" height="344"></embed></object>|

  def initialize(url)
    self.extract_params(url)
  end


  def extract_params(url)
    parsed_url = /v=([a-zA-Z0-9]*)/.match(url)
    self.id = parsed_url[1]
    return self
  end


  def to_s
    EMBED_TEMPLATE.gsub("{id}", self.id)
  end

end
