import type { Request } from './request.d';
import { db } from '../core/db';

export const getAllRequests = (): Promise<Request[]> => {
  return db.query('SELECT * FROM request;').then(res => res.rows);
};

export const getRequestById = (requestId: string): Promise<Request> => {
  const stmt = `SELECT * FROM request WHERE request.id = $1`;
  return db.query(stmt, [requestId]).then(res => res.rows[0]);
};
