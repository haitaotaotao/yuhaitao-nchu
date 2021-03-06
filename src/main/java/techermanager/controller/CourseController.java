package techermanager.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import techermanager.dao.CourseMapper;
import techermanager.dao.CourseUserMapper;
import techermanager.pojo.Course;
import techermanager.pojo.CourseUser;
import techermanager.pojo.Form.CourseForm;
import techermanager.pojo.Form.CourseUserForm;
import techermanager.pojo.User;
import techermanager.pojo.response.Response;
import techermanager.pojo.vo.CourseVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private CourseUserMapper courseUserMapper;

    /**
     * 处理课程添加请求
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/addCourse", method = RequestMethod.POST)
    @ResponseBody
    public int addCourse(@RequestBody CourseForm courseForm, HttpSession session) {
        System.out.println("处理添加课程");
        Course course = new Course();
        course.setCourseName(courseForm.getCourseName());
        course.setCourseCode(courseForm.getCourseCode());
        try {
            int num = courseMapper.insert(course);
            if (num > 0) {
                return 1;
            } else {
                return -1;
            }
        } catch (Exception ex) {
            return -1;
        }
    }

    /**
     * 处理课程分配
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/mangerCourse", method = RequestMethod.POST)
    @ResponseBody
    public int mangerCourse(@RequestBody CourseUserForm courseUserForm, HttpSession session) {
        System.out.println("处理分配课程");
        CourseUser courseUser = new CourseUser();
        String[] coures=courseUserForm.getCourse().split("\\|");
        String[] users=courseUserForm.getUser().split("\\|");
        courseUser.setCourseId(Long.valueOf(coures[0]));
        courseUser.setCourseName(coures[1]);
        courseUser.setUesrId(Long.valueOf(users[0]));
        courseUser.setUserName(users[1]);
        courseUser.setCourseTime(courseUserForm.getCourseTime());
        courseUser.setAddress(courseUserForm.getAddress());
        try {
            int num = courseUserMapper.insert(courseUser);
            if (num > 0) {
                return 1;
            } else {
                return -1;
            }
        } catch (Exception ex) {
            return -1;
        }
    }




    /**
     * 查询课程信息
     *
     * @return
     */
    @RequestMapping(value = "/CourseTeacherQuery", method = RequestMethod.GET)
    @ResponseBody
    public Response CourseTeacherQuery(@RequestParam(value = "page") Integer page, @RequestParam("limit") Integer limit,
                                       @RequestParam(value = "key[userName]", required = false) String userName,
                                       @RequestParam(value = "key[courseName]", required = false) String courseName) {
        Response<CourseUser> response = new Response();
        response.setCode(0);
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, limit);
        List<CourseUser> courseUsers = courseUserMapper.selectByCondition(userName, courseName);
        PageInfo<CourseUser> pageInfo = new PageInfo<>(courseUsers);
        response.setCount(pageInfo.getTotal());
        response.setData(pageInfo.getList());
        return response;
    }





    /**
     * 查询课程
     *
     * @return
     */
    @RequestMapping(value = "/CourseQuery", method = RequestMethod.GET)
    @ResponseBody
    public Response CourseQuery(@RequestParam(value = "page") Integer page, @RequestParam("limit") Integer limit,
                                @RequestParam(value = "key[courseName]", required = false) String courseName) {
        Response<CourseVO> response = new Response();
        response.setCode(0);
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, limit);
        List<Course> course = courseMapper.selectByCondition(courseName);
        PageInfo<Course> pageInfo = new PageInfo<>(course);
        response.setCount(pageInfo.getTotal());

        //转换时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        List<CourseVO> voList = new ArrayList<>();
        if (!CollectionUtils.isEmpty(pageInfo.getList())) {
            for (Course course1 : pageInfo.getList()) {
                CourseVO vo = new CourseVO();
                BeanUtils.copyProperties(course1, vo);
                vo.setCourseCreatTime(sdf.format(course1.getCourseCreatTime()));
                voList.add(vo);
            }
        }
        response.setData(voList);
        return response;
    }



    /**
     * 处理删除课程信息
     */
    @RequestMapping(value = "/Delete", method = RequestMethod.GET)
    public String Delete(@RequestParam(value = "id") Long id, HttpSession session, Model model) {

        User user = (User) session.getAttribute("User");
        if (user != null) {
            courseUserMapper.deleteByPrimaryKey(id);
        } else {
            model.addAttribute("msg", "请先登录！");
            return "teacher/login";
        }
        return "redirect:/CourseTeacherQuery";
    }

    /**
     * 处理删除课程
     */
    @RequestMapping(value = "/DeleteCourse", method = RequestMethod.GET)
    public String DeleteCourse(@RequestParam(value = "id") Long id, HttpSession session, Model model) {

        User user = (User) session.getAttribute("User");
        if (user != null) {
            courseMapper.deleteByPrimaryKey(id);
        } else {
            model.addAttribute("msg", "请先登录！");
            return "teacher/login";
        }
        return "redirect:/CourseQuery";
    }
    /**
     * 修改课程信息
     */
    @RequestMapping(value = "/EditTC", method = RequestMethod.POST)
    @ResponseBody
    public int EditTC(@RequestBody CourseUserForm courseUserForm, HttpSession session) {
        CourseUser courseUser = new CourseUser();
        String[] coures = courseUserForm.getCourse().split("\\|");
        String[] users = courseUserForm.getUser().split("\\|");
        courseUser.setCourseId(Long.valueOf(coures[0]));
        courseUser.setCourseName(coures[1]);
        courseUser.setUesrId(Long.valueOf(users[0]));
        courseUser.setUserName(users[1]);
        courseUser.setCourseTime(courseUserForm.getCourseTime());
        courseUser.setId(courseUserForm.getId());
//        System.out.println(courseUser.getId()+"***************");
        courseUser.setAddress(courseUserForm.getAddress());
        try {
            int num = courseUserMapper.updateByCourseName(courseUser);
//            System.out.println(num);
            if (num > 0) {
                return 1;
            } else {
                return -1;
            }
        } catch (Exception ex) {
            return -1;
        }
    }


    /**
     * 修改课程
     */
    @RequestMapping(value = "/EditCourse", method = RequestMethod.POST)
    @ResponseBody
    public int EditCourse(@RequestBody CourseForm courseForm, HttpSession session) {
        Course course = new Course();
        course.setCourseName(courseForm.getCourseName());
        course.setCourseCode(courseForm.getCourseCode());
        course.setId(courseForm.getId());
        try {
            int num = courseMapper.updateByPrimaryKey(course);
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
