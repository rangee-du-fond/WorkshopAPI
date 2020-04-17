import { Server } from '@hapi/hapi';
import { getEmployeeById } from './employees.controller';
import { createEmployee } from './employees.controller';
import { getMeetingsByEmployeeId } from './employees.controller';
import Joi = require('@hapi/joi');

export const registerEmployeesRoutes = (server: Server) => {
  server.route({
    method: 'GET',
    path: '/employees/{employeeId}',
    options: {
      tags: ['api'],
      description: 'returns a specific employee',
      validate: {
        params: Joi.object({
          employeeId: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: (req, h) => {
      return getEmployeeById(req.params.employeeId).catch(console.error);
    },
  });

  server.route({
    method: 'GET',
    path: '/employees/{employeeId}/meetings',
    options: {
      tags: ['api'],
      description: 'returns all meetings for a specific employee',
      validate: {
        params: Joi.object({
          employeeId: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: (req, h) => {
      return getMeetingsByEmployeeId(req.params.employeeId).catch(console.error);
    },
  });

  server.route({
    method: 'POST',
    path: '/employees',
    options: {
      tags: ['api'],
      description: 'create an employee',
      validate: {
        payload: Joi.object({
          name: Joi.string().required(),
          phone: Joi.string().required(),
          email: Joi.string().email().required(),
          idCompany: Joi.string().required().uuid({ version: 'uuidv4' }),
        }),
      },
    },
    handler: (req, h) => {
      return createEmployee(
        (req.payload as any).name,
        (req.payload as any).phone,
        (req.payload as any).email,
        (req.payload as any).idCompany,
      ).catch(console.error);
    },
  });
};
