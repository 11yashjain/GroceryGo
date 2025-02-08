const mongoose = require("mongoose");
const {productSchema} = require("./product"); // Destructure Schema and model

const userSchema = mongoose.Schema({
    name: {
        requried: true,
        type:String,
        trim: true,
    },
    email:{
        requried: true,
        type:String,
        trim: true,
        validate: {
            validator: (value)=>{
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re);
            },
            message: 'please enter a valid email address',
        },
    },
    password: {
        requried: true,
        type: String,
    },
    address:{
        type:String,
        default: '',
    },
    type: {
        type: String,
        default: "user",
      },
      cart: [
        {
          product: {type:mongoose.Schema.Types.ObjectId,
            ref:'Product',
            required:true},
          quantity: {
            type: Number,
            required: true,
          },
        },
      ],
});

module.exports = mongoose.model("User", userSchema); //converting schema into model and exporting it.
