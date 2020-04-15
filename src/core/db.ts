import { createConfig } from './config';

import { expectedEnvVariables } from './expected-env';
import { Pool } from 'pg';

const config = createConfig(expectedEnvVariables);

const pool = new Pool({
  host: config.db.host,
  port: parseInt(config.db.port, 0),
  database: config.db.name,
  user: config.db.user,
  password: config.db.password,
  query_timeout: 5000,
  connectionTimeoutMillis: 7000,
});

export const db = {
  query: (stmt: string, params?: (number | string)[]) => {
    return pool.query(stmt, params);
  },
};
