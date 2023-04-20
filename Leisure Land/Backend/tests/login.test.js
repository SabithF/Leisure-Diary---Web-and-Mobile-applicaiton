const request = require('supertest');
const app = require('../server');

describe('POST /api/login', () => {
  test('valid login credentials should return 200 OK', async () => {
    const response = await request(app)
      .post('/api/login')
      .send({
        email: 'testuser@example.com',
        password: 'password123'
      });
    expect(response.statusCode).toBe(200);
    expect(response.body).toHaveProperty('status', 'ok');
  });

  test('invalid login credentials should return 401 Unauthorized', async () => {
    const response = await request(app)
      .post('/api/login')
      .send({
        email: 'testuser@example.com',
        password: 'invalidpassword'
      });
    expect(response.statusCode).toBe(401);
    expect(response.body).toHaveProperty('status', 'error');
  });
});