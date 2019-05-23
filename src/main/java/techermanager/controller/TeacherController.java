package techermanager.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import techermanager.dao.CourseUserMapper;
import techermanager.dao.UserMapper;
import techermanager.pojo.CourseUser;
import techermanager.pojo.User;
import techermanager.pojo.response.Response;
import techermanager.pojo.vo.UserVO;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private CourseUserMapper courseUserMapper;
    @Autowired
    private UserMapper userMapper;
    /**
     * 查询教师的课程信息
     *
     * @return
     */
    @RequestMapping(value = "/CourseInfo", method = RequestMethod.GET)
    @ResponseBody
    public Response queryUsers(@RequestParam(value = "page") Integer page, @RequestParam("limit") Integer limit,HttpSession session) {
        User user=(User) session.getAttribute("User");
        String userName=user.getUserName();
        System.out.println(userName);
        Response<CourseUser> response = new Response();
        response.setCode(0);
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, limit);
        List<CourseUser> courseUsers = courseUserMapper.selectTeacherCourse(userName);
        PageInfo<CourseUser> pageInfo = new PageInfo<>(courseUsers);
        response.setCount(pageInfo.getTotal());
        response.setData(pageInfo.getList());
        return response;
    }


}
