
package techermanager.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import techermanager.pojo.User;


import javax.servlet.http.HttpSession;

@Controller
public class PageSikpController {
//    @Autowired
//    private UserMapper userMapper;



    /**
     * 进入登陆页面
     * @return
     */
    @RequestMapping(value = "/login ",method = RequestMethod.GET)
    public String login(@RequestParam(value = "msg", required=false) String msg,Model model){
        model.addAttribute("msg",msg);
        System.out.println("进入了登录页面");
        return "teacher/login";
    }


    /**
     * 进入个人中心页面
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/PersonDetail",method = RequestMethod.GET)
    public String pesionDetail(HttpSession session, Model model){
               User user=(User) session.getAttribute("User");
               if (user!=null){
                   model.addAttribute("name",user.getUserName());
               }else {
                   model.addAttribute("msg","请先登录！");
                   return "teacher/login";
               }
        System.out.println("进入个人中心");
        return "teacher/PersonDetail";
    }


    /**
     * 进入新增课程信息
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/addCourse",method = RequestMethod.GET)
    public String addCourse(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入新增课程信息");
        return "teacher/addCourse";
    }
    /**
     * 进入查询课程信息
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/CourseTeacherQuery",method = RequestMethod.GET)
    public String CourseTeacherQuery(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入查询课程信息");
        return "teacher/CourseTeacherQuery";
    }

    /**
            * 进入查询课程
     * @param session
     * @param model
     * @return
             */
    @RequestMapping(value = "/CourseQuery",method = RequestMethod.GET)
    public String CourseQuery(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入查询课程");
        return "teacher/CourseQuery";
    }

    /**
     * 进入课程信息
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/CourseInfo",method = RequestMethod.GET)
    public String CourseInfo(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入课程信息");
        return "teacher/CourseInfo";
    }



    /**
     * 进入新增用户
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/addUser",method = RequestMethod.GET)
    public String addUser(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入新增用户");
        return "teacher/addUser";
    }



    /**
     * 进入审核科研项目
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/ItemAduit",method = RequestMethod.GET)
    public String ItemAduit(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入审核科研项目");
        return "teacher/ItemAduit";
    }


    /**
     * 进入申请科研项目
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/ItemApply",method = RequestMethod.GET)
    public String ItemApply(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入申请科研项目");
        return "teacher/ItemApply";
    }


    /**
     * 进入科研项目信息
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/ItemInfo",method = RequestMethod.GET)
    public String ItemInfo(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入申请科研项目");
        return "teacher/ItemInfo";
    }


    /**
     * 进入分配课程信息
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/mangerCourse",method = RequestMethod.GET)
    public String mangerCourse(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入分配课程信息");
        return "teacher/mangerCourse";
    }


    /**
     * 进入用户查询
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/UserQuery",method = RequestMethod.GET)
    public String UserQuery(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入用户查询");
        return "teacher/UserQuery";
    }


    /**
     * 进入demo
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/demo",method = RequestMethod.GET)
    public String demo(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入用户查询");
        return "teacher/demo";
    }

    /**
     * 进入demo
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/shuju",method = RequestMethod.GET)
    public String shuju(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        System.out.println("进入用户查询");
        return "teacher/shuju";
    }







    /**
     * 进入首页
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(HttpSession session, Model model){
        User user=(User) session.getAttribute("User");
        if (user!=null){
            model.addAttribute("name",user.getUserName());
        }else {
            model.addAttribute("msg","请先登录！");
            return "teacher/login";
        }
        return "index";
    }



    /**
     * 管理员管理界面
     * @return
     */
    @RequestMapping(value = "/admin ",method = RequestMethod.GET)
    public String admin(){
        return "admin";
    }

    /**
     * 进入注册页面
     * @return
     */
    @RequestMapping(value = "/sign ",method = RequestMethod.GET)
    public String sign(){
        return "sign";
    }



    @RequestMapping(value = "/ItemUpload",method = RequestMethod.GET)
    public String ItemUpload(){
        return  "teacher/ItemUpload";
    }

}
