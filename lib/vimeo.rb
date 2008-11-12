class VideoFu::Vimeo
  attr_accessor :id
  EMBED_TEMPLATE = %Q|<object width="400" height="300"><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id={id}&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" /><embed src="http://vimeo.com/moogaloop.swf?clip_id={id}&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="400" height="300"></embed></object>|

  def initialize(url)
    self.extract_params(url)
  end


  def extract_params(url)
    parsed_url = /.com\/([0-9]*)/.match(url)
    self.id = parsed_url[1]
    return self
  end


  def to_s
    EMBED_TEMPLATE.gsub("{id}", self.id)
  end

end
