//IMPORT FROM PACKAGES
const express = require("express");
const json = express.json;
const mongoose = require("mongoose");

//IMPORT FROM OTHER FILES
const authRouter = require("./routes/auth");
const userRouter = require("./routes/user");

//INITILIZATION
const PORT = 4000;
const app = express();
const DB = "mongodb+srv://vaibhav:vaibhav_database@cluster0.87yph.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

//MIDDLEWARE
app.use(json());
app.use(authRouter);     //client -> server -> middleware -> client
app.use(userRouter);

//CONNECTIONS
mongoose.connect(DB).then(()=>{
    console.log("connection successfull");
}).catch(e => {
  console.log(e);    
});

//listening 
app.listen(PORT,"0.0.0.0",()=>{
   console.log(`connected at port ${PORT} `);
});  