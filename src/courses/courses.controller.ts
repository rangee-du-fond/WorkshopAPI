import { db } from '../core/db';

export const getThemesByLevel = (levelId: string) => {
  const stmt = `
    SELECT id_theme, theme.name as theme_name FROM course, theme
    WHERE theme.id=course.id_theme
    AND id_level = $1`;

  return db.query(stmt, [levelId]).then(res => res.rows);
};
