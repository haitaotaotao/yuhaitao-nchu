package techermanager.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PageSikpController {
//    @Autowired
//    private UserMapper userMapper;



    /**
     * 进入登陆页面
     * @return
     */
    @RequestMapping(value = "/login ",method = RequestMethod.GET)
    public String login(){
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
        //       User user=(User) session.getAttribute("User");
        //       if (user!=null){
        //           model.addAttribute("name",user.getUserName());
        //
        //       }
        System.out.println("进入个人中心");
        return "teacher/PersonDetail";
    }



    /**
     * 进入layUI
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/adminUI",method = RequestMethod.GET)
    public String adminUI(HttpSession session, Model model){
        //       User user=(User) session.getAttribute("User");
        //       if (user!=null){
        //           model.addAttribute("name",user.getUserName());
        //
        //       }
        System.out.println("asdasd");
        return "teacher/admin";
    }





    /**
     * 进入layUI
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/detailUI",method = RequestMethod.GET)
    public String detailUI(HttpSession session, Model model){
        //       User user=(User) session.getAttribute("User");
        //       if (user!=null){
        //           model.addAttribute("name",user.getUserName());
        //
        //       }
        System.out.println("asdasd");
        return "teacher/detail";
    }


    /**
     * 进入首页
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(HttpSession session, Model model){
//       User user=(User) session.getAttribute("User");
//       if (user!=null){
//           model.addAttribute("name",user.getUserName());
//
//       }
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



    @RequestMapping(value = "/test",method = RequestMethod.GET)

    public String test(){

//       List<User> userList= userMapper.selectAll();
//        for (User user : userList) {
//            System.out.println(user.getPassword()+""+user.getuId());
//        }


        return  "index";
    }
}
