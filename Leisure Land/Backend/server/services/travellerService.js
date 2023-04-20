const TravellerMod = require('../model/traveller')
const jwt = require('jsonwebtoken');

class TravellerService{
    static async registerUser(name, email, password){
        try {
            const createUser = new TravellerMod({name,email,password});
            return await createUser.save();
        } catch (error) {
            throw error;
            
        }
    }

    static async checkUser(email){
        try {
            return await TravellerMod.findOne({email});
        } catch (error) {
            throw error
            
        }
    }

    static async generateToken(tokenData, JWTSecret_Key, JWT_EXPIRE){
        return jwt.sign(tokenData, JWTSecret_Key, {expiresIn:JWT_EXPIRE});

    }
}

module.exports = TravellerService;