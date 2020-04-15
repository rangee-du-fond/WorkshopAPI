import { EnvVar } from './core.d';

export const getEnvDefaultValue = (entries: EnvVar[], varName: string) => {
  return entries.find(env => env.name === varName).default;
};

export const expectedEnvVariables: EnvVar[] = [{ name: 'PORT', default: '3000' }];
