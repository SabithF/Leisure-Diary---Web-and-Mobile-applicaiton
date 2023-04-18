const mongoose = require('mongoose');
const Schema= mongoose.Schema;


const food = new Schema({
    
      
    title: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    image: {
        data: Buffer,
        contentType:String,
        
    },
    price: {
        type: String,
        required: true,
    },
    location: {
        type: String,
        required: true,
    },
    
    phone: {
        type: String,
        required: true,
    },

    
    created:{
        type: Date,
        required: true,
        default: Date.now
    }


    
},{collection: 'Food'}, {timestamps: true}
);

// Accomodation is the model here
module.exports =mongoose.model('food', food);

