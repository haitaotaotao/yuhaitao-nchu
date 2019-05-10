package sell.dao;

import sell.pojo.Course;

import java.util.List;

public interface CourseMapper {
    List<Course> findAllCourse();
    int deleteCourse(String id);
    int addCourse(Course course);
    int updateCourse(Course course);
    List<Course> findCourse(Course course);
}
