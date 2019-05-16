package techermanager.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import techermanager.pojo.CourseUser;
import techermanager.pojo.User;

public interface CourseUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CourseUser record);

    CourseUser selectByPrimaryKey(Long id);

    List<CourseUser> selectAll();
    List<CourseUser> selectByCondition(@Param("userName") String userName, @Param("courseName") String courseName);
    List<CourseUser> selectTeacherCourse(String userName);
    int updateByPrimaryKey(CourseUser record);
}