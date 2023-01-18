<div align="center">
  <h1>Lunch and Learn API</h1>
</div>

## Table of Contents
- [Learning Goals](#learning-goals)
- [External APIs](#external-apis)
- [Setup](#setup)
- [Endpoints](#endpoints)

## Learning Goals
The learning goals for this project were:
- Create an API that aggregates data from other external APIs
- Create an API that requires an authentication token
- Create an API that contains CRUD functionality
- Determine the needs of other developers and create appropriate endpoints
- Test API consumption and exposure with the help of mocking tools (WebMock, VCR)

## External APIs
- REST Countries API (https://restcountries.com/#api-endpoints-v3-all)
- Edamam Recipe Search API (https://developer.edamam.com/edamam-recipe-api)
- Youtube Data API (https://developers.google.com/youtube/v3/getting-started)
- Pexels API (https://www.pexels.com/api/)

## Setup

1. Clone the repository
2. cd into the root directory
3. Install gem packages: `bundle install`
4. Setup the database: `rails db:{drop,create,migrate}`
5. Run `bundle exec figaro install`
6. Acquire API keys/app IDs from the above APIs and place them into application.yml as described in the file

## Endpoints
When using locally, use `localhost:300` as the root.
- ### Recipes
<details close>
<summary>Get Recipes from a Country</summary>
<br>

Returns a list of recipes from the given country, sourced from Edamam.

Request: <br>
```
GET api/v1/recipes?country=#{country_name}
```
Example:
[Get Recipes from China](localhost:3000/api/v1/recipes?country=China)

JSON Response Example:
```json
{
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Peach Tart with Amer",
                "url": "http://www.edamam.com/ontologies/edamam.owl#recipe_b346506ffc714ec825ea4335c253e7e5",
                "country": "china",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/8bf/8bf108b5dc81cb0302c9376f51478a92.JPG?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIBoApl6t1bWl8b%2FdqIuC9DdohAklin%2BLvqzwkjnSs9WRAiEAj6zogI0eFG%2F%2FFBcWMaEpgjmhND1nwHRFyYovgzueCKMqzAQIZBAAGgwxODcwMTcxNTA5ODYiDP8MPUU%2F%2F45TTl81xiqpBOC6%2B5Z4UGojzfe60ibaRsoWu7jvVsqcas9yJqlTYpXuu%2FBLtIMW7ItqcTrpXqSzFXWAUP%2B%2FCngHX2lwSbCgdFopUn7oDLxM6N1y8oPTasr1aIYELEyZU8Jv9JheijNPtyUgMOFgNraytVqsMp1067P9ZCtkIWi%2BUtP3p1Nwn17j7RyJz7uftFmV6mEFg38VUuWBIZZqqsBKXr%2BOctRvHCAudiaDiUucDHLPRm4DeU27R5sS%2B6IHPT4zHwq4GZ0TDpIMIx2EswF%2BO6TihShLAwcESu8CLVcxHZIhHY5efksgqQlbSWvydblNAXipkkP88rTRT8IaEMRQBJci7Hv58BP%2FwIBJToIeoiMCl%2FWGic%2B0HyNyV2zaBJwyX7EN9xg71hvlk%2BBrGABddw%2BYe4lN9F8d3xrrpL%2B9rtrsJke253JNgo17wyZbrpDsIZHld5Hstp2LxUlPPXJ94z7BSNRSSEBelc8kNr8Tg6zsD4eESy5u3zS3H06z1Sz1k9Wa4hC9oEpCnhL7abXr3w%2FsMYTJwbHnnyyqM8D2JOPSvc8mBSCHJqZXhdy9sMIUkNRILpvi%2BFxi8aajiUwRD30BUi42ygJbWHpQ2DkbB1EwVjvrFbw%2FAx5U6AM51FJvTbDMfVdt9lt7D%2Fp59fk1YXM2Ju9oGHYKQxO2p96r2AWuGXeP9CIdqwLoAnApObRwVr8hIVumKigeDD5Tc4DoaGNUCLCbaWq5WIF35BaMZtYwsvugngY6qQFcFnaIJmhgLoP5%2FSBaqFe9BfdzhVEWSDZzKXUUHWuX%2BWvYt1qvqo5YLiIes1n02Q2SYZKE6er0kLc8MxY%2BBv02g%2FsCpyJmOKdplhM5hPuu69%2BUqT5FwSXA%2FBVrXsvQEMS7zxJRuib6u32fE%2BwKU03BuXWHCfVGWwdKAdXrooZmKI686WzZhe0UOCzdY6SDGBoxH%2B07iXtJ57uwsDixZ1Mxm05mkJb7boaR&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230118T193157Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFGXT5H7HF%2F20230118%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=26198ac68ed153039d054ad75870de80e51535982b1d362c318ce4cd37b121a4"
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "China Clipper",
                "url": "http://www.edamam.com/ontologies/edamam.owl#recipe_d916f748b4b64ddd7de56074999fbd33",
                "country": "china",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/a39/a397cd414419e89db3028791d219eb81.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIBoApl6t1bWl8b%2FdqIuC9DdohAklin%2BLvqzwkjnSs9WRAiEAj6zogI0eFG%2F%2FFBcWMaEpgjmhND1nwHRFyYovgzueCKMqzAQIZBAAGgwxODcwMTcxNTA5ODYiDP8MPUU%2F%2F45TTl81xiqpBOC6%2B5Z4UGojzfe60ibaRsoWu7jvVsqcas9yJqlTYpXuu%2FBLtIMW7ItqcTrpXqSzFXWAUP%2B%2FCngHX2lwSbCgdFopUn7oDLxM6N1y8oPTasr1aIYELEyZU8Jv9JheijNPtyUgMOFgNraytVqsMp1067P9ZCtkIWi%2BUtP3p1Nwn17j7RyJz7uftFmV6mEFg38VUuWBIZZqqsBKXr%2BOctRvHCAudiaDiUucDHLPRm4DeU27R5sS%2B6IHPT4zHwq4GZ0TDpIMIx2EswF%2BO6TihShLAwcESu8CLVcxHZIhHY5efksgqQlbSWvydblNAXipkkP88rTRT8IaEMRQBJci7Hv58BP%2FwIBJToIeoiMCl%2FWGic%2B0HyNyV2zaBJwyX7EN9xg71hvlk%2BBrGABddw%2BYe4lN9F8d3xrrpL%2B9rtrsJke253JNgo17wyZbrpDsIZHld5Hstp2LxUlPPXJ94z7BSNRSSEBelc8kNr8Tg6zsD4eESy5u3zS3H06z1Sz1k9Wa4hC9oEpCnhL7abXr3w%2FsMYTJwbHnnyyqM8D2JOPSvc8mBSCHJqZXhdy9sMIUkNRILpvi%2BFxi8aajiUwRD30BUi42ygJbWHpQ2DkbB1EwVjvrFbw%2FAx5U6AM51FJvTbDMfVdt9lt7D%2Fp59fk1YXM2Ju9oGHYKQxO2p96r2AWuGXeP9CIdqwLoAnApObRwVr8hIVumKigeDD5Tc4DoaGNUCLCbaWq5WIF35BaMZtYwsvugngY6qQFcFnaIJmhgLoP5%2FSBaqFe9BfdzhVEWSDZzKXUUHWuX%2BWvYt1qvqo5YLiIes1n02Q2SYZKE6er0kLc8MxY%2BBv02g%2FsCpyJmOKdplhM5hPuu69%2BUqT5FwSXA%2FBVrXsvQEMS7zxJRuib6u32fE%2BwKU03BuXWHCfVGWwdKAdXrooZmKI686WzZhe0UOCzdY6SDGBoxH%2B07iXtJ57uwsDixZ1Mxm05mkJb7boaR&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230118T193157Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFGXT5H7HF%2F20230118%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=324d032640861a31fa9cbb9bc269d1ba67f8919abeb502c404ad63e47aee64a2"
            }
        }
    ]
}
```

To get recipes from a random country, omit the country parameter: <br>
```
GET /api/v1/recipes
```
</details>

<details close>
<summary>Get Learning Resources for a Country</summary>
<br>

Returns a video from Youtube about the country and gives an array of images from Pexels relating to the country.

Request: <br>
```
GET /api/v1/learning_resources?country=#{country_name}
```
Example: 
[Get Learning Resources for France](localhost:3000/api/v1/learning_resources?country=france)

JSON Response Example:
```json
{
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "france",
            "video": {
                "title": "A Super Quick History of France",
                "youtube_video_id": "I22A32uBvRo"
            },
            "images": [
                {
                    "alt_tag": "France Flag on Gray Concrete Building Near Road",
                    "url": "https://images.pexels.com/photos/2272939/pexels-photo-2272939.jpeg"
                },
                {
                    "alt_tag": "Photography of Buildings and Canal during Nighttime",
                    "url": "https://images.pexels.com/photos/2901215/pexels-photo-2901215.jpeg"
                },
                {
                    "alt_tag": "Low-angle Photography of Gray Castle",
                    "url": "https://images.pexels.com/photos/2309272/pexels-photo-2309272.jpeg"
                }
            ]
        }
    }
}
```
</details>

<details close>

<summary>Create a New User</summary>
<br>

Creates a new user and returns that user's information.

Request: <br>
```
POST /api/v1/users
```
Request Body JSON Example:
```
{
  "name": "John Doe",
  "email": "jdoe@generic.com"
}
```
JSON Response Example:
```json
{
    "data": {
        "id": "2",
        "type": "user",
        "attributes": {
            "name": "John Doe",
            "email": "jdoe@generic.com",
            "api_key": "2e99392d9617c26105d6ba29399b34"
        }
    }
}
```
</details>

<details close>
<summary> Save a Favorite Recipe </summary>
<br>

Adds a favorite recipe to the user that corresponds to the given API key.

Request: <br>
```
POST /api/v1/favorites
```
Request Body JSON Example:
```
{
  "api_key": "test_api_key",
  "country": "thailand",
  "recipe_link": "https://www.tastingtable.com/.....",
  "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
}
```
JSON Response Example:
```json
{
    "success": "Favorite added successfully"
}
```
</details>

<details close>
<summary> Get Favorite Recipes </summary>
<br>

Returns a list of favorites for the user with the given API key.
Request: <br>
```
GET /api/v1/favorites?api_key=#{existing_api_key}
```

JSON Response Example:
```json
{
    "data": [
        {
            "id": "3",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                "recipe_link": "https://www.tastingtable.com/.....",
                "country": "thailand",
                "created_at": "2023-01-18T19:50:55.113Z"
            }
        }
    ]
}
```
</details>
