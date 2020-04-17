import * as Inert from '@hapi/inert';
import * as Vision from '@hapi/vision';
import * as HapiSwagger from 'hapi-swagger';
import * as Pack from '../../package.json';
import { Server } from '@hapi/hapi';
import { registerRequestsRoutes } from '../requests/requests.routes';
import { registerMeetingsRoutes } from '../meetings/meetings.routes';
import { registerLevelsRoutes } from '../levels/levels.routes';
import { registerCoursesRoutes } from '../courses/courses.routes';
import { registerEmployeesRoutes } from '../employees/employees.routes';

export const initServer = async (config): Promise<Server> => {
  const server: Server = new Server({
    port: config.serverPort,
    routes: {
      cors: true,
    },
  });

  const swaggerOptions: HapiSwagger.RegisterOptions = {
    info: {
      title: 'Test API Documentation',
      version: Pack.version,
    },
  };

  const plugins = [
    { plugin: Inert },
    { plugin: Vision },
    { plugin: HapiSwagger, options: swaggerOptions },
  ];

  await server.register(plugins);

  registerRequestsRoutes(server);
  registerMeetingsRoutes(server);
  registerLevelsRoutes(server);
  registerCoursesRoutes(server);
  registerEmployeesRoutes(server);

  return server;
};
