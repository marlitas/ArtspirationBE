<!-- PROJECT INFO -->
<h1 align="center">
  <br>
  <a href="https://github.com/marlitas/ArtspirationBE">
    <img src="https://user-images.githubusercontent.com/80797707/133871214-025c2c08-a269-470d-97a3-31aa34a2cabe.jpg" alt="Logo" width="200" height="200"></a>
  <br>
  Artspiration API
  <br>
</h1>

<h4 align="center">The backend portion of a fun online application to rate and find cool artwork!</h4>

<p align="center">
  <a href="https://github.com/marlitas/ArtspirationBE/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/marlitas/ArtspirationBE?style=for-the-badge" alt="contributors_badge">
  </a>
  <a href="https://github.com/marlitas/ArtspirationBE/network/members">
    <img src="https://img.shields.io/github/forks/marlitas/ArtspirationBE?style=for-the-badge" alt="forks_badge">
  </a>
  <a href="https://github.com/marlitas/ArtspirationBE/stargazers">
    <img src="https://img.shields.io/github/stars/marlitas/ArtspirationBE?style=for-the-badge" alt="stars_badge">
  </a>
  <a href="https://github.com/marlitas/ArtspirationBE/issues">
    <img src="https://img.shields.io/github/issues/marlitas/ArtspirationBE?style=for-the-badge" alt="issues_badge">
  </a>
  <a href="">
    <img src="https://img.shields.io/travis/com/marlitas/ArtspirationBE?style=for-the-badge" alt="build_badge">
  </a>
  
  
<!-- CONTENTS -->
<p align="center">
  <a href="#about-the-project">About The Project</a> •
  <a href="#tools-used">Tools Used</a> •
  <a href="#set-up">Set Up</a> •
  <a href="#installation">Installation</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#database-schema">Database Schema</a> •
  <a href="#contributing">Contributing</a> •
  <a href="#acknowledgements">Acknowledgements</a>
</p>



## About The Project

The backend of Artspiration consumes the Artsy API and Google Cloud Vision API to power a recommendation engine that connects users with exciting artwork based on their preferences. We expose endpoints that package up this material for frontend consumption to display to our users as a web application.

### Learning Goals

* Using an Agile process throughout development
* Setting up continuous integration and continous deployment
* Using project management tool Github Project
* Demoing project ot project manager
* Building a backend API for frontend consumption
* Consuming endpoints and manipulating the JSON responses
* Handling large group dynamics with short 3 day sprints
* Working with Machine Learning outputs and implementing into app
* Consuming Google Cloud Vision API 



## Tools Used

| Development | Testing       | Gems            |
|   :----:    |    :----:     |    :----:       |
| Ruby 2.7.2  | RSpec         | Pry             |
| Rails 5.2.5 | WebMock       | ShouldaMatchers |
| JSON        | VCR           | Faraday         |
| Atom        | SimpleCov     | Figaro          |
| Github      | FactoryBot    | FastJSON        |
| TravisCI    | Faker         |                 |
| Heroku      |               |                 |



## Set Up

1. To clone and run this application, you'll need Ruby 2.7.2 and Rails 2.5.3. Using [rbenv](https://github.com/rbenv/rbenv) you can install Ruby 2.7.2 (if you don't have it already) with:
```sh
rbenv install 2.7.2
```
2. With rbenv you can set up your Ruby version for a directory and all subdirectories within it. Change into a directory that will eventually contain this repo and then run:
```sh
rbenv local 2.7.2
```
You can check that your Ruby version is correct with `ruby -v`

3. Once you have verified your Ruby version is 2.7.2, check if you have Rails. From the command line:
```sh
rails -v
```
4. If you get a message saying rails is not installed or you do not have version 5.2.5, run
```sh
gem install rails --version 5.2.5
```
5. You may need to quit and restart your terminal session to see these changes show up



## Installation

