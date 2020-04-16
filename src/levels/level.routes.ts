import { Server } from '@hapi/hapi';
import { getAllLevels } from './level.controller';

export const registerLevelsRoutes = (server: Server) => {
  server.route({
    method: 'GET',
    path: '/levels',
    options: {
      tags: ['api'],
      description: 'returns all levels supported',
    },
    handler: (req, h) => {
      return getAllLevels();
    },
  });
};
