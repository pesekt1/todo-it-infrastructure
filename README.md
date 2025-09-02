# Todo web application demo for IT Infrastructure course

Clone the repository - for example using VS Code.

## Environment needed to run React.js and node.js express applications

- **Node.js** (recommended version 18.x or later)
- **npm** (comes with Node.js)
- Optionally, a code editor like **VS Code**

To check if Node.js and npm are installed, run:

```bash
node -v
npm -v
```

## Install the dependencies:

for both todo-app and todo-api folders, run:

```bash
npm install
```

## Set up environment variables

In the `todo-api` folder, create a `.env` file with the following content:

```
MONGODB_URI=mongodb://localhost:27017/todos
```

In the `todo-app` folder, create a `.env` file with the following content:

```
VITE_API_URL=http://localhost:5000
```

## Run the application

In the todo-api folder, run:

```bash
npm start
```

In the todo-app folder, run:

```bash
npm run dev
```

## Running MongoDB Server

locally:

- install MongoDB Community Server.
- install MongoDB Compass.
