package techermanager.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import techermanager.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    User selectByPrimaryKey(Long id);

    List<User> selectAll();
    List<User> selectByCondition(@Param("faculty") String faculty,@Param("userName") String userName);
    List<User> selectTeacher(String userName);
    int updateByPrimaryKey(User record);
    int updateByPrimaryAccount(User record);
    User  selectByAountNo(@Param("AccountNo") String AccountNo);

}