type EnvVar = {
  name: string;
  default?: string;
};

export const expectedEnvVariables: EnvVar[] = [
  { name: 'PORT', default: '3000' },
  { name: 'PG_HOST' },
  { name: 'PG_PORT', default: '5432' },
  { name: 'PG_DATABASE', default: 'postgres' },
  { name: 'PG_USER', default: 'postgres' },
  { name: 'PG_PASSWORD' },
];

const getDefaultValue = (entries: EnvVar[], varName: string) => {
  return entries.find(env => env.name === varName).default;
};

export const config = () => {
  return {
    serverPort: process.env.PORT || getDefaultValue(expectedEnvVariables, 'PORT'),
    db: {
      host: process.env.PG_HOST || getDefaultValue(expectedEnvVariables, 'PG_HOST'),
      port: process.env.PG_PORT || getDefaultValue(expectedEnvVariables, 'PG_PORT'),
      name: process.env.PG_DATABASE || getDefaultValue(expectedEnvVariables, 'PG_DATABASE'),
      user: process.env.PG_USER || getDefaultValue(expectedEnvVariables, 'PG_USER'),
      password: process.env.PG_PASSWORD || getDefaultValue(expectedEnvVariables, 'PG_PASSWORD'),
    },
  };
};
