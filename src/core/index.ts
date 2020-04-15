import { initServer } from './server';
import { checkMissingEnvVariables } from './env-check';
import { config, expectedEnvVariables } from './config';

process.on('unhandledRejection', err => {
  console.error(err);
  process.exit(1);
});

checkMissingEnvVariables(expectedEnvVariables);

initServer(config()).then(async server => {
  await server.start();
  console.log('Server running on %s', server.info.uri);
});
