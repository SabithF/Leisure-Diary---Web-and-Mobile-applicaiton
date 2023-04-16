const mongoose = require('mongoose');
const Schema= mongoose.Schema;



const reservation = new Schema ({
    username: {
        type: String,
       
        
    },
    title: {
        type: String,
        
    },
    price: {
        type: String,
        
    },
    phone: {
        type: String,
        
    },

    date:{
        type: String,
        

    },
    

}, {collection: 'Reservations'}

);


const Reservations = mongoose.model('reservation', reservation);
module.exports = Reservations;