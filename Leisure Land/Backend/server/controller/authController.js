const ServiceProvider = require('../model/serviceProvider');
const UserService = require('../services/servProvider')
const bcrypt =require('bcryptjs');
const jwt = require('jsonwebtoken');


// registration
const register = async (req, res, next)=> {
bcrypt.hash(req.body.password, 10, function(err, hashedPass){
    if(err){
        res.json({
            error: err
        })
    }
    let serviceProvider = new ServiceProvider({
        name: req.body.name,
        email: req.body.email,
        address: req.body.address,
        phone: req.body.phone,
        password: hashedPass
    
    })
    serviceProvider.save()
    .then(serviceProvider => {
        res.json({
            message: 'User created Successfully!'
        })
    })
    .catch(error => {
        res.json({
            message: 'Error in creating new User'
        })
    })
})


}


// try {
//     const{name,email,address,phone,password}=req.body;

//     const isSuccess = await UserService.registerUser(name,email,address,phone,password);

//     res.json({
//         status: true,
//         sucess: "User created Successfully"

//     })
// } catch (error) {
    
// }

// }
module.exports = {
    register
}