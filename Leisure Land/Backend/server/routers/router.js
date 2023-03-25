const express = require('express');
const route = express.Router();
const services = require('../services/render');


/**
 * @description Root route
 * @method GET
 */
 route.get('/', services.loginRoute);

 module.exports = route;