const express = require('express');
const route = express.Router();
const services = require('../services/render');
const AuthController = require('../controller/authController');
const Accomodation = require('../model/accomodation');
const multer = require('multer');
const mongooseValidationErrorHandler = require('mongoose-validation-error-message-handler');
const accomodation = require('../model/accomodation');
const { off } = require('../model/serviceProvider');
const moment = require('moment/moment');
const fs = require('fs');
const TravellerController = require('../controller/travellerController')

// moment(startDate).format("DD-MM-YYYY").toDate()
// moment(endDate).format("DD-MM-YYYY").toDate()


// image upload
const storage = multer.memoryStorage();
const upload = multer({storage:storage});
// var storage = multer.diskStorage({
//     destination: function(req, file, cb){
//         cb(null, './uploads');
//     },
//     filename: function(req, file, cb){
//         cb(null, file.fieldname+'_'+ Date.now()+'_'+file.originalname);
//     },
// });

// var upload = multer({
//     storage: storage,
//     limits:{
//         fieldSize: 1024*1024*3,
//     },
// });


// Accomdation inserting Saving
route.post('/add-accomodation', upload.single('image'), async (req, res) =>{

    

    const accomodation = new Accomodation({
    serviceProvider:req.body.serviceProvider,
    title: req.body.title,
    description: req.body.description,
    otherdesc: req.body.otherdesc,
    location: req.body.location,
    image: {
        data: req.file.buffer,
        contentType: req.file.mimetype
    },
    price: req.body.price,
    category: req.body.category,
    phone: req.body.phone,
    startDate: Date(req.body.startDate),
    endDate: Date(req.body.endDate),

    });

   

    await accomodation.save(accomodation)
    
    .then(data=> {
        req.session.message= {
            type: 'Success',
            message: 'Service created successfully'
        }; 
        
        res.redirect('/dashboard/accomodation');

        
    })
    .catch(err =>{
        const error = mongooseValidationErrorHandler(err);
        console.log(error);
        res.status(500).send({
            message:err.message || "Error in creating"
        })
    })
  
})


/**
 * @description Root route
 * @method GET
 */
route.get('/dashboard/accomodation', async (req, res)=>{

    if(req.query.id){
        const id = req.query.id;
        await Accomodation.findById(id).then(data=>
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

 });

//  add new accomodation
route.get('/create-accomodation', (req, res) =>{
    res.render('create-accomodation', {title: 'Create New Accomodation'} )
})



route.get('/update-accomodation/:id', async (req, res)=>{
  
    let id=req.params.id;
    await Accomodation.findById(id, req.body)
    .then(accomodation=>{
        if(!accomodation){
            res.status(404).send({message: 'Service Not Found'})
        }else{
            
            // res.send(accomodation)
            res.render('update-accomodation', {title: 'Create New Accomodation', accomodation:accomodation} )
        }
    })
   })

    // let new_image = "";

    // if(req.file){
    //     new_image =req.file.buffer;
    //     try{
    //         fs.unlinkSync('./uploads/'+req.body.old_image);
    //     }catch(err){
    //         console.log(err);
    //     }
    // }else{
    //     new_image=req.body.old_image;
    // }

  route.post('/update-accomodation/:id',  (req, res)=>{
    if(!req.body){
        return res.status(400).send({message: "There is no data to update"})
    }
    const id=req.params.id;
    // const updatedAccomdation= 
    Accomodation.findByIdAndUpdate(id, req.body, {useFindAndModify: false})
        .then(accomodation => {
            if (!accomodation) {
              res.status(404).send({ message: 'Cannot update the user', id });
    
            } else {
                req.session.message={
                    type: 'Success',
                    message: 'User updates Successfully',
                };
                // res.send(accomodation)
              res.redirect('/dashboard/accomodation'); 
              console.log('Test accom:',accomodation);
            }
          })
          .catch((err) => {
            res.status(500).send({ message: 'Error in updating service information' });
          });
      });
    
  
  
// Traveller user registration API---- For Mobile App------------------------------
 route.post('/traveller-registration', TravellerController.register);

 route.post('/traveller-login', TravellerController.login);

    


 module.exports = route;  
 
 
 
 
 
 
 
 //     title: req.body.title,
 // description: req.body.description,
 // otherdesc: req.body.otherdesc,
 // location: req.body.location,
 // image: {
 //     data: req.file.old_image,
 //     contentType: req.file.mimetype
 // },
 // price: req.body.price,
 // category: req.body.category,
 // phone: req.body.phone,
 // startDate: Date(req.body.startDate),
 // endDate: Date(req.body.endDate),

   // .then(accomodation => {
    //     if (!accomodation) {
    //       res.status(404).send({ message: 'Cannot update the user', id });

    //     } else {
    //         req.session.message={
    //             type: 'Success',
    //             message: 'User updates Successfully',
    //         };
    //         // res.send(accomodation)
    //       res.render('/dashboard/accomodation', {accomodation:accomodation}); 
    //       console.log('Test accom:',accomodation);
    //     }
    //   })
    //   .catch((err) => {
    //     res.status(500).send({ message: 'Error in updating service information' });
    //   });
  


//   Accomodation.findByIdAndUpdate(id, req.body, {useFindAndModify: false})
//     .then(accomodation => {
//         if (!accomodation) {
//           res.status(404).send({ message: 'Cannot update the user', id });

//         } else {
//             req.session.message={
//                 type: 'Success',
//                 message: 'User updates Successfully',
//             };
//             // res.send(accomodation)
//           res.render('/dashboard/accomodation', {accomodation:accomodation}); 
//           console.log('Test accom:',accomodation);
//         }
//       })
//       .catch((err) => {
//         res.status(500).send({ message: 'Error in updating service information' });
//       });
//   });

    // }, (err, res)=>{
    //     if(err){
    //         res.json({message: err.message, type:'danger'})
    //     }else{
    //         req.session.message={
    //             type: 'success',
    //             message: 'Service updated Successgully!'
    //         };
    //         res.redirect('/dashboard/accomodation');
    //     }

    // })
   
//     try {
//         const id = req.params.id;
//         const updatedAccomodation = await Accomodation.findByIdAndUpdate(id, req.body, { new: true });
        
//         if (!updatedAccomodation) {
//             res.status(404).send({ message: `Cannot update the accomodation with id ${id}` });
//             return;
//         }
        
//         req.session.message={
//             type: 'Success',
//             message: 'Accomodation updated successfully',
//         };
            
//         res.render('dashboard/accomodation', { accomodation: updatedAccomodation });
//         console.log('Updated accomodation:', updatedAccomodation);
//     } catch (error) {
//         console.error(error);
//         res.status(500).send({ message: 'Error in updating accomodation information' });
//     }
// });