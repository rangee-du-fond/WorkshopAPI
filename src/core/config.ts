type EnvVar = {
  name: string;
  default?: string;
};

export type Config = {
  serverPort: string;
};

export const expectedEnvVariables: EnvVar[] = [{ name: 'PORT', default: '3000' }];

const getDefaultValue = (entries: EnvVar[], varName: string) => {
  return entries.find(env => env.name === varName).default;
};

export const config = (): Config => {
  return {
    serverPort: process.env.PORT || getDefaultValue(expectedEnvVariables, 'PORT'),
  };
};
