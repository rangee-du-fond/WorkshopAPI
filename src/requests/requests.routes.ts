import { Server } from '@hapi/hapi';
import { getAllRequests } from './requests.controller';
import { getRequestById } from './requests.controller';
import { createRequest } from './requests.controller';
import { deleteRequest } from './requests.controller';
import Joi = require('@hapi/joi');
import { findCourseById } from '../courses/courses.controller';
import { getUserById } from '../users/users.controller';

export const registerRequestsRoutes = (server: Server) => {
  server.route({
    method: 'GET',
    path: '/requests',
    options: {
      tags: ['api'],
      description: 'returns all requests',
    },
    handler: (req, h) => {
      return getAllRequests().catch(console.error);
    },
  });

  server.route({
    method: 'GET',
    path: '/requests/{requestId}',
    options: {
      tags: ['api'],
      description: 'returns a specific request',
      validate: {
        params: Joi.object({
          requestId: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: async (req, h) => {
      const request = await getRequestById(req.params.requestId).catch(console.error);
      if (!request) return h.response({ statusCode: 404, message: 'Not found' }).code(404);
      return {
        ...request,
        course: await findCourseById(request.id_course),
        employee: await getUserById(request.id_employee),
      };
    },
  });

  server.route({
    method: 'POST',
    path: '/requests',
    options: {
      tags: ['api'],
      description: 'create a request',
      validate: {
        payload: Joi.object({
          description: Joi.string().required(),
          idEmployee: Joi.string().required().uuid({ version: 'uuidv4' }),
          idCourse: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: (req, h) => {
      return createRequest(
        (req.payload as any).description,
        (req.payload as any).idEmployee,
        (req.payload as any).idCourse,
      ).catch(console.error);
    },
  });

  server.route({
    method: 'DELETE',
    path: '/requests/{requestId}',
    options: {
      tags: ['api'],
      description: 'delete a specific request',
      validate: {
        params: Joi.object({
          requestId: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: (req, h) => {
      return deleteRequest(req.params.requestId).catch(console.error);
    },
  });
};
