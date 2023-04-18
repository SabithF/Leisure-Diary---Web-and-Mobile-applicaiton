const mongoose = require('mongoose');
const Schema= mongoose.Schema;


const transportation = new Schema({
    
      
    title: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    otherdesc: {
        type: String,
        
    },
    image: {
        data: Buffer,
        contentType:String,
        
    },
    price: {
        type: String,
        required: true,
    },
    vehicletype: {
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


    
},{collection: 'Transpotation'}, {timestamps: true}
);

// Accomodation is the model here
module.exports =mongoose.model('Transpotation', transportation);

