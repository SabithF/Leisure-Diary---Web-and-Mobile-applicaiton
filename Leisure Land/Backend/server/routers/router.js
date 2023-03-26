const express = require('express');
const route = express.Router();
const services = require('../services/render');
const AuthController = require('../controller/authController');



/**
 * @description Root route
 * @method GET
 */
route.get('/', services.loginRoute);



route.post('/register', AuthController.register)



//  api


 
 module.exports = route;