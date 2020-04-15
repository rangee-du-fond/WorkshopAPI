import { initServer } from '../core/server';
import { createConfig } from '../core/config';
import { expectedEnvVariables } from '../core/expected-env';
import { Server } from '@hapi/hapi';

describe('GET /hello', () => {
  let server: Server;

  beforeEach(async () => {
    server = await initServer(createConfig(expectedEnvVariables));
  });

  afterEach(async () => {
    await server.stop();
  });

  it('returns hello world', async () => {
    const res = await server.inject({ method: 'GET', url: '/hello' });
    expect(res.statusCode).toEqual(200);
    const body = JSON.parse(res.payload);
    expect(body.message).toEqual('hello world!');
  });
});
