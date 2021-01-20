![](https://img.shields.io/badge/Ruby-2.5.3-orange) 

# Travel Weather App

#
Learning Goals: 
- work in a service-oriented architecture. 
- front-end will communicate with your back-end through an API. 
- expose that API that satisfies the front-end team’s requirements.
- work with many different request formats
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality

## Versioning

The following versions are recommended for this project.

- Ruby 2.5.3

- Rails 5.2.4.3

## Setup

1. Fork and clone this repo: `https://github.com/BJSherman80/travel_weather.git`
1. Run `bundle install`
1. Setup the database: `rails db:create`
1. Sign up for a [map quest api key](https://developer.mapquest.com/documentation/)
1. Sign up for a [open weather api key](https://openweathermap.org/api/one-call-api)
1. Sign up for a [unsplash api key](https://unsplash.com/documentation)
1. add 'gem figaro' to gem file.
1. run 'figaro install' and add the folling into your 'application.yml' file 
```
GEO_KEY: 5JxLPIiWujoNVzKSu3RvBkPmIqKID9H6
WEATHER_KEY: d45a22fdaaa9cc836469b2a3e49da987
IMAGE_KEY: _V1LJhL2NDdVLUvMRd1C10rl66uJBeBgoyfhXmAK6Lc

```

### Testing
```
1. run 'bundle exec rspec'
1. run 'open coverage/index.html'
  
```

### Weather Requests
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```
## Response:
```
{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "wind_speed": "4 mph",
          "wind_direction": "from NW",
          etc
        },
        {...} etc
      ]
    }
  }
}
```

### Background Image Request
```
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
```
## Response
```
=> {"data"=>
  {"id"=>nil,
   "type"=>"image",
   "attributes"=>
    {"image"=>
      "https://images.unsplash.com/photo-1589046212139-bf293b6eba18?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MXwxOTk1NTh8MHwxfHNlYXJjaHwxfHxwaG9lbml4LGF6fGVufDB8fHw&ixlib=rb-1.2.1&q=80&w=1080",
     "description"=>"Desert Cactus ",
     "photographer"=>"https://unsplash.com/@joecook",
     "credit"=>"Credit to Unsplash.com"}}}
```
### User Registration Request
```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
## Response 
```
=> {:data=>{:id=>"50", :type=>"users", :attributes=>{:email=>"user@google.com", :api_key=>"L8LTSbEGPaxt6jyvWmpQafin"}}}

```

### Login Request 
```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "whatever@example.com",
  "password": "password"
}
```
## Response 
```
{:data=>{:id=>"54", :type=>"users", :attributes=>{:email=>"bjsherman80@gmail.com", :api_key=>"A2tKUDmrbtTJczCRzuy7e56q"}}}
```
### Roadtrip Request
```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```
## Response
```
 {"data"=>
  {"id"=>nil,
   "type"=>"road_trip",
   "attributes"=>
    {"location"=>"Denver,CO",
     "destination"=>"Pueblo,CO",
     "travel_time"=>"01 hours 50 minutes",
     "arrival_forecast"=>{"temperature"=>52.52, "conditions"=>"clear sky"}}}}
```

### Author
- [**Brett Sherman**](https://github.com/BJSherman80)





