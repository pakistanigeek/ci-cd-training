const request = require('supertest');
const app = require('./server');

describe('GET /', () => {
  it('responds with JSON message', async () => {
    const response = await request(app).get('/');
    expect(response.statusCode).toBe(200);
    expect(response.body.message).toBe('CI/CD Pipeline Active');
  });
});
