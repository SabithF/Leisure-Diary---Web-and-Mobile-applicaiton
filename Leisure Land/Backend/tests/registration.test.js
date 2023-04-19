const request = require('supertest');
const bcrypt = require('bcrypt');
const app = require('../server');
const serProvModel = require('../server/model/serviceProvider');
const mongoose = require('mongoose');
const http = require('http');




describe('POST /api/register', () => {
  let server;

  beforeEach(() => {
    // server = http.createServer(app);
    // server = app.listen(3000);

    // mongoose.connect('mongodb+srv://sabithfariq:leisurediary@leisurediarytest.r04yhsx.mongodb.net/test', { useNewUrlParser: true });
  });

  afterEach(async () => {
    await server.close();
    await serProvModel.deleteMany();
  });

  it('should return error with status 400 if username is not provided', async () => {
    const response = await request(server)
      .post('/api/register')
      .send({
        email: 'test@example.com',
        password: 'password123',
      });

    expect(response.status).toBe(400);
    expect(response.body).toHaveProperty('status', 'error');
    expect(response.body).toHaveProperty('error', 'Invalid username');
  });

  it('should return error with status 400 if email is not provided', async () => {
    const response = await request(server)
      .post('/api/register')
      .send({
        username: 'testuser',
        password: 'password123',
      });

    expect(response.status).toBe(400);
    expect(response.body).toHaveProperty('status', 'error');
    expect(response.body).toHaveProperty('error', 'Invalid email');
  });

  it('should return error with status 400 if password is not provided', async () => {
    const response = await request(server)
      .post('/api/register')
      .send({
        username: 'testuser',
        email: 'test@example.com',
      });

    expect(response.status).toBe(400);
    expect(response.body).toHaveProperty('status', 'error');
    expect(response.body).toHaveProperty('error', 'Invalid password');
  });

  it('should return error with status 400 if password is less than 6 characters', async () => {
    const response = await request(server)
      .post('/api/register')
      .send({
        username: 'testuser',
        email: 'test@example.com',
        password: '123',
      });

    expect(response.status).toBe(400);
    expect(response.body).toHaveProperty('status', 'error');
    expect(response.body).toHaveProperty(
      'error',
      'Password should be at least more than 6 Characters'
    );
  });

  it('should create a new service provider if inputs are valid', async () => {
    const response = await request(server)
      .post('/api/register')
      .send({
        username: 'testuser',
        email: 'test@example.com',
        password: 'password123',
      });

    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty('status', 'ok');

    const serviceProvider = await serProvModel.findOne({ username: 'testuser' });
    expect(serviceProvider).toBeTruthy();

    const passwordMatch = await bcrypt.compare(
      'password123',
      serviceProvider.password
    );
    expect(passwordMatch).toBe(true);
  });

  it('should return error with status 400 if username or email already in use', async () => {
    const existingServiceProvider = await serProvModel.create({
      username: 'testuser',
      email: 'test@example.com',
      password: 'password123',
    });

    const response = await request(server)
      .post('/api/register')
      .send({
        username: 'testuser',
        email: 'test@example.com',
        password: 'password456',
      });

    expect(response.status).toBe(400);
    expect(response.body).toHaveProperty('status', 'ok');
    expect(response.body).not.toHaveProperty('error');
    expect(typeof response.body).toBe('object');
    expect(response.headers['content-type']).toMatch(/json/);
});
});