import type { User } from './user';
import type { Meeting } from '../meetings/meeting';
import { db } from '../core/db';

export const getUserById = (userId: string): Promise<User> => {
  const stmt = `
    SELECT id, name, phone, email, description, id_role, created_at
    FROM scio_user
    WHERE id = $1;`;
  return db.query(stmt, [userId]).then(res => res.rows[0]);
};

export const getMeetingsByUserId = (userId: string): Promise<Meeting[]> => {
  const stmt = `
    SELECT *
    FROM meeting
    WHERE id_employee = $1
    OR id_student = $1;`;
  return db.query(stmt, [userId]).then(res => res.rows);
};

export const findUserByCredentials = (
  email: string,
  password: string,
): Promise<User | undefined> => {
  const stmt = `
    SELECT id, name, phone, email, description, id_role, created_at
    FROM scio_user
    WHERE email = $1 AND password = $2;`;
  return db.query(stmt, [email, password]).then(res => res.rows[0]);
};

export const createUser = (
  name: string,
  phone: string,
  email: string,
  password: string,
  description: string,
  roleId: number,
): Promise<string> => {
  const stmt = `
    INSERT INTO scio_user(name, phone, email, password, description, id_role)
    VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;`;
  return db
    .query(stmt, [name, phone, email, password, description, roleId])
    .then(res => res.rows[0]);
};
