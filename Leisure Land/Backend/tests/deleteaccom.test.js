const request = require('supertest');
const app = require('../server');
const Accomodation = require('../models/Accomodation');

describe('DELETE /delete-accomodation/:id', () => {
  it('should delete the accomodation with the specified ID and redirect to /dashboard/accomodation', async () => {
    // create a new accomodation
    const newAccomodation = new Accomodation({
      serviceProvider: 'test',
      title: 'test',
      description: 'test',
      otherdesc: 'test',
      location: 'test',
      image: {
        data: 'test',
        contentType: 'test'
      },
      price: 'test',
      category: 'test',
      phone: 'test',
      startDate: 'test',
      endDate: 'test'
    });
    const savedAccomodation = await newAccomodation.save();

    // make a request to delete the accomodation
    const response = await request(app)
      .post(`/delete-accomodation/${savedAccomodation._id}`)
      .send();

    // assert that the response status is a redirect
    expect(response.status).toBe(302);

    // assert that the response redirected to /dashboard/accomodation
    expect(response.header.location).toBe('/dashboard/accomodation');

    // assert that the accomodation has been deleted from the database
    const deletedAccomodation = await Accomodation.findById(savedAccomodation._id);
    expect(deletedAccomodation).toBeNull();
  });
});