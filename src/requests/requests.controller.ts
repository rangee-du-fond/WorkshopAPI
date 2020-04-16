import type { Request } from './request.d';
import { db } from '../core/db';

export const getAllRequests = (): Promise<Request[]> => {
  return db.query('SELECT * FROM request;').then(res => res.rows);
};

export const getRequestById = (requestId: string): Promise<Request> => {
  const stmt = `SELECT * FROM request WHERE request.id = $1`;
  return db.query(stmt, [requestId]).then(res => res.rows[0]);
};

export const createRequest = (
  description: string,
  idEmployee: string,
  idCourse: string,
): Promise<string> => {
  const stmt = `INSERT INTO request(description, id_employee, id_course) VALUES ($1, $2, $3) RETURNING id;`;
  return db.query(stmt, [description, idEmployee, idCourse]).then(res => res.rows[0].id);
};

export const deleteRequest = (idRequest: string): Promise<any> => {
  return db.query(`DELETE FROM request WHERE request.id = $1;`, [idRequest]);
};
