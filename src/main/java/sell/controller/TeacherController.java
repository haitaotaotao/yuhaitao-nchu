package sell.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import sell.Service.TeacherService;
import sell.pojo.Teacher;
import java.util.List;

@Controller
public class TeacherController {
    @Autowired
    private TeacherService teacherService;

    @RequestMapping(value="/teacher_find_all",method = RequestMethod.GET)
    public String teacher_list(Model model){
        System.out.printf("进入***");
        List<Teacher> teacherlist=teacherService.findAllTeacher();
        model.addAttribute("teacherlist",teacherlist);
//        for (Teacher teacher : teacherlist) {
//            System.out.println(teacher.getTeacherId()+teacher.getAge()+"查出数据啦");
//        }
        return "index.html";
    }
    @RequestMapping("/teacher_delete")
    public String teacher_delete(){
        teacherService.deleteTeacher("15202107");
        System.out.println("删除执行啦\n");
        return "index.html";
    }

    @RequestMapping("/teacher_add")
    public String teacher_add() {
        Teacher teacher = new Teacher("15202105","刘霞","女","软件","123456789","11");
        teacherService.addTeacher(teacher);
        System.out.println("添加执行啦\n");
        return "index.html";
    }

    @RequestMapping("/teacher_update")
    public String teacher_update() {
        Teacher teacher = new Teacher("15202105","刘霞","女","软件","000000","99");
        teacherService.updateTeacher(teacher);
        System.out.println("修改执行啦\n");
        return "index.html";
    }
}
