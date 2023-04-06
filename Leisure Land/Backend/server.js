const express = require('express');
const path =require('path');
const morgan = require('morgan');
const dotenv = require('dotenv');
const connectDB = require('./server/database/connection');
const serProvModel = require('./server/model/serviceProvider')
const bcrypt =require('bcryptjs');
const { response } = require('express');
const jwt = require('jsonwebtoken')
const session = require('express-session')


const app=express();



// app.use(bodyParser.json());
app.use(express.json());
app.use(express.urlencoded({ extended: true}));
app.disable('etag');

app.use(
    session({
        secret: "My Secret Key",
        saveUninitialized: true,
        resave: false,
    })
);

app.use((req, res, next)=> {
    res.locals.message = req.session.message;
    delete req.session.message;
    next();
})

// Assigning a PORT
dotenv.config({path:'config.env'});

const JWT_SECRET= process.env.JWT_SECRET;

const PORT=process.env.PORT || 3000;

// Morgan Module--log request
app.use(morgan('dev')); 


// Database coonection
connectDB();

// app.use(express.static("uploads"));

app.set('view engine', 'ejs');



// load assets
app.use('/css', express.static(path.resolve(__dirname, "assets/css")));
app.use('/img', express.static(path.resolve(__dirname, "assets/img")));
app.use('/js', express.static(path.resolve(__dirname, "assets/js")));
app.use('/', express.static(path.join(__dirname, 'views')));

app.use('/uploads', express.static(path.resolve(__dirname, "uploads")));



// login API
app.post('/api/login', async (req, res)=> {

    // Validating username and password 
    const {username, password}= req.body
    console.log('Data input by the user is',req.body)
    const servPro = await serProvModel.findOne({username}).lean()

    // check if the record is exist 
    if(!servPro){
        return res.json({status:'error', error: 'User not available'})
    }

    if (await bcrypt.compare(password, servPro.password)){

        // if the username password combination is successful
        const token = jwt.sign({
            id: servPro._id,
            username: servPro.username
        }, JWT_SECRET)
        return res.json({status: 'ok', data: token})
        // res.redirect('dashboard');

        // 
    }

    res.json({status: 'error', error: 'Invalid username/password'});
})

// USER REGISTRATION
app.post('/api/register', async (req, res)=>{
    // get the inputs
    const {username, email, password: plainTextPassword}= req.body

    // validation error- USERNAME
    if(!username || typeof username != 'string'){
        return res.json({status: 'error', error: 'Invalid username'})
    }
    // validation error- EMAIL
    if(!email || typeof email != 'string'){
        return res.json({status: 'error', error: 'Invalid email'})
    }
    // validation error- PASSWORD
    if(!plainTextPassword || typeof plainTextPassword != 'string'){
        return res.json({status: 'error', error: 'Invalid password'})
    }

    if(plainTextPassword.length <5){
        return res.json({status: 'error', error: 'Password should be at least more than 6 Characters'})
    }

    const password = await bcrypt.hash(plainTextPassword, 10)
    
    try {
        const response = await serProvModel.create({
            username, email, password
        })
        console.log('Service provider created successfully',response)
    } catch (error) {
        // 11000 duplicate key error 
        if(error.code == 11000){
            return res.json({status: 'error', error: 'User Name / Email already in use'})
        }
        throw error
        
    }


    
    // print the request ----------------
    // console.log(req.body);
    // serProvModel.
    res.json({status: 'ok'})
})

 app.get('/dashboard', (req, res)=>{
res.render('dashboard')
 })

 app.use('', require('./server/routers/router'));



app.listen(PORT, ()=> {console.log('Server is running on', PORT)})
