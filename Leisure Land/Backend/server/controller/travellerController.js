const TravellerService = require('../services/travellerService');


exports.register= async (req, res, next)=>{
try {
    // getting input
    const {name, email, password} = req.body;

    const isSuccess = await TravellerService.registerUser(name, email, password);

    res.json({
        status: true,
        success:"User registered successfully"
    });   
} catch (error) {
    
}
}


exports.login= async (req, res, next)=>{
try {
    // getting input
    const {email, password} = req.body;
    

    let traveller = await TravellerService.checkUser(email);

    console.log('traveler', traveller);

    if(!traveller){
        throw new Error('User doesn\'t exist');
    }
        const isMatch = await traveller.comparePassword(password);

        if (isMatch=== false) {
            throw new Error('Invalid Password');
        } 

        let tokenData = {_id:traveller._id, email:traveller.email};
        console.log('Token data', tokenData);

        const token= await TravellerService.generateToken(tokenData, "secretKey", '1h');
        console.log('Token', token);
        res.status(200).json({status:true, success:'sendData', token:token});
    
 
} catch (error) {
    console.log(error, 'errorrrrrr');
    next (error);
    
}
}