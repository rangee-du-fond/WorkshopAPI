import type { Employee } from './employee';
import type { Meeting } from '../meetings/meeting';
import { db } from '../core/db';

export const getEmployeeById = (employeeId: string): Promise<Employee> => {
  const stmt = `
    SELECT employee.id , employee.name, employee.phone, employee.email, employee.created_at, company.name as company_name
    FROM employee
    INNER JOIN company ON employee.id_company=company.id
    WHERE employee.id = $1;`;
  return db.query(stmt, [employeeId]).then(res => res.rows[0]);
};

export const getMeetingsByEmployeeId = (employeeId: string): Promise<Meeting[]> => {
  const stmt = `
    SELECT *
    FROM meeting
    WHERE meeting.id_employee = $1;`;
  return db.query(stmt, [employeeId]).then(res => res.rows);
};

export const createEmployee = (
  name: string,
  phone: string,
  email: string,
  idCompany: string,
): Promise<string> => {
  const stmt = `INSERT INTO employee(name, phone, email, id_company) VALUES ($1, $2, $3, $4) RETURNING id;`;
  return db.query(stmt, [name, phone, email, idCompany]).then(res => res.rows[0].id);
};
