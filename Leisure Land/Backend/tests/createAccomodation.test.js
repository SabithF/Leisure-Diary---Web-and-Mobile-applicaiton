const request = require('supertest');
const app = require('../server');
const Accomodation = require('../server');

describe('POST /add-accomodation', () => {
  it('should create a new accomodation', async () => {
    const accomodationData = {
      serviceProvider: 'John Doe',
      title: 'My Accomodation',
      description: 'A lovely place to stay',
      otherdesc: 'Some other details',
      location: 'Somewhere',
      price: 100,
      category: 'Hotel',
      phone: '123-456-7890',
      startDate: '2022-01-01',
      endDate: '2022-01-05',
      image: {
        buffer: Buffer.from('dummy image data'),
        mimetype: 'image/png',
      },
    };

    const response = await request(app)
      .post('/add-accomodation')
      .field(accomodationData)
      .attach('image', accomodationData.image.buffer, { mimetype: accomodationData.image.mimetype });

    expect(response.status).toBe(302); // assuming that the route redirects on success
    expect(response.header.location).toBe('/dashboard/accomodation');

    const savedAccomodation = await Accomodation.findOne({ title: accomodationData.title });
    expect(savedAccomodation).toBeTruthy();
    expect(savedAccomodation.serviceProvider).toBe(accomodationData.serviceProvider);
    expect(savedAccomodation.description).toBe(accomodationData.description);
    expect(savedAccomodation.location).toBe(accomodationData.location);
    expect(savedAccomodation.price).toBe(accomodationData.price);
    expect(savedAccomodation.category).toBe(accomodationData.category);
    expect(savedAccomodation.phone).toBe(accomodationData.phone);
    expect(savedAccomodation.startDate).toEqual(new Date(accomodationData.startDate));
    expect(savedAccomodation.endDate).toEqual(new Date(accomodationData.endDate));
    expect(savedAccomodation.image.contentType).toBe(accomodationData.image.mimetype);
  });

  it('should handle errors when creating a new accomodation', async () => {
    const accomodationData = {
      serviceProvider: 'John Doe',
      title: 'My Accomodation',
      description: 'A lovely place to stay',
      location: 'Somewhere',
      price: 100,
      category: 'Hotel',
      phone: '123-456-7890',
      startDate: '2022-01-01',
      endDate: '2022-01-05',
    
    };

    const response = await request(app)
      .post('/add-accomodation')
      .field(accomodationData);

    expect(response.status).toBe(500);
    expect(response.body.message).toMatch(/Error/);

    const savedAccomodation = await Accomodation.findOne({ title: accomodationData.title });
    expect(savedAccomodation).toBeFalsy();
  });
});