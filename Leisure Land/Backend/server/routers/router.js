const express = require('express');
const route = express.Router();
const services = require('../services/render');
const AuthController = require('../controller/authController');



/**
 * @description Root route
 * @method GET
 */
route.get('/dashboard/accomodation', (req, res)=>{
    res.render('accomodation', {title: 'Accomodations- Leisure Diary'})
 });


 module.exports = route;