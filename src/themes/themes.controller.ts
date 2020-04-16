import { db } from '../core/db';
import type { Theme } from './theme';

export const getThemesByLevel = (levelId: string): Promise<Theme[]> => {
  const stmt = `
    SELECT theme.id, theme.name FROM course, theme
    WHERE theme.id=course.id_theme
    AND id_level = $1`;

  return db.query(stmt, [levelId]).then(res => res.rows);
};
