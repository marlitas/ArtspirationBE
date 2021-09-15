<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

<!-- PROJECT LOGO -->
![Artspiration Logo](some kind of logo)
<br />
  <h3 align="center">Artspiration API</h3>

  <p align="center">
    The backend portion of a fun online application to rate and find cool artwork!
  </p>



<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#tools-used">Tools Used</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

![Artspiration Screenshot](cool screenshot)
The backend of Artspiration consumes the Artsy API and Google Cloud Vision API to power a recommendation engine that connects users with exciting artwork based on their preferences. We expose endpoints that package up this material for frontend consumption to display to our users as a web application.


Learning Goals:
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


<!-- GETTING STARTED -->
## Getting Started

To run this project localy please follow the instructions below. *Maybe adjust this link to endpoints link?* For production environment go to: [Artspiration](https://peaceful-reef-61917.herokuapp.com/)


### Installation

1. Get a free API Key at [Artsy API](https://api.artsy.net)
2. Clone the repo
   ```sh
   git clone https://github.com/marlitas/ArtspirationBE.git
   ```
3. Install gems
   ```sh
   bundle install
   ```
4. Install figaro
    ```sh
   bundle exec figaro install
   ```
5. Enter your API in `application.yml`
   ```ruby
   artsy_api_key = <ENTER YOUR API>
   google_api_key = <ENTER YOUR API>
   ```
6. Setup the database
    ```sh
   rails db:create
   rails db:migrate
   ```



<!-- USAGE EXAMPLES -->
## Usage
The Artspiration Backend can be used to retrieve user preferences for artwork, as well as make calls to the Artsy API for specific artwork information including: title, artist, image(jpg), creation date. The backend can also provide daily recommendations for a piece of art based on past user preferences. Preferences are generated through label and image properties determined by the Google Cloud Vision API. The recommendation engine is built using a combination of collaborative filtering as well as sorting through the saved user preferences. 

### Endpoint Documentation
[endpoint_1](https://glacial-ridge-45838.herokuapp.com/).
```json
{ "data":
  [ {
  "id": 1,
  "attributes": {
    "name": "funbucket",
    }
   }
   ]
  }
```


<!-- CONTACT -->
## Contact
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


Project Link: [https://github.com/marlitas/ArtspirationBE](https://github.com/marlitas/ArtspirationBE)


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Turing School of Software and Design](https://turing.edu/)
  - Project created for completion towards Backend Engineering Program
* [Artsy API](https://www.api.artsy.net/)
* [Google Cloud Vision API](https://cloud.google.com/vision)
