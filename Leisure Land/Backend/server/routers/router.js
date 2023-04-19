const express = require('express');
const route = express.Router();
const services = require('../services/render');
const AuthController = require('../controller/authController');
const Accomodation = require('../model/accomodation');
const Reservations = require('../model/reservation');
const Transpotation = require('../model/transport');
const LeisureActivity = require('../model/leisure');
const FoodModel = require('../model/food');
const multer = require('multer');
const mongooseValidationErrorHandler = require('mongoose-validation-error-message-handler');
const accomodation = require('../model/accomodation');
const { off } = require('../model/serviceProvider');
const moment = require('moment/moment');
const fs = require('fs');
const TravellerController = require('../controller/travellerController');
const leisure = require('../model/leisure');
const food = require('../model/food');


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
            // console.log('Accomodation body',accomodation);
            
        })
        .catch(err=>{
            res.status(500).send({message:err.message || "Error on getting all the data"});
        })
    }

 });
route.get('/dashboard/transpotation', async (req, res)=>{

    if(req.query.id){
        const id = req.query.id;
        await Transpotation.findById(id).then(data=>
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
        Transpotation.find().then(transpotaion=>{
       
            res.render('transpotaion', {title: 'Transpotation- Leisure Diary', transpotaion: transpotaion});
            // console.log('Accomodation body',accomodation);
            
        })
        .catch(err=>{
            res.status(500).send({message:err.message || "Error on getting all the data"});
        })
    }

 });
route.get('/dashboard/leisureactivity', async (req, res)=>{

    if(req.query.id){
        const id = req.query.id;
        await LeisureActivity.findById(id).then(data=>
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
        LeisureActivity.find().then(leisure=>{
       
            res.render('leisureactivity', {title: 'Leisure Activities- Leisure Diary', leisure: leisure});
            // console.log('Accomodation body',accomodation);
            
        })
        .catch(err=>{
            res.status(500).send({message:err.message || "Error on getting all the data"});
        })
    }

 });
route.get('/dashboard/food', async (req, res)=>{

    if(req.query.id){
        const id = req.query.id;
        await FoodModel.findById(id).then(data=>
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
        FoodModel.find().then(food=>{
       
            res.render('food', {title: 'Accomodations- Food', food: food});
            // console.log('Accomodation body',accomodation);
            
        })
        .catch(err=>{
            res.status(500).send({message:err.message || "Error on getting all the data"});
        })
    }

 });





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

// Creating transpotation services
route.post('/add-transpotaion', upload.single('image'), async (req, res) =>{
    const transpotaion = new Transpotation({
    title: req.body.title,
    description: req.body.description,
    otherdesc:req.body.otherdesc,
    image: {
        data: req.file.buffer,
        contentType: req.file.mimetype
    },
    price: req.body.price,
    vehicletype: req.body.vehicletype,
    phone: req.body.phone,
    
    });
    await transpotaion.save(transpotaion)
    
    .then(data=> {
        req.session.message= {
            type: 'Success',
            message: 'Service created successfully'
        }; 
        
        res.redirect('/dashboard/transpotation');

        
    })
    .catch(err =>{
        const error = mongooseValidationErrorHandler(err);
        console.log(error);
        res.status(500).send({
            message:err.message || "Error in creating"
        })
    })
  
})

// Creating Leisure activity services
route.post('/add-leisureactivity', upload.single('image'), async (req, res) =>{
    const leisure = new LeisureActivity({
    title: req.body.title,
    description: req.body.description,
    image: {
        data: req.file.buffer,
        contentType: req.file.mimetype
    },
    location: req.body.location,
    price: req.body.price,
    phone: req.body.phone,
   
    
    });
    await leisure.save(leisure)
    
    .then(data=> {
        req.session.message= {
            type: 'Success',
            message: 'Service created successfully'
        }; 
        
        res.redirect('/dashboard/leisureactivity');

        
    })
    .catch(err =>{
        const error = mongooseValidationErrorHandler(err);
        console.log(error);
        res.status(500).send({
            message:err.message || "Error in creating"
        })
    })
  
})

// Creating Leisure activity services
route.post('/add-food', upload.single('image'), async (req, res) =>{
    const food = new FoodModel({
    title: req.body.title,
    description: req.body.description,
    image: {
        data: req.file.buffer,
        contentType: req.file.mimetype
    },
    price: req.body.price,
    phone: req.body.phone,
    location: req.body.location,
    
    });
    await food.save(food)
    
    .then(data=> {
        req.session.message= {
            type: 'Success',
            message: 'Service created successfully'
        }; 
        
        res.redirect('/dashboard/food');

        
    })
    .catch(err =>{
        const error = mongooseValidationErrorHandler(err);
        console.log(error);
        res.status(500).send({
            message:err.message || "Error in creating"
        })
    })
  
})


//   Reservations----------------------------------------

route.post('/api/Reservations', async (req,res) =>{
    const reservation = new Reservations(req.body
    );
  await reservation.save(reservation)
  .then(data=>{
    res.redirect('/dashboard/accomodation')
  })
  console.log('reservation body', reservation);
})

route.get('/reservation-accomodation', (req, res)=>{
    Reservations.find().then(reservation=>{
       
        res.render('reservationsPage', {title: 'Reservations- Leisure Diary', reservation: reservation});
        // console.log('Accomodation body',accomodation);
        
    })

})

route.post('/delete-reservation/:id', (req, res)=>{
    const id = req.params.id;
    Reservations.findByIdAndDelete(id).then(reservation=>{
        res.redirect('/reservation-accomodation');
    })

})




//  add new accomodation
route.get('/create-accomodation', (req, res) =>{
    res.render('create-accomodation', {title: 'Create New Accomodation'} )
})
route.get('/create-transport', (req, res) =>{
    res.render('create-transport', {title: 'Create New Transportation'} )
})
route.get('/create-leisureactivity', (req, res) =>{
    res.render('create-leisureactivity', {title: 'Create New Leisure Activity'} )
})
route.get('/create-food', (req, res) =>{
    res.render('create-food', {title: 'Create New Food'} )
})



route.post('/update-accomodation/:id', async (req, res)=>{
  
    let id=req.params.id;
    await Accomodation.findByIdAndUpdate(id, req.body)
    .then(accomodation=>{
        if(!accomodation){
            res.status(404).send({message: 'Service Not Found'})
        }else{
            
            // res.send(accomodation)
            res.render('update-accomodation', {title: 'Create New Accomodation', accomodation:accomodation} )
        }
    })
   })


//Delete Routes
route.post('/delete-accomodation/:id', (req, res)=>{
    const id = req.params.id;
    Accomodation.findByIdAndDelete(id).then(accomodation=>{
        res.redirect('/dashboard/accomodation');
    })

})   
route.post('/delete-transpotaion/:id', (req, res)=>{
    const id = req.params.id;
    Transpotation.findByIdAndDelete(id).then(transpotaion=>{
        res.redirect('/dashboard/transpotation');
    })

})   
route.post('/delete-food/:id', (req, res)=>{
    const id = req.params.id;
    FoodModel.findByIdAndDelete(id).then(food=>{
        res.redirect('/dashboard/food');
    })

})   
route.post('/delete-leisure/:id', (req, res)=>{
    const id = req.params.id;
    LeisureActivity.findByIdAndDelete(id).then(leisure=>{
        res.redirect('/dashboard/leisureactivity');
    })

})   


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

//  Accomodation API
 route.get('/api/getAccomodations', (req, res)=>{
    Accomodation.find().then(accomodation=>{
       
        res.send({accomodations:accomodation});
        
        
    })
})
    



    





    


 module.exports = route;  
 
 










































 // route.get('/delete-accomodation/:id',  (req, res, next)=>{
   
//     Accomodation.findByIdAndDelete({_id:req.params.id}, (err, docs)=>{
//         console.log('IDDDDDDD',_id);
//         if(err){
//             console.log("Something went wrong in delete");
//             next(err)
//         }else{
//             console.log('Deleted');
//             req.session.message={
//                 type: 'info',
//                 message: 'User deleted successfully!'
//             }
//             res.redirect('/dashboard/accomodation');
//         }
//     })
//     // .then(req.session.message={
//     //     type: 'info',
//     //     message: 'User deleted successfully!'
//     // });
//     // res.redirect('/dashboard/accomodation');
// })
 
 
 
 
 
 
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