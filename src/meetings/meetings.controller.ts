import type { Meeting } from './meeting';
import { db } from '../core/db';

export const getMeetingById = (meetingId: string): Promise<Meeting> => {
  const stmt = `SELECT * FROM meeting WHERE meeting.id = $1;`;
  return db.query(stmt, [meetingId]).then(res => res.rows[0]);
};

export const createMeeting = (
  description: string,
  date: string,
  idEmployee: string,
  idStudent: string,
  idCourse: string,
): Promise<string> => {
  const stmt = `INSERT INTO meeting(description, date, id_employee, id_student, id_course) VALUES ($1, $2, $3, $4, $5) RETURNING id;`;
  return db
    .query(stmt, [description, date, idEmployee, idStudent, idCourse])
    .then(res => res.rows[0].id);
};

export const deleteMeeting = (idMeeting: string): Promise<any> => {
  return db.query(`DELETE FROM meeting WHERE meeting.id = $1;`, [idMeeting]);
};
