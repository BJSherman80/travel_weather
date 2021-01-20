![](https://img.shields.io/badge/Ruby-2.5.3-orange) 

# Travel Weather App

#
Learning Goals: 
- work in a service-oriented architecture. 
- front-end will communicate with your back-end through an API. 
- expose that API that satisfies the front-end team’s requirements.
- work with many different request formats
## Setup

1. Fork and clone this repo: `https://github.com/BJSherman80/travel_weather.git`
1. Run `bundle install`
1. Sign up for a [map quest api key]()


### Testing
```bundle exec rspec```
## Weather Requests
```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```
Response:
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


