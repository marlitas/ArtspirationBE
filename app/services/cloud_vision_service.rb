class CloudVisionService
  class << self
    def artwork(value)

      response = Faraday.post("https://vision.googleapis.com/v1/images:annotate?key=#{ENV['key']}", "{'requests':[{'image':{'source':{'imageUri':\"#{value}\"}},'features':{'maxResults':5,'type':'LABEL_DETECTION'}}]}",{'Content-Type': 'application/json'})
      parse_json(response)
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)      
    end
  end
end