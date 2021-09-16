class CloudVisionService
  class << self
    def artwork(download)
      response = conn.post("/v1/images:annotate")
      parse_json(response)
    end

    def conn
      Faraday.new(url: 'https://vision.googleapis.com') do |req|
        req.headers['']
      end
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)      
    end
  end
end