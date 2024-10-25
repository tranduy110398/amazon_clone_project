// CREATING AN API
const PORT = 3000;
// GET, PUT, DELETE, UPDATE => CRUD

const express = require('express')
const mongoose = require('mongoose');
const app = express()
const DB = "mongodb+srv://tranduy:Z8UHx5k-k6_vkeu@cluster0.udmc1eg.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

const authRouter = require("./routes/auth")


app.use(express.json());
// Parsing Incoming Data
// Use Cases: If your application needs to accept JSON, URL-encoded form data, raw text, or file uploads, 
// middleware will make it easier to parse and access this data in req.body.
// Middleware: express.json() for JSON, express.urlencoded() for form data, or multer for file uploads.

app.use(authRouter);
// Organizing Routes
// Use Cases: To keep your code modular, especially in larger applications where 
// you want to separate routes into different files.
// Global, general middleware (e.g., parsers, logging) belongs in index.js or app.js



mongoose.connect(DB).then(() => {
    console.log("Connection successful!");
}).catch((e) => {
    console.log(e);  
})

// app.get('/hello-world', function (req, res) {
// res.send('Hello World')
// })

// app.get('/', (req, res) =>{
//     res.json({'name': 'jack'});
// })

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected at Port ${PORT}`);
})

//app.listen(3000)