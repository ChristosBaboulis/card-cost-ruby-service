
# Card Cost Ruby Service

This is a Ruby on Rails API-only application that manages clearing costs per country and provides an endpoint to calculate the cost of clearing a given card number using the external Binlist API.

## Features

* CRUD API for managing clearing costs per country
* External API call to https://lookup.binlist.net for country lookup based on card number
* Business logic endpoint to return the clearing cost of any given card
* Validation using Mongoid document validations
* Service object for external API interaction (Binlist)
* RSpec for unit and integration testing
* Seed data loading for development environment
* Docker support for containerized deployment (optional)
* CSRF protection disabled for API endpoints
* No JWT authentication yet (planned for future)

## API Endpoints

### Clearing Cost Management (Admin CRUD)

* `GET /card_costs` – List all clearing costs
* `POST /card_costs` – Create a new clearing cost

### Business Logic Endpoint

* `POST /card_costs/binlist_cost`

    * Request Body: `{ "card_number": "45717360" }`
    * Response: `{ "country": "US", "cost": 5 }`

## Technologies Used

* Ruby 3.2.2 (managed via rbenv)
* Ruby on Rails 7.x (API-only mode)
* MongoDB with Mongoid ODM
* Redis (optional for caching/background jobs)
* HTTParty for HTTP requests to external APIs
* RSpec for testing
* Docker (optional)
* Postman for API testing

## Getting Started

Follow these steps to run the application and test it with Postman:

### Prerequisites

- Ruby 3.2.2 installed (recommended via rbenv)  
- Bundler installed (`gem install bundler`)  
- MongoDB running locally or via Docker container  
- Postman (or any API client) to test the endpoints  

---

### Step 1: Clone the repository

~~~bash
git clone https://github.com/yourusername/card-cost-ruby.git
cd card-cost-ruby
~~~

---

### Step 2: Install dependencies

~~~bash
bundle install
~~~

---

### Step 3: Start MongoDB

If you have MongoDB installed locally, make sure it is running.

Alternatively, run MongoDB via Docker:

~~~bash
docker run -d --name mongo -p 27017:27017 mongo
~~~

---

### Step 4: Start the Rails server

~~~bash
rails server
~~~

The API will be available at `http://localhost:3000`

---

### Step 5: Test API endpoints with Postman

- **Get all clearing costs:**

  - Method: GET  
  - URL: `http://localhost:3000/card_costs`

- **Get cost related to a card number:**

  - Method: POST  
  - URL: `http://localhost:3000/card_costs/binlist_cost`  
  - Body (JSON):

    ~~~json
    {
      "card_number": "45717360"
    }
    ~~~

---

### Optional: Stop MongoDB Docker container

~~~bash
docker stop mongo
docker rm mongo
~~~

## Testing

- Run `bundle exec rspec` to execute unit and integration tests.

## Postman Collection

A Postman collection is available under `postman/card-cost-ruby-service.postman_collection.json` containing:

- Requests for CRUD operations on clearing costs
- Requests for the business logic endpoint `/card_costs/binlist_cost`

## Docker

This project includes a Dockerfile to build a container image for the Rails application. You can build and run the container for easy deployment.

Note that MongoDB must be run separately, either locally or as a Docker container. Using Docker Compose is recommended to orchestrate both the app and database containers together.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

Christos Bampoulis  
GitHub: [@ChristosBaboulis](https://github.com/ChristosBaboulis)