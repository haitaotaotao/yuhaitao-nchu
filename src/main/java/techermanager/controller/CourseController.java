package techermanager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import techermanager.dao.CourseMapper;
import techermanager.dao.CourseUserMapper;
import techermanager.pojo.Course;
import techermanager.pojo.CourseUser;
import techermanager.pojo.Form.CourseForm;
import techermanager.pojo.Form.CourseUserForm;
import techermanager.pojo.Form.UserForm;
import techermanager.pojo.User;

import javax.servlet.http.HttpSession;

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


    @RequestMapping(value = "/mangerCourse", method = RequestMethod.POST)
    @ResponseBody
    public int mangerCourse(@RequestBody CourseUserForm courseUserForm, HttpSession session){
            System.out.println("处理分配课程");
            CourseUser courseUser = new CourseUser();
            courseUser.setCourseId(courseUserForm.getCourseId());
            courseUser.setCourseName(courseUserForm.getCourseName());
            courseUser.setUesrId(courseUserForm.getUesrId());
            courseUser.setUserName(courseUserForm.getUserName());
//            courseUser.setCourseTime(courseUserForm.getCourseTime());
            courseUser.setAddress(courseUserForm.getAddress());
            try {
//                System.out.println(courseUser.getCourseId()+courseUser.getCourseName()+courseUser.getUesrId()+courseUser.getUserName()+courseUser.getAddress()+courseUser.getCourseTime());
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
}
