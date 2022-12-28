# Url Shortener

With this app, you can quickly and easily create short links to share with friends, family, and colleagues.

## Features

- Create short URLs with custom aliases
- Redirect to URL when fed with custom alias

## API

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
