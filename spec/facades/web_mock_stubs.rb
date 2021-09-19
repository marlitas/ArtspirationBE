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
      "total_count": 5,
      "_links": {
        "self": {
            "href": "https://api.artsy.net/api/artworks"
          },
        "next": {
          "href": "https://api.artsy.net/api/artworks?cursor=4d8b93b04eb68a1b2c001b9d%3A4d8b93b04eb68a1b2c001b9d"
        }
      },
      "_embedded": {
      "artworks": [
        {
          "id": "4d8b92eb4eb68a1b2c000968",
          "slug": "gustav-klimt-der-kuss-the-kiss",
          "created_at": "2010-12-20T19:48:55+00:00",
          "updated_at": "2021-05-17T19:50:28+00:00",
          "title": "Der Kuss (The Kiss)",
          "category": "Painting",
          "medium": "Oil and gold leaf on canvas",
          "date": "1907-1908",
          "dimensions": {
            "in": {
              "text": "70 9/10 × 70 9/10 in",
              "height": 70.9,
              "width": 70.9,
              "depth": 5,
              "diameter": 5
            },
            "cm": {
              "text": "180.1 × 180.1 cm",
              "height": 180.1,
              "width": 180.1,
              "depth": 5,
              "diameter": 5
            }
          },
        "published": true,
        "website": "",
        "signature": "",
        "series": 5,
        "provenance": "",
        "literature": "",
        "exhibition_history": "",
        "collecting_institution": "Österreichische Galerie Belvedere, Vienna",
        "additional_information": "[Image source](https://commons.wikimedia.org/wiki/File:Klimt_-_The_Kiss.jpg)",
        "image_rights": "Source: Wikimedia Commons / Public Domain",
        "blurb": "",
        "unique": false,
        "cultural_maker": 5,
        "iconicity": 319.9334846264162,
        "can_inquire": false,
        "can_acquire": false,
        "can_share": true,
        "sale_message": "Not for sale",
        "sold": false,
        "image_versions": [
            "large",
            "larger",
            "medium",
            "medium_rectangle",
            "normalized",
            "small",
            "square",
            "tall"
        ],
        "_links": {
          "thumbnail": {
            "href": "https://d32dm0rphc51dk.cloudfront.net/NOpIAwQa-3r51Cg9qXKbfA/medium.jpg"
          },
          "image": {
            "href": "https://d32dm0rphc51dk.cloudfront.net/NOpIAwQa-3r51Cg9qXKbfA/{image_version}.jpg",
            "templated": true
          },
          "partner": {
            "href": "https://api.artsy.net/api/partners/51cc9a88275b24f8700000db"
          },
          "self": {
            "href": "https://api.artsy.net/api/artworks/4d8b92eb4eb68a1b2c000968"
          },
          "permalink": {
            "href": "https://www.artsy.net/artwork/gustav-klimt-der-kuss-the-kiss"
          },
          "genes": {
            "href": "https://api.artsy.net/api/genes?artwork_id=4d8b92eb4eb68a1b2c000968"
          },
          "artists": {
            "href": "https://api.artsy.net/api/artists?artwork_id=4d8b92eb4eb68a1b2c000968"
          },
          "similar_artworks": {
            "href": "https://api.artsy.net/api/artworks?similar_to_artwork_id=4d8b92eb4eb68a1b2c000968"
          },
          "collection_users": {
            "href": "https://api.artsy.net/api/users?collected_artwork_id=4d8b92eb4eb68a1b2c000968"
          },
          "sale_artworks": {
            "href": "https://api.artsy.net/api/sale_artworks?artwork_id=4d8b92eb4eb68a1b2c000968"
          }
        },
        "_embedded": {
          "editions": []
          }
        },
        {  
         "id": "4d8b92ee4eb68a1b2c0009ab",
        "slug": "francisco-de-goya-the-third-of-may",
        "created_at": "2010-12-20T19:48:55+00:00",
        "updated_at": "2021-05-17T19:50:28+00:00",
        "title": "The Third of May",
        "category": "Painting",
        "medium": "Oil on canvas",
        "date": "1814",
          "dimensions": {
            "in": {
              "text": "104 4/5 × 135 9/10 in",
              "height": 104.8,
              "width": 135.9,
              "depth": 5,
              "diameter": 5
            },
            "cm": {
              "text": "266.2 × 345.2 cm",
              "height": 266.2,
              "width": 345.2,
              "depth": 5,
              "diameter": 5
            }
        },
        "published": true,
        "website": "",
        "signature": "",
        "series": "",
        "provenance": "",
        "literature": "",
        "exhibition_history": "",
        "collecting_institution": "Museo Nacional del Prado, Madrid",
        "additional_information": "Collection: Museo Nacional del Prado, Madrid",
        "image_rights": "Image provided by Museo Nacional del Prado",
        "blurb": "",
        "unique": 5,
        "cultural_maker": 5,
        "iconicity": 226.49889188708318,
        "can_inquire": false,
        "can_acquire": false,
        "can_share": true,
        "sale_message": 5,
        "sold": false,
        "image_versions": [
          "square",
          "small",
          "large_rectangle",
          "large",
          "tall",
          "medium",
          "medium_rectangle",
          "larger",
          "normalized"
        ],
        "_links": {
        "thumbnail": {
          "href": "https://d32dm0rphc51dk.cloudfront.net/m4X41Fun8gpDjn7Gat9cUg/medium.jpg"
        },
        "image": {
          "href": "https://d32dm0rphc51dk.cloudfront.net/m4X41Fun8gpDjn7Gat9cUg/{image_version}.jpg",
          "templated": true
        },
        "partner": {
          "href": "https://api.artsy.net/api/partners/56f94caf139b21737200320b"
        },
        "self": {
          "href": "https://api.artsy.net/api/artworks/4d8b92ee4eb68a1b2c0009ab"
        },
        "permalink": {
          "href": "https://www.artsy.net/artwork/francisco-de-goya-the-third-of-may"
        },
        "genes": {
          "href": "https://api.artsy.net/api/genes?artwork_id=4d8b92ee4eb68a1b2c0009ab"
        },
        "artists": {
          "href": "https://api.artsy.net/api/artists?artwork_id=4d8b92ee4eb68a1b2c0009ab"
        },
        "similar_artworks": {
          "href": "https://api.artsy.net/api/artworks?similar_to_artwork_id=4d8b92ee4eb68a1b2c0009ab"
        },
        "collection_users": {
          "href": "https://api.artsy.net/api/users?collected_artwork_id=4d8b92ee4eb68a1b2c0009ab"
        },
        "sale_artworks": {
          "href": "https://api.artsy.net/api/sale_artworks?artwork_id=4d8b92ee4eb68a1b2c0009ab"
        }
        },
        "_embedded": {
          "editions": []
          }
        },
        {
        "id": "4d8b93394eb68a1b2c0010fa",
        "slug": "rembrandt-van-rijn-the-company-of-frans-banning-cocq-and-willem-van-ruytenburch-the-night-watch",
        "created_at": "2010-12-20T19:48:55+00:00",
        "updated_at": "2021-05-17T19:50:33+00:00",
        "title": "The Company of Frans Banning Cocq and Willem van Ruytenburch (The Night Watch)",
        "category": "Painting",
        "medium": "Oil on canvas",
        "date": "1642",
          "dimensions": {
            "in": {
              "text": "143 × 172 1/5 in",
              "height": 143,
              "width": 172.2,
              "depth": 5,
              "diameter": 5
            },
            "cm": {
              "text": "363.2 × 437.4 cm",
              "height": 363.2,
              "width": 437.4,
              "depth": 5,
              "diameter": 5
            }
        },
        "published": true,
        "website": "",
        "signature": "",
        "series": 5,
        "provenance": "",
        "literature": "",
        "exhibition_history": "",
        "collecting_institution": "Rijksmuseum, Amsterdam",
        "additional_information": "[Image source](http://commons.wikimedia.org/wiki/File:Rembrandt_van_Rijn-De_Nachtwacht-1642.jpg)",
        "image_rights": "Source: Wikimedia Commons / Public Domain",
        "blurb": "",
        "unique": false,
        "cultural_maker": 5,
        "iconicity": 99.58492866202121,
        "can_inquire": false,
        "can_acquire": false,
        "can_share": true,
        "sale_message": 5,
        "sold": false,
        "image_versions": [
          "large",
          "large_rectangle",
          "larger",
          "medium",
          "medium_rectangle",
          "normalized",
          "small",
          "square",
          "tall"
        ],
        "_links": {
        "thumbnail": {
          "href": "https://d32dm0rphc51dk.cloudfront.net/IG8ZLvVmZgQiTn2zK0Bp8w/medium.jpg"
        },
        "image": {
          "href": "https://d32dm0rphc51dk.cloudfront.net/IG8ZLvVmZgQiTn2zK0Bp8w/{image_version}.jpg",
          "templated": true
        },
        "partner": {
          "href": "https://api.artsy.net/api/partners/534d74e21a1e864e0b0000e3"
        },
        "self": {
          "href": "https://api.artsy.net/api/artworks/4d8b93394eb68a1b2c0010fa"
        },
        "permalink": {
          "href": "https://www.artsy.net/artwork/rembrandt-van-rijn-the-company-of-frans-banning-cocq-and-willem-van-ruytenburch-the-night-watch"
        },
        "genes": {
          "href": "https://api.artsy.net/api/genes?artwork_id=4d8b93394eb68a1b2c0010fa"
        },
        "artists": {
          "href": "https://api.artsy.net/api/artists?artwork_id=4d8b93394eb68a1b2c0010fa"
        },
        "similar_artworks": {
          "href": "https://api.artsy.net/api/artworks?similar_to_artwork_id=4d8b93394eb68a1b2c0010fa"
        },
        "collection_users": {
          "href": "https://api.artsy.net/api/users?collected_artwork_id=4d8b93394eb68a1b2c0010fa"
        },
        "sale_artworks": {
          "href": "https://api.artsy.net/api/sale_artworks?artwork_id=4d8b93394eb68a1b2c0010fa"
          }
        },
        "_embedded": {
          "editions": []
          }
        },
        {
        "id": "4d8b937c4eb68a1b2c001722",
        "slug": "leonardo-da-vinci-mona-lisa",
        "created_at": "2010-12-20T19:48:55+00:00",
        "updated_at": "2021-06-25T21:52:46+00:00",
        "title": "Mona Lisa",
        "category": "Painting",
        "medium": "Oil on poplar",
        "date": "ca. 1503-1506",
          "dimensions": {
            "in": {
              "text": "30 3/10 × 20 9/10 in",
              "height": 30.3,
              "width": 20.9,
              "depth": 5,
              "diameter": 5
            },
            "cm": {
              "text": "77 × 53.1 cm",
              "height": 77,
              "width": 53.1,
              "depth": 5,
              "diameter": 5
            }
        },
        "published": false,
        "website": "",
        "signature": "",
        "series": 5,
        "provenance": "",
        "literature": "",
        "exhibition_history": "",
        "collecting_institution": "Musée du Louvre",
        "additional_information": "",
        "image_rights": "",
        "blurb": "",
        "unique": false,
        "cultural_maker": 5,
        "iconicity": 214.76277813420393,
        "can_inquire": false,
        "can_acquire": false,
        "can_share": false,
        "sale_message": "Not for sale",
        "sold": false,
        "image_versions": [
          "large",
          "large_rectangle",
          "larger",
          "medium",
          "medium_rectangle",
          "normalized",
          "small",
          "square",
          "tall"
        ],
        "_links": {
        "thumbnail": {
          "href": "https://d32dm0rphc51dk.cloudfront.net/5L1xjKC_und1uiKCpUPHhw/medium.jpg"
        },
        "image": {
          "href": "https://d32dm0rphc51dk.cloudfront.net/5L1xjKC_und1uiKCpUPHhw/{image_version}.jpg",
          "templated": true
        },
        "partner": {
          "href": "https://api.artsy.net/api/partners/51cc9a88275b24f8700000db"
        },
        "self": {
          "href": "https://api.artsy.net/api/artworks/4d8b937c4eb68a1b2c001722"
        },
        "permalink": {
          "href": "https://www.artsy.net/artwork/leonardo-da-vinci-mona-lisa"
        },
        "genes": {
          "href": "https://api.artsy.net/api/genes?artwork_id=4d8b937c4eb68a1b2c001722"
        },
        "artists": {
          "href": "https://api.artsy.net/api/artists?artwork_id=4d8b937c4eb68a1b2c001722"
        },
        "similar_artworks": {
          "href": "https://api.artsy.net/api/artworks?similar_to_artwork_id=4d8b937c4eb68a1b2c001722"
        },
        "collection_users": {
          "href": "https://api.artsy.net/api/users?collected_artwork_id=4d8b937c4eb68a1b2c001722"
        },
        "sale_artworks": {
          "href": "https://api.artsy.net/api/sale_artworks?artwork_id=4d8b937c4eb68a1b2c001722"
        }
        },
        "_embedded": {
          "editions": []
          }
        },
        {
        "id": "4d8b93b04eb68a1b2c001b9d",
        "slug": "edouard-manet-luncheon-on-the-grass-le-dejeuner-sur-lherbe",
        "created_at": "2010-12-20T19:48:55+00:00",
        "updated_at": "2021-05-17T19:50:38+00:00",
        "title": "Luncheon on the Grass (Le Déjeuner sur l'herbe)",
        "category": "Painting",
        "medium": "Oil on canvas",
        "date": "1863",
        "dimensions": {
          "in": {
            "text": "82 × 104 in",
            "height": 82,
            "width": 104,
            "depth": 5,
              "diameter": 5
          },
          "cm": {
            "text": "208.3 × 264.2 cm",
            "height": 208.3,
            "width": 264.2,
            "depth": 5,
            "diameter": 5
          }
        },
        "published": true,
        "website": "",
        "signature": "",
        "series": 5,
        "provenance": "",
        "literature": "",
        "exhibition_history": "",
        "collecting_institution": "Musée d'Orsay, Paris",
        "additional_information": "[Image source](http://commons.wikimedia.org/wiki/File:Edouard_Manet_-_Luncheon_on_the_Grass_-_Google_Art_Project.jpg)",
        "image_rights": "Source: Wikimedia Commons / Public Domain",
        "blurb": "",
        "unique": false,
        "cultural_maker": 5,
        "iconicity": 241.3723577384994,
        "can_inquire": false,
        "can_acquire": false,
        "can_share": true,
        "sale_message": 5,
        "sold": false,
        "image_versions": [
          "large",
          "large_rectangle",
          "larger",
          "medium_rectangle",
          "normalized",
          "small",
          "square",
          "tall",
          "medium"
        ],
        "_links": {
        "thumbnail": {
          "href": "https://d32dm0rphc51dk.cloudfront.net/zFA7cwdkWxbIrmuAAd21VA/medium.jpg"
        },
        "image": {
          "href": "https://d32dm0rphc51dk.cloudfront.net/zFA7cwdkWxbIrmuAAd21VA/{image_version}.jpg",
          "templated": true
        },
        "partner": {
          "href": "https://api.artsy.net/api/partners/5554bf037261697700010000"
        },
        "self": {
          "href": "https://api.artsy.net/api/artworks/4d8b93b04eb68a1b2c001b9d"
        },
        "permalink": {
          "href": "https://www.artsy.net/artwork/edouard-manet-luncheon-on-the-grass-le-dejeuner-sur-lherbe"
        },
        "genes": {
          "href": "https://api.artsy.net/api/genes?artwork_id=4d8b93b04eb68a1b2c001b9d"
        },
        "artists": {
          "href": "https://api.artsy.net/api/artists?artwork_id=4d8b93b04eb68a1b2c001b9d"
        },
        "similar_artworks": {
          "href": "https://api.artsy.net/api/artworks?similar_to_artwork_id=4d8b93b04eb68a1b2c001b9d"
        },
        "collection_users": {
          "href": "https://api.artsy.net/api/users?collected_artwork_id=4d8b93b04eb68a1b2c001b9d"
        },
        "sale_artworks": {
          "href": "https://api.artsy.net/api/sale_artworks?artwork_id=4d8b93b04eb68a1b2c001b9d"
        }
        },
        "_embedded": {
          "editions": []
            }
          }
        ]
      }
    }.to_json
  end

  def self.mock_colors
    {:responses=>
              [{:imagePropertiesAnnotation=>
                {:dominantColors => 
                  {:colors =>
                [{:color => {
                              "red": 135,
                              "green": 117,
                              "blue": 88
                },
                  "score": 0.24451232,
                  "pixelFraction": 0.26733577},
                  {:color => {
                              "red": 135,
                              "green": 117,
                              "blue": 88
                },
                  "score": 0.24451232,
                  "pixelFraction": 0.26733577},
                  {:color => {
                              "red": 135,
                              "green": 117,
                              "blue": 88
                },
                  "score": 0.24451232,
                  "pixelFraction": 0.26733577},
                  {:color => {
                              "red": 135,
                              "green": 117,
                              "blue": 88
                },
                  "score": 0.24451232,
                  "pixelFraction": 0.26733577},
                  {:color => {
                              "red": 135,
                              "green": 117,
                              "blue": 88
                },
                  "score": 0.24451232,
                  "pixelFraction": 0.26733577},
                  {:color => {
                              "red": 135,
                              "green": 117,
                              "blue": 88
                },
                  "score": 0.24451232,
                  "pixelFraction": 0.26733577},
                  {:color => {
                              "red": 135,
                              "green": 117,
                              "blue": 88
                },
                  "score": 0.24451232,
                  "pixelFraction": 0.26733577},
                  {:color => {
                              "red": 135,
                              "green": 117,
                              "blue": 88
                },
                  "score": 0.24451232,
                  "pixelFraction": 0.26733577},
                  {:color => {
                              "red": 135,
                              "green": 117,
                              "blue": 88
                },
                  "score": 0.24451232,
                  "pixelFraction": 0.26733577},
                  {:color => {
                              "red": 135,
                              "green": 117,
                              "blue": 88
                },
                  "score": 0.24451232,
                  "pixelFraction": 0.26733577}]}},
                "cropHintsAnnotation": {
                "cropHints": [
                    {
                        "boundingPoly": {
                            "vertices": [
                                {
                                    "y": 128
                                },
                                {
                                    "x": 481,
                                    "y": 128
                                },
                                {
                                    "x": 481,
                                    "y": 399
                                },
                                {
                                    "y": 399
                                }
                            ]
                        },
                        "confidence": 0.34567636,
                        "importanceFraction": 0.90640813 }]}}]}.to_json   
  end
end