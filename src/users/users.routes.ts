import { Server } from '@hapi/hapi';
import { getUserById, findUserByCredentials } from './users.controller';
import { createUser } from './users.controller';
import { getMeetingsByUserId } from './users.controller';
import Joi = require('@hapi/joi');

export const registerUsersRoutes = (server: Server) => {
  server.route({
    method: 'GET',
    path: '/users/{userId}',
    options: {
      tags: ['api'],
      description: 'returns a specific user',
      validate: {
        params: Joi.object({
          userId: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: (req, h) => {
      return getUserById(req.params.userId).catch(console.error);
    },
  });

  server.route({
    method: 'GET',
    path: '/users/{userId}/meetings',
    options: {
      tags: ['api'],
      description: 'returns all meetings for a specific user',
      validate: {
        params: Joi.object({
          userId: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: (req, h) => {
      return getMeetingsByUserId(req.params.userId).catch(console.error);
    },
  });

  server.route({
    method: 'POST',
    path: '/users',
    options: {
      tags: ['api'],
      description: 'create an user',
      validate: {
        payload: Joi.object({
          name: Joi.string().required(),
          phone: Joi.string().required(),
          email: Joi.string().email().required(),
          password: Joi.string().required(),
          description: Joi.string().required(),
          id_role: Joi.number().integer().min(0).max(1),
        }),
      },
    },
    handler: (req, h) => {
      return createUser(
        (req.payload as any).name,
        (req.payload as any).phone,
        (req.payload as any).email,
        (req.payload as any).password,
        (req.payload as any).description,
        (req.payload as any).id_role,
      ).catch(console.error);
    },
  });

  server.route({
    method: 'POST',
    path: '/users/connect',
    options: {
      tags: ['api'],
      description: 'returns 400 status code if wrong (email, password), 200 otherwise',
      validate: {
        payload: Joi.object({
          email: Joi.string().email().required(),
          password: Joi.string().required(),
        }),
      },
    },
    handler: (req, h) => {
      return findUserByCredentials((req.payload as any).email, (req.payload as any).password)
        .then(user =>
          !user ? h.response({ statusCode: 400, message: 'Not Authenticated' }).code(400) : user,
        )
        .catch(console.error);
    },
  });
};
