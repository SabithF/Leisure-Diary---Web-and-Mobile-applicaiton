const axios = require('axios');
const  {query} = require('express');

exports.loginRoute = (req, res) =>{
    res.render('logRegForm');
}


// module.exports = {loginRoute};