class GetArtFacade
  class << self
    def show_me_art
      info = {}
      art_info = GetArtService.call_db
      art_info[:_embedded].each do |hash|
        hash[1].each do |x| 
          info[x[:id]] = x[:_links][:image][:href] 
        end
      end
      info
    end  
  end
end

