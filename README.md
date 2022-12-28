# Url Shortener

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
