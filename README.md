<a href="https://codeclimate.com/github/pedRo-shd/pdvend-products/maintainability"><img src="https://api.codeclimate.com/v1/badges/78fba7fc8c936939a83d/maintainability" /></a>

# Freight calculating via Correios Frete API

Dependencies:
* Rails: 5.1.5
* Ruby: 2.5.0
* Mongodb
* Redis
* Docker
* Docker Compose

## Install Docker and Docker Compose in Ubuntu

* Update packages:
  ```
  sudo apt-get update
  ```

* GPG key of Docker:
  ```
  sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  ```

* Add the repository of Docker:
  ```
  sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
  ```

* Update packages again:
  ```
  sudo apt-get update
  ```

* Install Docker:
  ```
  sudo apt-get install -y docker-engine
  ```

* Add Docker to the system boot:
  ```
  sudo systemctl status docker
  ```

* Add user the group docker:
  ```
  sudo usermod -aG docker $(whoami)
  ```

* Close the terminal and reopen

* Now is need install Docker Compose:
  ```
  curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-uname -s-uname -m > docker-compose
  ```

* Move the file to fold bin:
  ```
  sudo mv docker-compose /usr/local/bin/
  ```

* Run:
  ```
  chmod +x /usr/local/bin/docker-compose
  ```

## Getting Started

* Clone the repository:
  ```
  git clone https://github.com/pedRo-shd/pdvend-products.git
  ```

* Run the commands below, after installing docker and docker-compose:
  ```
  docker-compose up --build
  docker-compose run website rails db:create
  ```

* Run guard on rspec:
  ```
  docker-compose run website bundle exec guard
  ```

* Run only rspec:
  ```
  docker-compose run website bundle exec rspec
  ```

## REST

This project supports API RESTful:

### Examples de chamadas a API
* Product Creation
  * POST http://localhost:3000/api/v1/products

  EXAMPLE BODY:
  ```
  {
    "name": "IBM",
    "height": "14",
    "weight": "13",
    "width": "15.2",
    "length": "17"
  }
  ```

  RESPONSE:
  ```
  {
    "_id":{
      "$oid": "5aca94b2da0c4d0007de58c5"
    },
    "description": null,
    "height": 14,
    "length": 17,
    "name": "IBM",
    "weight": 13,
    "width": 15.2
  }
  ```


* Search the product and return the freight calculation
  * GET http://localhost:3000/api/v1/products/freight_calculating/:id

  EXAMPLE ENDPOINT:
  * GET http://localhost:3000/api/v1/products/freight_calculating/5aca94b2da0c4d0007de58c5

  RESPONSE:
  ```
  {
    "cost_of_freight": "R$ 119,80",
    "zipcode": "Origin 71916-500, Destination 01225-001",
    "product":{
      "_id":{
        "$oid": "5aca7331da0c4d0007de58c4"
      },
      "description": null,
      "height": 14,
      "length": 17,
      "name": "IBM",
      "weight": 13,
      "width": 15.2
    }
  }
  ```
