const mongoose = require('mongoose');
const Schema= mongoose.Schema;
const bcrypt = require('bcrypt');

const travellerModel = new Schema ({
    name: {
        type: String,        
        require: true,
        unique: true
        
    },
    email: {
        type: String,
        lowercase: true,
        require: true,
        unique: true
        
    },
    password: {
        type: String,
        require: true
    }
})

travellerModel.pre('save', async function(){
    try {
        var traveller = this;
        const salt = await(bcrypt.genSalt(10));
        const hashpass = await bcrypt.hash(traveller.password, salt);

        traveller.password= hashpass;
    } catch (error) {
        throw error;
    }
},{collection: 'Travellers'}
)

travellerModel.methods.comparePassword = async function(userPassword){
    try {

        console.log('no password', this.password)
        const isMatch = await bcrypt.compare(userPassword,this.password);
        return isMatch;
    } catch (error) {
        throw error
    }
}


const TravellerMod = mongoose.model('Traveller', travellerModel);

module.exports = TravellerMod;