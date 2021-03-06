import { Course } from './courses.d';
import { db } from '../core/db';

export const getAllCourses = (): Promise<Course[]> => {
  const stmt = `
    SELECT course.id, course.id_theme, theme.name as theme_name, course.id_level, level.name as level_name
    FROM course, theme, level
    WHERE course.id_theme=theme.id
    AND course.id_level=level.id;`;
  return db.query(stmt).then(res => res.rows);
};

export const findCourseById = (id: string): Promise<Course> => {
  const stmt = `
    SELECT course.id, course.id_theme, theme.name as theme_name, course.id_level, level.name as level_name
    FROM course, theme, level
    WHERE course.id_theme=theme.id
    AND course.id_level=level.id
    AND course.id = $1;`;
  return db.query(stmt, [id]).then(res => res.rows[0]);
};
