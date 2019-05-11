package techermanager.dao;

import java.util.List;
import techermanager.pojo.Course;

public interface CourseMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Course record);

    Course selectByPrimaryKey(Long id);

    List<Course> selectAll();

    int updateByPrimaryKey(Course record);
}