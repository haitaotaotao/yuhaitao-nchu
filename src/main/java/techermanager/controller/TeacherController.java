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

    /**
     * 查询教师的个人资料
     *
     * @return
     */
    @RequestMapping(value = "/PersonDetail", method = RequestMethod.GET)
    @ResponseBody
    public Response PersonDetail(@RequestParam(value = "page") Integer page, @RequestParam("limit") Integer limit,HttpSession session) {
        User A=(User) session.getAttribute("User");
        String userName=A.getUserName();
        Response<UserVO> response = new Response();
        response.setCode(0);
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, limit);
        List<User> users = userMapper.selectTeacher(userName);
        PageInfo<User> pageInfo = new PageInfo<>(users);
        response.setCount(pageInfo.getTotal());
        //转换时间
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        List<UserVO> voList=new ArrayList<>();
        if (!CollectionUtils.isEmpty(pageInfo.getList())){
            for (User user : pageInfo.getList()) {
                UserVO vo=new UserVO();
                BeanUtils.copyProperties(user,vo);
                vo.setCreatTime(sdf.format(user.getCreatTime()));
                vo.setModifyTime(sdf.format(user.getModifyTime()));
                voList.add(vo);
            }
        }

        response.setData(voList);
        return response;
    }

//    /**
//     * 删除航班息
//     */
//    @RequestMapping(value = "/delFight ", method = RequestMethod.GET)
//    @ResponseBody
//    public int delFight(@RequestParam("id") Long id, HttpSession session, Model model) {
//        User user = (User) session.getAttribute("User");
//        if (user == null) {
//            return -2;
//        }
//        int result = fightInfoMapper.deleteByPrimaryKey(id);
//
//        if (result > 0) {
//            return 1;
//        } else {
//            return -1;
//        }
//
//    }
//
}
