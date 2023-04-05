const express = require('express');
const route = express.Router();
const services = require('../services/render');
const AuthController = require('../controller/authController');
const Accomodation = require('../model/accomodation');
const multer = require('multer');
const mongooseValidationErrorHandler = require('mongoose-validation-error-message-handler');
const accomodation = require('../model/accomodation');
const { off } = require('../model/serviceProvider');


// image upload
var storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null, './uploads');
    },
    filename: function(req, file, cb){
        cb(null, file.fieldname+'_'+ Date.now()+'_'+file.originalname);
    },
});

var upload = multer({
    storage: storage,
}).single('image');


// Accomdation inserting 
route.post('/add-accomodation', upload, (req, res) =>{
    const accomodation = new Accomodation({
    serviceProvider:req.body.serviceProvider,
    title: req.body.title,
    description: req.body.description,
    otherdesc: req.body.otherdesc,
    location: req.body.location,
    image: req.file.filename,
    price: req.body.price,
    category: req.body.category,
    phone: req.body.phone,
    availabilty: req.body.availabilty,

    });

    accomodation.save(accomodation)
    .then(data=> {
        
        req.session.message= {
            type: 'Success',
            message: 'Service created successfully'
        }; res.redirect('/dashboard/accomodation');
        // console.log(message);
    })
    .catch(err =>{
        const error = mongooseValidationErrorHandler(err);
        console.log(error);
        res.status(500).send({
            message:err.message || "Error in creating"
        })
    })
    // accomodation.save((err) =>{
    //     if(err){
    //         res.json({message:err.message, type:'dange'});
    //     }else{
    //         req.session.message= {
    //             type: 'Success',
    //             message: 'Service created successfully'
    //         };
    //         res.redirect('/dashboard/accomodation')
        
    //     }
    // })
})


/**
 * @description Root route
 * @method GET
 */
route.get('/dashboard/accomodation', (req, res)=>{

    if(req.query.id){
        const id = req.query.id;
        Accomodation.findById(id).then(data=>
            {
                if(!data){
                    res.status(404).send({message: "Service not Found"})
                }else{
                    res.send(data)
                }
            })
            .catch(err =>{
                res.status(500).send({message: "Error retreving service by ID"})
            })
    }else{
        Accomodation.find().then(accomodation=>{
            res.render('accomodation', {title: 'Accomodations- Leisure Diary', accomodation: accomodation});
            
        })
        .catch(err=>{
            res.status(500).send({message:err.message || "Error on getting all the data"});
        })
    }



    // Accomodation.find().exec((err, accomodation)=>{
    //     if(err){
    //         res.json({message: err.message});
    //     }else{
    //         res.render('accomodation', {title: 'Accomodations- Leisure Diary', accomodation: accomodation}
    //         )}
    // })

    // 
 });

//  add new accomodation
route.get('/create-accomodation', (req, res) =>{
    res.render('create-accomodation', {title: 'Create New Accomodation'} )
})


 module.exports = route;