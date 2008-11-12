class VideoFu::Kyte
  attr_accessor :id, :channel
  EMBED_TEMPLATE = %Q|<embed type="application/x-shockwave-flash" allowScriptAccess="always" allowFullScreen="true" style="display:block;margin:0" width="425" height="445" src="http://www.kyte.tv/flash.swf?v=2&uri=channels/107342/243203" flashVars="uri=channels/{channel}/{id}&appKey=MarbachViewerEmbedded"></embed><embed type="application/x-shockwave-flash" allowScriptAccess="always" style="display:block;margin:0"width="425" height="20" src="http://media01.kyte.tv/images/updatenotice.swf" flashvars="requiredversion=9.0.28" wmode="transparent"></embed>|

  def initialize(url)
    self.extract_params(url)
  end


  def extract_params(url)
    parsed_url = /.*\/ch\/([0-9]*).*\/([0-9]*).*/.match(url)
    self.id, self.channel = parsed_url[2], parsed_url[1]
    return self
  end


  def to_s
    EMBED_TEMPLATE.gsub("{channel}", self.channel).gsub("{id}", self.id)
  end

end
