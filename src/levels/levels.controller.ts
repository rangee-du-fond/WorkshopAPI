import { db } from '../core/db';

export const getAllLevels = () => {
  return db.query('SELECT * FROM level;').then(res => res.rows);
};
