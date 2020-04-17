import { Server } from '@hapi/hapi';
import { getMeetingById } from './meetings.controller';
import { createMeeting } from './meetings.controller';
import { deleteMeeting } from './meetings.controller';
import Joi = require('@hapi/joi');

export const registerMeetingsRoutes = (server: Server) => {
  server.route({
    method: 'GET',
    path: '/meetings/{meetingId}',
    options: {
      tags: ['api'],
      description: 'returns a specific meeting',
      validate: {
        params: Joi.object({
          meetingId: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: (req, h) => {
      return getMeetingById(req.params.meetingId).catch(console.error);
    },
  });

  server.route({
    method: 'POST',
    path: '/meetings',
    options: {
      tags: ['api'],
      description: 'create a meeting',
      validate: {
        payload: Joi.object({
          description: Joi.string().required(),
          date: Joi.date().required(),
          idEmployee: Joi.string().required().uuid({ version: 'uuidv4' }),
          idStudent: Joi.string().required().uuid({ version: 'uuidv4' }),
          idCourse: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: (req, h) => {
      return createMeeting(
        (req.payload as any).description,
        (req.payload as any).date,
        (req.payload as any).idEmployee,
        (req.payload as any).idStudent,
        (req.payload as any).idCourse,
      ).catch(console.error);
    },
  });

  server.route({
    method: 'DELETE',
    path: '/meetings/{meetingId}',
    options: {
      tags: ['api'],
      description: 'delete a specific meeting',
      validate: {
        params: Joi.object({
          meetingId: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: (req, h) => {
      return deleteMeeting(req.params.meetingId).catch(console.error);
    },
  });
};
