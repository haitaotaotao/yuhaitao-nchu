package techermanager.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import techermanager.pojo.CourseUser;
import techermanager.pojo.Item;

public interface ItemMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Item record);

    Item selectByPrimaryKey(Long id);

    List<Item> selectAll();

    int updateByPrimaryKey(Item record);
    List<Item> selectByCondition(@Param("userName") String userName, @Param("itemName") String itemName);
    List<Item> selectCondition(String userName);

    public List<Map<String, Object>> queryForList();

}