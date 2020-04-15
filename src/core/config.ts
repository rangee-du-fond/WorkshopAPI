import { EnvVar, Config } from './core.d';
import { getEnvDefaultValue } from './expected-env';

export const createConfig = (expectedEnvVariables: EnvVar[]): Config => {
  return {
    serverPort: process.env.PORT || getEnvDefaultValue(expectedEnvVariables, 'PORT'),
  };
};
