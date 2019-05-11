package techermanager.dao;

import java.util.List;
import techermanager.pojo.CourseUser;

public interface CourseUserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(CourseUser record);

    CourseUser selectByPrimaryKey(Long id);

    List<CourseUser> selectAll();

    int updateByPrimaryKey(CourseUser record);
}