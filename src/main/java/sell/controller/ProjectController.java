package sell.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import sell.Service.ProjectService;
import sell.pojo.Course;
import sell.pojo.Project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ProjectController {

    @Autowired
    private ProjectService projectService;
    //

//    @RequestMapping(value="/project_find_all",method = RequestMethod.GET)
//    public String project_find_all(Model model){
//        System.out.printf("进入***");
//        List<Project> projectlist=projectService.findAllProject();
//        model.addAttribute("projectlist",projectlist);
//        for (Project project : projectlist) {
//            System.out.println(project.getApplicant()+project.getFileProject()+project.getRemark()+"查出数据啦");
//        }
//        return "/WEB-INF/index.html";
//    }
//    @RequestMapping("/project_delete")
//    public String project_delete(){
//        projectService.deleteProject("2");
//        System.out.println("删除执行啦\n");
//        return "/WEB-INF/index.html";
//    }
//
//    @RequestMapping("/project_add")
//    public String project_add() throws ParseException {
//        String a="2019-05-03 20:25:41";
//        String b="2019-05-06 19:41:54";
//        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date aa=simpleDateFormat.parse(a);
//        Date bb=simpleDateFormat.parse(b);
//      //  Project project=new Project("15"+"yht"+"yht"+"0"+aa+bb+"ww"+"ww"+"yht");
//        //projectService.addPjoject(project);
//        System.out.println("添加执行啦\n");
//        return "/WEB-INF/index.html";
//    }
//
//    @RequestMapping("/course_update")
//    public String course_update() throws ParseException {
//        String a="2019-05-03 20:25:41";
//        String b="2019-05-06 19:41:54";
//        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date aa=simpleDateFormat.parse(a);
//        Date bb=simpleDateFormat.parse(b);
//        Course course=new Course("3","英语","刘霞","A303",aa,bb);
//      //  courseService.updateCourse(course);
//        System.out.println("修改执行啦\n");
//        return "/WEB-INF/index.html";
//    }
}