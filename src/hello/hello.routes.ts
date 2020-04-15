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
      return { message: 'hello world!' };
    },
  });
};
