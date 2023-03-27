const express = require('express');
const path =require('path');
const morgan = require('morgan');
// const bodyParser = require('body-parser');
const dotenv = require('dotenv');
const connectDB = require('./server/database/connection');
// const route = require('./server/routers/router')
// const Authroute = require('./server/routers/auth')
const serProvModel = require('./server/model/serviceProvider')
const bcrypt =require('bcryptjs');


const app=express();


// parse request to body-parser
// app.use(bodyParser.urlencoded({ extended: true }))

// app.use(bodyParser.json());
app.use(express.json());
app.use(express.urlencoded({ extended: true}));

// Assigning a PORT
dotenv.config({path:'config.env'});

const PORT=process.env.PORT || 3000;

// Morgan Module--log request
app.use(morgan('dev')); 


// Database coonection
connectDB();


// app.use(bodyParser.urlencoded({ extended: true }));


// set view engine "ejs"/ "HTML"
// app.set("view engine","html");

// load assets
app.use('/css', express.static(path.resolve(__dirname, "assets/css")));
app.use('/img', express.static(path.resolve(__dirname, "assets/img")));
app.use('/js', express.static(path.resolve(__dirname, "assets/js")));
app.use('/', express.static(path.join(__dirname, 'views')))


// loading routers
// app.use('/api', Authroute);
// app.use('/', require('./server/routers/router'));

app.post('/api/register', async (req, res)=>{
    // get the inputs

   
    // const {username, email, password: plainTextPassword}= req.body

    // console.log(await bcrypt.hash(plainTextPassword, 10))

    // const password = await bcrypt.hash(plainTextPassword, 10)
    
    // try {
    //     const response = await serProvModel.create({
    //         username, email, password
    //     })
    //     console.log('Service provider created successfully',response)
    // } catch (error) {
    //     console.log(error)
    //     return res.json({status: 'error'})
        
    // }
    
    console.log(req.body);
    // serProvModel.
    res.json({status: 'ok'})
   
})




app.listen(PORT, ()=> {console.log('Server is running on', PORT)})
