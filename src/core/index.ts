import { initServer } from './server';
import { checkMissingEnvVariables } from './env-check';
import { createConfig } from './config';
import { expectedEnvVariables } from './expected-env';

process.on('unhandledRejection', err => {
  console.error(err);
  process.exit(1);
});

checkMissingEnvVariables(expectedEnvVariables);

initServer(createConfig(expectedEnvVariables)).then(async server => {
  await server.start();
  console.log('Server running on %s', server.info.uri);
});
