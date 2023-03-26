const mongoose = require('mongoose');
const Schema= mongoose.Schema;
// const bcrypt = require('bcryptjs');


const serviceProvideSchema = new Schema ({
    name: {
        type: String,
         required: true
    },
    email: {
        type: String,
        unique: true,
        required: true
    },
    address: {
        type: String
    },
    phone:{
        type: String
    },
    password:{
        type: String

    }

}, {timestamps: true});

// serviceProvideSchema.pre('save', async function(){
//     try {
//         var serProv = this;
//         const salt = await(bcrypt.gensalt(10));
//         const hashpass = await bcrypt.hash(user.password, salt);
//         serProv.password=hashpass;
        
//     } catch (error) {
//         throw error;
//     }
// })

const ServiceProvider = mongoose.model('ServiceProvider', serviceProvideSchema);
module.exports = ServiceProvider;