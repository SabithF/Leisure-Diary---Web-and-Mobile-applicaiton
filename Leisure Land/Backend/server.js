const express = require('express');
const path =require('path');
const morgan = require('morgan');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');
const connectDB = require('./server/database/connection');
const route = require('./server/routers/router')

const app=express();

// Assigning a PORT
dotenv.config({path:'config.env'});

const PORT=process.env.PORT || 3000;

// Morgan Module--log request
app.use(morgan('dev')); 


// Database coonection
connectDB();

// parse request to body-parser
// app.use(bodyparser.json());
app.use(bodyParser.urlencoded({ extended: true }));


// set view engine "ejs"/ "HTML"
app.set("view engine","ejs");

// load assets
app.use('/css', express.static(path.resolve(__dirname, "assets/css")));
app.use('/img', express.static(path.resolve(__dirname, "assets/img")));
app.use('/js', express.static(path.resolve(__dirname, "assets/js")));

// loading routers
app.use('/', require('./server/routes/router'));



app.listen(PORT, ()=> {console.log('Server is running on', PORT)})
