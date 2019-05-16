package techermanager.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import techermanager.dao.ItemMapper;
import techermanager.pojo.Form.ItemForm;
import techermanager.pojo.Form.UserForm;
import techermanager.pojo.Item;
import techermanager.pojo.User;
import techermanager.pojo.response.Response;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    private ItemMapper itemMapper;
    /**
     * 项目申请
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/ItemApply", method = RequestMethod.POST)
    @ResponseBody
    public int doSign(@RequestBody ItemForm itemForm, HttpSession session) {
        System.out.println("项目申请控制层");
        Item item=new Item();
        item.setId(itemForm.getUserId());
        item.setUserName(itemForm.getUserName());
        item.setItemName(itemForm.getItemName());
        item.setRemark(itemForm.getRemark());
        item.setDeadLine(itemForm.getDeadLine());
        item.setStatus((long)0);
        try {
            int num = itemMapper.insert(item);
            if (num > 0) {
                return 1;
            } else {
                return -1;
            }
        } catch (Exception ex) {
            return -1;
        }

    }

}