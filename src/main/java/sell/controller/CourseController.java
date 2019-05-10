package sell.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import sell.Service.CourseService;
import sell.pojo.Course;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class CourseController {
    @Autowired
    private CourseService courseService;
    @RequestMapping(value="/course_find_all",method = RequestMethod.GET)
    public String course_find_all(Model model){
        System.out.printf("进入***");
        List<Course> courselist=courseService.findAllCourse();
        model.addAttribute("courselist",courselist);
        for (Course course : courselist) {
            System.out.println(course.getCourseId()+course.getTeacherName()+"查出数据啦");
        }
        return "/WEB-INF/index.html";
    }
    @RequestMapping("/course_delete")
    public String course_delete(){
        courseService.deleteCourse("1");
        System.out.println("删除执行啦\n");
        return "/WEB-INF/index.html";
    }

    @RequestMapping("/course_add")
    public String course_add() throws ParseException {
        String a="2019-05-03 20:25:41";
        String b="2019-05-06 19:41:54";
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date aa=simpleDateFormat.parse(a);
        Date bb=simpleDateFormat.parse(b);
        Course course=new Course("3","高数","刘霞","A303",aa,bb);
        courseService.addCourse(course);
        System.out.println("添加执行啦\n");
        return "/WEB-INF/index.html";
    }

    @RequestMapping("/course_update")
    public String course_update() throws ParseException {
        String a="2019-05-03 20:25:41";
        String b="2019-05-06 19:41:54";
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date aa=simpleDateFormat.parse(a);
        Date bb=simpleDateFormat.parse(b);
        Course course=new Course("3","英语","刘霞","A303",aa,bb);
        courseService.updateCourse(course);
        System.out.println("修改执行啦\n");
        return "/WEB-INF/index.html";
    }

}
