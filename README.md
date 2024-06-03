# README
LMS - Library Management System

Backend: RoR (api only)
Frontend: React with Typescript

I've configured the project to use docker and docker-compose to make it easier to run.

# Instruction to run it in development mode
Create a new folder and clone both repositories in the same folder:

eg.
```
mkdir LMS && cd LMS
git clone https://github.com/KamilTy/lms_react.git
git clone https://github.com/KamilTy/library_management_system.git
cd library_management_system
```

Create a .env file with the following environment variables (for running commands in db container instance)
```
DATABASE_HOST=localhost
DATABASE_PORT=5432
DATABASE_USER=postgres
DATABASE_PASSWORD=password
```

`docker-compose up` or `docker compose up` (depending on how docker-compose is installed)

It should create 3 containers: db(postgresql), rails and react

Run the following commands:
```
RAILS_ENV=development rails db:create
RAILS_ENV=development rails db:migrate
RAILS_ENV=development rails db:seed
```

React Frontend is available at http://localhost:3000

RoR Backend is available at http://localhost:3001

Postgres is available at http://localhost:5432


To prepare test environment:
```
RAILS_ENV=test rails db:create
RAILS_ENV=test rails db:migrate
RAILS_ENV=test rails db:seed
```

To run tests:
```
RAILS_ENV=test rails rspec
```

# Features Available
- Authentication with Devise and Devise-jwt:
  - user registration
  - login and logout (revoking jwt access)
- Authorization: 'Librarian' role is able to:
  - create new books (choose existing author or genre or create a new one)
  - delete books
  - see actions only available for librarians (add a copy, edit, delete)
- API endpoints for the features that were implemented
- Frontend in React and Typescript with Tailwind CSS

# Features yet to implement
- Different Dashboards for Member and Librarian
- Allow Members to borrow books
- Allow Librarian to mark books returned
- Search books by using different attributes

# A bit about the approach I chose
As this assesment is for the backend role I thought of using rails in API mode only and to show how my backend would work with a separate frontend I chose it to be in React and Typescript. It would definitely have been quicker if I implemented it using a typical 'monolith way'. I chose React with Typescript to learn how to implement it separate from Rails (in my current project we use rails monolith with React and Typescript components), just didn't know that it would take so much time to do so little.
