package sell.Service;

import sell.pojo.Course;
import sell.pojo.Teacher;

import java.util.List;

public interface CourseService {
    List<Course> findAllCourse();
    int deleteCourse(String id);
    int addCourse(Course course);
    int updateCourse(Course course);
    List<Course> findCourse(Course course);
}
