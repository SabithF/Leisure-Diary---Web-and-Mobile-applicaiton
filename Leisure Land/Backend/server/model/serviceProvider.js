const mongoose = require('mongoose');
const Schema= mongoose.Schema;
// const bcrypt = require('bcryptjs');


const serviceProvideSchema = new Schema ({
    username: {
        type: String,
        unique: true,
        required: true,
        
    },
    email: {
        type: String,
        unique: true,
        required: true
    },
    
    password:{
        type: String,
        required: true

    },
    

}, {collection: 'serviceProvider'}
// {timestamps: true}
);


const ServiceProvider = mongoose.model('serviceProvideSchema', serviceProvideSchema);
module.exports = ServiceProvider;