module WebmockStubs 
  def self.mock_categories
            {:responses=>
              [{:labelAnnotations=>
                [{:mid=>"/m/07j7r", :description=>"Tree", :score=>0.8316971, :topicality=>0.8316971},
                  {:mid=>"/m/0jjw", :description=>"Art", :score=>0.82273906, :topicality=>0.82273906},
                  {:mid=>"/m/083vt", :description=>"Wood", :score=>0.8041993, :topicality=>0.8041993},
                  {:mid=>"/m/0j62f", :description=>"Rectangle", :score=>0.7840926, :topicality=>0.7840926},
                  {:mid=>"/m/05y4t", :description=>"Paint", :score=>0.77848625, :topicality=>0.77848625}]}]}.to_json 

  end
                
  def self.mock_art
    {
      'data': {
        'id': '1',
        'type': 'artwork',
        'attributes': {
          'url': 'https://d32dm0rphc51dk.cloudfront.net/46PghnvIBjrN25-_kPPwQA/big_and_tall.jpg',
          'title': 'Campbells',
          'artist': 'Big Pharma',
          'artist_url': 'https://en.wikipedia.org/wiki/Vincent_van_Gogh'
        }
      }
    }.to_json
  end
end