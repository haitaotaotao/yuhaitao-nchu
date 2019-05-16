package techermanager.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import techermanager.pojo.Course;
import techermanager.pojo.CourseUser;

public interface CourseMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Course record);

    Course selectByPrimaryKey(Long id);

    List<Course> selectAll();
    List<Course> selectByCondition(@Param("courseName") String courseName);
    int updateByPrimaryKey(Course record);
}