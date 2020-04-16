import { config } from './config';
import { Pool } from 'pg';

const conf = config();

const pool = new Pool({
  host: conf.db.host,
  port: parseInt(conf.db.port, 0),
  database: conf.db.name,
  user: conf.db.user,
  password: conf.db.password,
  query_timeout: 5000,
  connectionTimeoutMillis: 7000,
});

export const db = {
  query: (stmt: string, params?: (number | string)[]) => {
    return pool.query(stmt, params);
  },
};
