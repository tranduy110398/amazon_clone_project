const express = require('express');
const User = require('../models/user');

const authRouter = express.Router();

authRouter.post("/signup", async (req, res) => {
    // use async because searching in database will take a lot of time.
    try{
        const { name, email, password } = req.body;

        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res
            .status(400)
            .json({ msg: "User with same email already exists!" });
        }
        let user = new User({
            email,
            password,
            name,
        });
        user = await user.save();
        res.json(user);
    }catch(e) {
        res.status(500).json({error: e.message});
    }
    
    // get data from the client
    // post that data in database
    // return that data to user
})
module.exports =  authRouter;