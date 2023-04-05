const mongoose = require('mongoose');
const Schema= mongoose.Schema;


const AccomodationModel = new Schema({
    
    serviceProvider: {
        type: String,
        required: true,
    },
    
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
    location: {
        type: String,
        required: true,
    },
    image: {
        type: String,
         required: true,
    },
    price: {
        type: String,
        required: true,
    },
    category: {
        type: String,
        required: true,
    },
    phone: {
        type: String,
        required: true,
    },

    availabilty: {
        type: Date,
    },

    created:{
        type: Date,
        required: true,
        default: Date.now
    }


    
},{collection: 'Accomodation'}, {timestamps: true}
);

// Accomodation is the model here
module.exports =mongoose.model('Accomodation', AccomodationModel);

