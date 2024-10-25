// CREATING AN API
const PORT = 3000;
// GET, PUT, DELETE, UPDATE => CRUD

const express = require('express')
const mongoose = require('mongoose');
const app = express()
const DB = "mongodb+srv://tranduy:Z8UHx5k-k6_vkeu@cluster0.udmc1eg.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

const authRouter = require("./routes/auth")

// MIDDLEWARE
// Middleware manipulates the data that we are sending
// CLIENT -> middleware -> SERVER -> SERVER -> STOP
app.use(express.json());
app.use(authRouter);

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