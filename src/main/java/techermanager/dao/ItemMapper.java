package techermanager.dao;

import java.util.List;
import techermanager.pojo.Item;

public interface ItemMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Item record);

    Item selectByPrimaryKey(Long id);

    List<Item> selectAll();

    int updateByPrimaryKey(Item record);
}