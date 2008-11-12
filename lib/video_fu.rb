class VideoFu
  attr_accessor :url
  
  def initialize(url)
    self.url = url
  end


  def source
    /http:\/\/(.*?)\/.*?/.match(self.url)[1].to_s.gsub("www.","")
  end


  def klass
    case self.source
    when "kyte.tv" : VideoFu::Kyte.new(self.url)
    when "youtube.com" : VideoFu::YouTube.new(self.url)
    when "vimeo.com" : VideoFu::Vimeo.new(self.url)
    else
      nil
    end
  end

end
