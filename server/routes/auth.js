const express = require("express");
const Router = express.Router; // Access `Router` from `express`
const User = require("../models/user.js");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const user = require("../models/user.js");
const auth = require("../middlewares/auth.js");
const sign = jwt.sign; 

const authRouter = Router(); 

//SIGN UP
authRouter.post("/api/signup",async (req,res)=>{               //creating an api 
  try{
    const {name,email,password} = req.body;   //getting data from client

  const existingUser = await User.findOne({ email });
  if(existingUser){
    return res.status(400).json({msg:"User already exists with same email !"});
  }
  
  const hashedPassword = await bcrypt.hash(password,8);

  let user = new User({
    email,
    password : hashedPassword,
    name,
  });
  user = await user.save();   //sending data to database
  res.json(user);
  }catch(e){
    res.status(500).json({error: e.message});
  }
});

//SIGN IN
authRouter.post("/api/signin",async (req,res)=>{
  try{
    const {email,password} = req.body;   //data from user
    const user = await  User.findOne({ email });     //check if it is correct(self)
    
    

    if(!user){
      return res.status(400).json({msg:"User Does not exist!"});
    }

   const isMatch = await bcrypt.compare(password,user.password);
   if(!isMatch){
       return res.status(400).json({msg:"Incorrect password."});
   }
   const token = sign({id: user._id},"passwordKey");
   res.json({token,...user._doc});
  }catch(e){
    res.status(500).json({error: e.message});
  }
});

authRouter.post("/isTokenValid", async (req,res)=>{
try{
  const token = req.header("x-auth-token");
  if(!token) return res.json(false);                 // checking token check if present or not.
  const verified = jwt.verify(token,"passwordKey");
  if(!verified) return res.json(false);              // checking token is correct and verified or not.
  const user = await User.findById(verified.id);
  if(!user) return res.json(false);                  // checking if user id is correct or not.
  res.json(true);
}catch(e){
  res.status(500).json({error: e.message});
  console.log( res.status(500).json({error: e.message}));
 }
}); 

// get user data

authRouter.get('/',auth, async (req,res)=>{
  const user = await User.findById(req.user);
  res.json({...user._doc, token: req.token});
});

module.exports = authRouter;  // here we are making this variable public for every file from private
