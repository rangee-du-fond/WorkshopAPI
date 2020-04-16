import type { Level } from './level.d';
import { db } from '../core/db';

export const getAllLevels = (): Promise<Level[]> => {
  return db.query('SELECT * FROM level;').then(res => res.rows);
};
