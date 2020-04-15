import { Server } from '@hapi/hapi';

export const registerHelloRoutes = (server: Server) => {
  server.route({
    method: 'GET',
    path: '/hello',
    options: {
      tags: ['api'],
      description: 'route that returns hello world',
    },
    handler: (req, h) => {
      // cast to any to avoid typescript type error
      return { message: 'hello world!' };
    },
  });
};
