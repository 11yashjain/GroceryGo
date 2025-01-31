const mongoose = require("mongoose");
const { Schema, model } = mongoose; // Destructure Schema and model

const userSchema = Schema({
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
       /* validate: {
            validator: (value)=>{
                return value.length > 6;
            },
            message: 'please enter password with more than 6 characters',
        }*/
    },
    address:{
        type:String,
        default: '',
    }
});

module.exports = model("User", userSchema); //converting schema into model and exporting it.
