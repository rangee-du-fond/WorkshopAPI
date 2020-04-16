import { Server } from '@hapi/hapi';
import { getAllCourses } from './courses.controller';

export const registerCoursesRoutes = (server: Server) => {
  server.route({
    method: 'GET',
    path: '/courses',
    options: {
      tags: ['api'],
      description: 'returns all courses sorted by levels',
    },
    handler: () => {
      return getAllCourses().catch(console.error);
    },
  });
};
