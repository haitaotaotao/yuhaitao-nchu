package techermanager.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import techermanager.dao.UserMapper;
import techermanager.pojo.Form.UserForm;
import techermanager.pojo.User;
import techermanager.pojo.response.Response;
import techermanager.pojo.vo.UserVO;


import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserMapper userMapper;

    /**
     * 处理登陆请求
     *
     * @param userForm
     * @param session
     * @return
     */
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public String doLogin(UserForm userForm, HttpSession session, Model model) {
        System.out.println("处理登录请求");
        User user = userMapper.selectByAountNo(userForm.getuNo());
        if (user == null) {
            System.out.println("登录失败,没有该账号");
            model.addAttribute("msg", "登录失败,没有该账号！");
            return "teacher/login";
        }
        if (StringUtils.isEmpty(userForm.getPassword())) {
            System.out.println("登录失败,密码为空");
            model.addAttribute("msg", "登录失败,密码为空！");
            return "teacher/login";
        }

        if (userForm.getPassword().equals(user.getPassword())) {
            System.out.println("登录成功");
            session.setAttribute("User", user);
            return "redirect:/PersonDetail";
        } else {
            model.addAttribute("msg", "登录失败,账号密码不匹配！");
            System.out.println("登录失败,账号密码不匹配");
            return "teacher/login";
        }
    }


    /**
     * 退出登录
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/exit", method = RequestMethod.GET)
    public String exit(HttpSession session) {

        User user = (User) session.getAttribute("User");
        if (user == null) {
            //-1表示注销
            return "redirect:/login?msg=-1";
        } else {
            session.removeAttribute("User");
            return "redirect:/login?msg=-1";
        }
    }


    /**
     * 处理注册请求
     *
     * @param userForm
     * @param session
     * @return
     */
    @RequestMapping(value = "/doSign", method = RequestMethod.POST)
    @ResponseBody
    public int doSign(@RequestBody UserForm userForm, HttpSession session) {
        System.out.println("处理注册");
        User user = new User();
        user.setAccount(userForm.getuNo());
        user.setFaculty(userForm.getFaculty());
        user.setPassword(userForm.getPassword());
        user.setSex(userForm.getSex());
        if ("on".equals(userForm.getStatus())) {
            user.setStatus(1L);
        } else {
            user.setStatus(0L);
        }
        user.setPhone(userForm.getPhone());
        user.setUserName(userForm.getUserName());
        try {
            int num = userMapper.insert(user);
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
     * 查询所有用户信息
     *
     * @return
     */
    @RequestMapping(value = "/queryUsers", method = RequestMethod.GET)
    @ResponseBody
    public Response queryUsers(@RequestParam(value = "page") Integer page, @RequestParam("limit") Integer limit,
            @RequestParam(value = "key[faculty]" ,required = false) String faculty,
            @RequestParam(value = "key[userName]",required = false) String userName) {
        Response<UserVO> response = new Response();
        response.setCode(0);
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, limit);
        List<User> users = userMapper.selectByCondition(faculty,userName);
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



    /**
     * 处理删除
     */
    @RequestMapping(value = "/Delete", method = RequestMethod.GET)
    public String Delete(@RequestParam(value = "id") Long id, HttpSession session, Model model) {

        User user = (User) session.getAttribute("User");
        if (user != null) {
            userMapper.deleteByPrimaryKey(id);
        } else {
            model.addAttribute("msg", "请先登录！");
            return "teacher/login";
        }
        return "teacher/UserQuery";
    }


    /**
     * 处理注销登陆  loginOut
     */
    @RequestMapping(value = "/loginOut", method = RequestMethod.GET)
    public String loginOut(HttpSession session, Model model) {


        session.removeAttribute("User");

        return "index";
    }


    /**
     * 处理进入管理员中心请求
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping(value = "/adminOrder ", method = RequestMethod.GET)
    public String adminOrder(HttpSession session, Model model) {
        //        User user = (User) session.getAttribute("User");
        //        if (user != null&&user.getPower().equals(UserEnum.ADMIN.getCode())) {
        //
        //            List<FightOrderVO> fightOrderVOs = orderService.getFightOrder();
        //            model.addAttribute("admin",user);
        //            model.addAttribute("fightOrderVO", fightOrderVOs);
        //            return "admin";
        //        }else  if (user.getPower().equals(UserEnum.SURPER_ADMIN.getCode())){
        //
        //            return "redirect:/user/UserAdminList";
        //
        //        }else {
        //            return "redirect:/login";
        //        }
        return "redirect:/login";


    }

//    /**
//     * 教师管理个人资料
//     *
//     * @param session
//     * @param model
//     * @return
//     */
//    @RequestMapping(value = "/center ", method = RequestMethod.GET)
//    public String center(Model model,HttpSession session) {
//        System.out.println("进入控制，个人资料");
//                User user = (User) session.getAttribute("User");
//                if (user == null) {
//                    return "redirect:/login";
//                }
//                else {
//                    String AccountNo=user.getUserName();
//                    List<User> userList = new ArrayList<User>();
//                    User users = userMapper.selectByAountNo(AccountNo);
//                    userList.add(users);
//                    model.addAttribute("userlist", userList);
//                }
//        return "PersonDetail";
//    }


    /**
     * 进入联系人列表
     */
    @RequestMapping(value = "/relation ", method = RequestMethod.GET)
    public String relation(HttpSession session, Model model) {
        //        User user = (User) session.getAttribute("User");
        //        if (user == null) {
        //            return "redirect:/login";
        //        }
        //        model.addAttribute("admin",user);
        //
        //        List<RelationUser> relationUsers = userService.getRelation(user.getuId());
        //        model.addAttribute("relationUsers", relationUsers);
        return "userRalation";

    }

    /**
     * 删除联系人
     */
    @RequestMapping(value = "/DelRelation ", method = RequestMethod.GET)
    @ResponseBody
    public int DelRelation(@RequestParam("RUID") Long RUID, HttpSession session, Model model) {
        //        User user = (User) session.getAttribute("User");
        //        if (user == null) {
        //            return -2;
        //        }
        //        int result = rerationInfoMapper.deleteByPrimaryKey(user.getuId(), RUID);
        //
        //        if (result > 0) {
        //            return 1;
        //        } else {
        //            return -1;
        //        }
        return 0;

    }


    /**
     * 添加联系人
     */
    @RequestMapping(value = "/addRelation ", method = RequestMethod.GET)
    @ResponseBody
    public int addRelation(@RequestParam("name") String name, @RequestParam("Identity") String Identity,
            HttpSession session, Model model) {
        //        User user = (User) session.getAttribute("User");
        //        model.addAttribute("admin", user);
        //        if (user == null) {
        //            return -2;
        //        }
        //
        //        BizResult bizResult = userService.addRalationUser(user.getuId(), name, Identity);
        //
        //        if (bizResult.getSuccess()) {
        //            return 1;
        //        } else {
        //            if (bizResult.getCode().equals(-3)) {
        //                return -3;
        //            }
        //
        //            if (bizResult.getCode().equals(-5)) {
        //                return -5;
        //            }
        //
        //
        //            return -1;
        //        }
        return 0;

    }


    /**
     * 进入修改用户密码页面
     */
    @RequestMapping(value = "/userPwd", method = RequestMethod.GET)
    public String modifyPwd(HttpSession session, Model model) {

        //        User user = (User) session.getAttribute("User");
        //        if (user == null) {
        //            return "/login";
        //        }
        //        model.addAttribute("admin", user);
        //        return "userPwd";
        //    }
        //
        //    /**
        //     * 处理修改密码的请求
        //     */
        //    @RequestMapping(value = "/userChangePwd", method = RequestMethod.POST)
        //    public String userChangePwd(String pwd, String newPwd, String newRePwd, HttpSession session, Model model) {
        //        User user = (User) session.getAttribute("User");
        //        if (user == null) {
        //            return "/login";
        //        }
        //
        //        BizResult bizResult = userService.userChangePwd(user, pwd, newPwd, newRePwd);
        //        model.addAttribute("msg", bizResult.getMsg());

        return "result";

    }


    /**
     * 跳转到管理管理员列表界面fightAdmin
     */
    @RequestMapping(value = "/UserAdminList", method = RequestMethod.GET)
    public String UserAdminList(HttpSession session, Model model) {
        //        User user = (User) session.getAttribute("User");
        //        if (user == null) {
        //            return "redirect:login";
        //        }
        //        List<User> AdminUserList = userMapper.selectAllByPower(UserEnum.ADMIN.getCode());
        //        model.addAttribute("AdminUserList", AdminUserList);
        //        model.addAttribute("admin", user);
        return "/UserAdminList";
    }

    /**
     * 跳转到添加管理员界面
     */
    @RequestMapping(value = "/addUserAdmin", method = RequestMethod.GET)
    public String addUserAdmin(HttpSession session, Model model) {
        //        User user = (User) session.getAttribute("User");
        //        if (user == null) {
        //            return "redirect:login";
        //        }
        //
        //        model.addAttribute("admin", user);
        return "/addUserAdmin";
    }

    /**
     * 删除管理员的方法
     */

    @RequestMapping(value = "/delUser ", method = RequestMethod.GET)
    @ResponseBody
    public int delFight(@RequestParam("id") Long id, HttpSession session, Model model) {
        //        User user = (User) session.getAttribute("User");
        //        if (user == null) {
        //            return -2;
        //        }
        //        int result = userMapper.deleteByPrimaryKey(id);
        //
        //        if (result > 0) {
        //            return 1;
        //        } else {
        //            return -1;
        //        }
        return 0;
    }

    //    /**
    //     * 增加管理员的方法
    //     */
    //    @RequestMapping(value = "/addUserAdminInfo", method = RequestMethod.POST)
    //    public String addUserAdminInfo(User user, HttpSession session, Model model) {
    ////        User userPower = (User) session.getAttribute("User");
    ////        if (userPower == null) {
    ////            return "redirect:login";
    ////        }
    ////        user.setPower(UserEnum.ADMIN.getCode());
    ////
    ////        userMapper.insert(user);
    ////        model.addAttribute("msg", "添加成功");
    ////        model.addAttribute("admin", user);
    //
    //        return "/result";
    //    }


}
