# Crud iOS App

This is a simple CRUD (Create, Read, Update, Delete) iOS application developed using SwiftUI for the frontend and Node.js for the backend. The app interacts with a MongoDB database to manage user data.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Endpoints](#endpoints)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Create User**: Add new users to the database.
- **Read User**: Fetch and display a list of users from the database.
- **Update User**: Edit user information.
- **Delete User**: Remove users from the database.

## Requirements

- Xcode 12 or later
- iOS 14 or later
- Node.js 14 or later
- MongoDB

## Installation

### Backend

1. Clone the repository:

    ```sh
    git clone https://github.com/souza10v/crud-ios-app.git
    cd crud-ios-app/backend
    ```

2. Install dependencies:

    ```sh
    npm install
    ```

3. Set up your MongoDB database and update the `DATABASE_URL` in your `.env` file.

4. Start the backend server:

    ```sh
    npm start
    ```

### Frontend

1. Open `Crud.xcodeproj` in Xcode.

2. Make sure the backend server is running.

3. Build and run the app on your simulator or device.

## Usage

1. **Create User**: Navigate to the "Add User" screen, enter user details, and submit.
2. **Read User**: The user list is displayed on the main screen.
3. **Update User**: Tap the edit icon next to a user, modify the details, and save.
4. **Delete User**: Tap the delete icon next to a user and confirm the deletion.

## Endpoints

### GET /customers

Fetch all users.

### POST /customer

Create a new user. Request body should contain:

```json
{
  "name": "User Name",
  "email": "user@example.com",
  "position": "User Position"
}
