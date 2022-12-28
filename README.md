# Url Shortener

With this app, you can quickly and easily create short links to share with friends, family, and colleagues.

This app receives an url, checks for its validity, saves in the database, convert the id into an unique hash and returns the original and the shorten url version.

When the users go to the shorten version, it redirects to the original long url.

After the app shortens the URL, it sends a job to scrape the original long url and saves the page title's.

## Features

- Create short URLs with custom aliases
- Redirect to URL when fed with custom alias

## **Create URL**

Shortens url

- **URL**
  /api/v1/user
- **Method:**
  `POST`
- **Body**
  ```
  {
    "url": {
      "url": "www.youtube.com",
    }
  }
  ```
- **Success Response:**
  - **Code:** 200
    **Content:**
    ```
    {
      "long_url": "www.youtube.com",
      "short_url": "http://localhost:3000/k"
    }
    ```
- **Error Response:**
  - **Code:** 400 BAD REQUEST
    **Content:** `{ "message": "banana is an invalid Url" }`

## **Redirect**

- **URL**
  /k
- **Method:**
  `Get`
- **Success Response:**
  - **Code:** 302
    Redirects to "www.youtube.com"
