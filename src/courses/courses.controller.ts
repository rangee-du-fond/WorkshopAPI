import { Course } from './courses.d';
import { db } from '../core/db';

export const getAllCourses = (): Promise<Course[]> => {
  const stmt = `
    SELECT id_theme, theme.name, id_level, level.name as level_name
    FROM course, theme, level
    WHERE course.id_theme=theme.id
    AND course.id_level=level.id`;
  return db.query(stmt).then(res => res.rows);
};
