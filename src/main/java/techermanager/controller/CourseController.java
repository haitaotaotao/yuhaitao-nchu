package techermanager.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import techermanager.dao.CourseMapper;
import techermanager.dao.CourseUserMapper;
import techermanager.pojo.Course;
import techermanager.pojo.CourseUser;
import techermanager.pojo.Form.CourseForm;
import techermanager.pojo.Form.CourseUserForm;
import techermanager.pojo.Form.UserForm;
import techermanager.pojo.User;
import techermanager.pojo.response.Response;

import javax.servlet.http.HttpSession;
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
    public int addCourse(@RequestBody CourseForm courseForm, HttpSession session){
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
    public int mangerCourse(@RequestBody CourseUserForm courseUserForm, HttpSession session){
            System.out.println("处理分配课程");
            CourseUser courseUser = new CourseUser();
            courseUser.setCourseId(courseUserForm.getCourseId());
            courseUser.setCourseName(courseUserForm.getCourseName());
            courseUser.setUesrId(courseUserForm.getUesrId());
            courseUser.setUserName(courseUserForm.getUserName());
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
     * 查询教师的课程信息
     *
     * @return
     */
    @RequestMapping(value = "/CourseInfo", method = RequestMethod.GET)
    @ResponseBody
    public Response queryUsers(@RequestParam(value = "page") Integer page, @RequestParam("limit") Integer limit,
                               @RequestParam(value = "key[address]" ,required = false) String address,
                               @RequestParam(value = "key[courseName]",required = false) String courseName) {
        Response<CourseUser> response = new Response();
        response.setCode(0);
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, limit);
        List<CourseUser> courseUsers = courseUserMapper.selectByCondition(address,courseName);
        PageInfo<CourseUser> pageInfo = new PageInfo<>(courseUsers);
        response.setCount(pageInfo.getTotal());
        response.setData(pageInfo.getList());
        return response;
    }


    /**
     * 查询教师的课程信息
     *
     * @return
     */
    @RequestMapping(value = "/CourseTeacherQuery", method = RequestMethod.GET)
    @ResponseBody
    public Response CourseTeacherQuery(@RequestParam(value = "page") Integer page, @RequestParam("limit") Integer limit,
                               @RequestParam(value = "key[userName]" ,required = false) String userName,
                               @RequestParam(value = "key[courseName]",required = false) String courseName) {
        System.out.println("啦啦啦啦啦啦啦啦啦啦");
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

}