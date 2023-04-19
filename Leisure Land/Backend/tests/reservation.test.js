const request = require('supertest');
const app = require('../app');
const Reservations = require('../models/Reservations');

describe('POST /api/Reservations', () => {
  it('should create a new reservation and redirect to /dashboard/accomodation', async () => {
    const newReservation = {
      name: 'John Doe',
      email: 'johndoe@example.com',
      accomodation: 'Luxury Villa',
      checkInDate: '2023-05-01',
      checkOutDate: '2023-05-07',
      guests: 4,
      message: 'I would like to request a room with a view.'
    };

    const response = await request(app)
      .post('/api/Reservations')
      .send(newReservation);

    expect(response.status).toBe(302); // Check if the response is a redirect
    expect(response.header.location).toBe('/dashboard/accomodation'); // Check if the redirect location is correct

    const reservation = await Reservations.findOne({ email: newReservation.email });
    expect(reservation).toMatchObject(newReservation); // Check if the created reservation matches the request body
  });
});

describe('GET /reservation-accomodation', () => {
  it('should render the reservationsPage view and return all reservations', async () => {
    const response = await request(app).get('/reservation-accomodation');
    expect(response.status).toBe(200); // Check if the response is OK

    const reservations = await Reservations.find();
    expect(reservations.length).toBeGreaterThan(0); // Check if there is at least one reservation
    expect(response.text).toContain(reservations[0].name); // Check if the response body contains the name of the first reservation
  });
});