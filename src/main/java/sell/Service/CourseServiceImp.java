package sell.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sell.dao.CourseMapper;
import sell.pojo.Course;

import java.util.List;

@Service
public class CourseServiceImp implements CourseService{

    @Autowired
    private CourseMapper courseMapper;
    public List<Course> findAllCourse() {
        List<Course> list=courseMapper.findAllCourse();
        return list;
    }

    public int deleteCourse(String id) {
        courseMapper.deleteCourse(id);
        return 0;
    }

    public int addCourse(Course course) {
        courseMapper.addCourse(course);
        return 0;
    }

    public int updateCourse(Course course) {
        courseMapper.updateCourse(course);
        return 0;
    }

    public List<Course> findCourse(Course course) {
        List<Course> list=courseMapper.findCourse(course);
        return null;
    }
}
