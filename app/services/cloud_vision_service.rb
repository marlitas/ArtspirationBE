class CloudVisionService
  class << self
    def artwork(value)
      response = conn(value).post("/v1/images:annotate")
      parse_json(response)
    end

    def conn(value)
      Faraday.new(url: 'https://vision.googleapis.com') do |req|
        req.params[:key] = ENV['key']
        # req.body['requests'][0]['image']['content'] = value  
        
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)      
    end
  end
end