1. Get a free API Key at [Artsy API](https://api.artsy.net)
2. Get a free (with limits) Google Vision API KEY by following directions [here](https://cloud.google.com/vision/docs/setup)
3. Clone the repo
   ```sh
   git clone https://github.com/marlitas/ArtspirationBE.git
   ```
4. Install gems
   ```sh
   bundle install
   ```
5. Install figaro
    ```sh
   bundle exec figaro install
   ```
6. Enter your API KEYS in `application.yml`
   ```ruby
   artsy_api_key = <ENTER YOUR API KEY>
   google_api_key = <ENTER YOUR API KEY>
   key = <ENTER YOUR API KEY>
   ```
7. Setup the database
    ```sh
   rails db:create
   rails db:migrate
   ```



## How To Use

The Artspiration Backend can be used to retrieve user preferences for artwork, as well as make calls to the Artsy API for specific artwork information including: title, artist, image(jpg). The backend can also provide daily recommendations for a piece of art based on past user preferences. Preferences are generated through label and image properties determined by the Google Cloud Vision API. The recommendation engine is built using a combination of collaborative filtering as well as sorting through the saved user preferences.



### Endpoint Documentation
[User Endpoint](https://peaceful-reef-61917.herokuapp.com/api/v1/users/133)
<br>
Request:
`/api/v1/users/:id`

Response:
```json
{
  "data": {
  "id": "133",
  "type": "user",
  "attributes": {
    "name": "Melanie Swaniawski",
    "email": "shameka_goyette@bartell.co"
    }
  }
}
```

[Recommeded Art Endpoint](https://peaceful-reef-61917.herokuapp.com/api/v1/users/133/recommendations)
<br>
Request:
`/api/v1/users/:id/recommendations`

Response:
```json
{
  "data": [
    {
      "id": 168,
      "type": "recommended_art",
      "attributes": {
        "title": "Virgin of the Rocks",
        "image": "https://d32dm0rphc51dk.cloudfront.net/Jv-e1fhDjg61OYhhsMoiQg/{image_version}.jpg",
        "user_id": 133
      }
    }
  ]
}
```

[Rated Art Index Endpoint](https://peaceful-reef-61917.herokuapp.com/api/v1/users/133/rated_arts)
<br>
Request:
`/api/v1/users/:id/rated_arts`

Response:
```json
{
  "data": [
      {
        "id": 175,
        "type": "rated_art",
        "attributes": {
          "title": "La Grande Odalisque",
          "image": "https://d32dm0rphc51dk.cloudfront.net/crVj8GvGliFrpExNfHWl4Q/medium.jpg",
          "liked": true,
          "user_id": 145
        }
      },
      {
        "id": 184,
        "type": "rated_art",
        "attributes": {
          "title": "L'Embarquement pour Cythère (The Embarkation for Cythera)",
          "image": "https://d32dm0rphc51dk.cloudfront.net/Ux_L_UKjxgR-gJ6XZYVgVg/medium.jpg",
          "liked": true,
          "user_id": 145
        }
      }
   ]
}
```

[Rated Art Show Endpoint](https://peaceful-reef-61917.herokuapp.com/api/v1/users/145/rated_arts/174)
<br>
Request:
`/api/v1/users/:id/rated_arts/:art_id`

Response:
```json
{
  "data": {
    "id": 106,
    "type": "rated_art",
    "attributes": {
      "title": "The Tête à Tête",
      "image": "https://d32dm0rphc51dk.cloudfront.net/5KJ7_u7BPqeltkfEnyijIw/medium.jpg",
      "liked": true,
      "user_id": 145
    }
  }
}
```



## Database Schema
![artspiration_be_schema](https://user-images.githubusercontent.com/80797707/134600560-be2d2a0d-290d-4757-b28f-1eb24a929f03.jpg)



## Contributing

👤  **Jacob Piland**
- [GitHub](https://github.com/jtpiland)
- [LinkedIn](https://www.linkedin.com/in/jacob-piland/)

👤  **Marla Schulz**
- [GitHub](https://github.com/marlitas)
- [LinkedIn](https://www.linkedin.com/in/marla-a-schulz/)

👤  **Kim Abcouwer**
- [GitHub](https://github.com/kabcouwer)
- [LinkedIn](https://www.linkedin.com/in/kim-abcouwer/)

👤  **Jason Knoll**
- [GitHub](https://github.com/JasonPKnoll)
- [LinkedIn](https://www.linkedin.com/in/jason-p-knoll/)

👤  **Alex Klick**
- [GitHub](https://www.github.com/alexklick)
- [LinkedIn](https://www.linkedin.com/in/alex-klick/)

👤  **Dee H**
- [GitHub](https://github.com/deebot10)
- [LinkedIn](https://www.linkedin.com/in/dee/)



## Acknowledgements

* [Turing School of Software and Design](https://turing.edu/)
  - Project created for completion towards Backend Engineering Program
* [Artsy API](https://www.api.artsy.net/)
* [Google Cloud Vision API](https://cloud.google.com/vision)
