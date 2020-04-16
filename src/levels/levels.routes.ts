import { Server } from '@hapi/hapi';
import { getAllLevels } from './levels.controller';
import { getThemesByLevel } from '../themes/themes.controller';
import Joi = require('@hapi/joi');

export const registerLevelsRoutes = (server: Server) => {
  server.route({
    method: 'GET',
    path: '/levels',
    options: {
      tags: ['api'],
      description: 'returns all levels supported',
    },
    handler: (req, h) => {
      return getAllLevels().catch(console.error);
    },
  });

  server.route({
    method: 'GET',
    path: '/levels/{levelId}/themes',
    options: {
      tags: ['api'],
      description: 'returns all themes corresponding to the given levels',
      validate: {
        params: Joi.object({
          levelId: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: (req, h) => {
      return getThemesByLevel(req.params.levelId).catch(console.error);
    },
  });
};
