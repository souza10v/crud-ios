# Crud iOS App

https://youtu.be/dF8pHDY0ETA

This project is a comprehensive example of a CRUD (Create, Read, Update, Delete) application, designed to demonstrate the integration of a modern iOS frontend with a robust backend service. Developed using SwiftUI for the frontend, this application leverages the declarative UI framework to build a responsive and intuitive user interface. The backend is powered by Node.js, providing a scalable and efficient server-side environment that interacts with a MongoDB database to manage user data seamlessly.

The primary goal of this project is to illustrate how to effectively handle basic data operations—such as creating new user records, reading existing user information, updating user details, and deleting user entries—while maintaining a clean and efficient codebase. By employing SwiftUI, the frontend code remains concise and expressive, allowing developers to focus on the user experience. The use of Node.js for the backend ensures that server-side logic is both performant and easy to maintain, with MongoDB offering a flexible and powerful solution for data storage.

Key highlights of this project include:

SwiftUI Frontend: The use of SwiftUI allows for the creation of dynamic and interactive user interfaces with less code. The declarative syntax makes it easy to visualize the app’s structure and behavior.
Node.js Backend: Node.js is used for building the backend server, leveraging its non-blocking, event-driven architecture to handle multiple requests efficiently.
MongoDB Integration: The application connects to a MongoDB database, which is well-suited for handling JSON-like documents, offering high performance, high availability, and easy scalability.
RESTful API: The backend exposes a RESTful API, enabling standard HTTP methods to perform CRUD operations. This ensures that the frontend and backend communicate seamlessly.
Separation of Concerns: The project is structured to clearly separate the frontend and backend logic, promoting maintainability and scalability.
By integrating these technologies, this project not only serves as a learning tool for developers but also provides a solid foundation for building more complex applications. Whether you're looking to understand the basics of CRUD operations or seeking to explore the capabilities of SwiftUI and Node.js in a real-world scenario, this application offers valuable insights and practical experience.

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
