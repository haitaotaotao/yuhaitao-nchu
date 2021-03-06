package techermanager.controller;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import techermanager.dao.ItemMapper;
import techermanager.pojo.Form.ItemForm;
import techermanager.pojo.Item;
import techermanager.pojo.User;
import techermanager.pojo.response.Response;
import techermanager.pojo.response.ResponseData;
import techermanager.pojo.vo.ItemVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    private ItemMapper itemMapper;

    /**
     * 项目申请
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/ItemApply", method = RequestMethod.POST)
    @ResponseBody
    public int doSign(@RequestBody ItemForm itemForm, HttpSession session) {
        User user = (User) session.getAttribute("User");
        System.out.println("项目申请控制层");
        Item item = new Item();
        item.setUserName(user.getUserName());
        item.setItemName(itemForm.getItemName());
        item.setRemark(itemForm.getRemark());
        item.setDeadLine(itemForm.getDeadLine());
        item.setStatus((long) 0);
        item.setCreatTime(new Date());
        item.setStatusName("待审核");
        item.setUserId(user.getId());
        try {
            int num = itemMapper.insert(item);
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
     * 项目审核模块
     *
     * @return
     */
    @RequestMapping(value = "/ItemAduit", method = RequestMethod.GET)
    @ResponseBody
    public Response ItemAduit(@RequestParam(value = "page") Integer page, @RequestParam("limit") Integer limit,
            @RequestParam(value = "key[userName]", required = false) String userName,
            @RequestParam(value = "key[itemName]", required = false) String itemName) {
        System.out.println("教师科研控制层");
        Response<ItemVO> response = new Response();
        response.setCode(0);
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, limit);
        List<Item> items = itemMapper.selectByCondition(userName, itemName);
        PageInfo<Item> pageInfo = new PageInfo<>(items);
        response.setCount(pageInfo.getTotal());

        //转换时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        List<ItemVO> voList = new ArrayList<>();
        if (!CollectionUtils.isEmpty(pageInfo.getList())) {
            for (Item item : pageInfo.getList()) {
                ItemVO vo = new ItemVO();
                BeanUtils.copyProperties(item, vo);
                vo.setCreatTime(sdf.format(item.getCreatTime()));
                voList.add(vo);
            }
        }
        response.setData(voList);
        return response;
    }


    /**
     * 教师科研管理
     *
     * @return
     */
    @RequestMapping(value = "/ItemInfo", method = RequestMethod.GET)
    @ResponseBody
    public Response ItemInfo(@RequestParam(value = "page") Integer page, @RequestParam("limit") Integer limit,
            @RequestParam(value = "key[itemName]", required = false) String itemName, HttpSession session) {
//        System.out.println("2222222222");
        User A = (User) session.getAttribute("User");
        String userName = A.getUserName();
        Response<ItemVO> response = new Response();
        response.setCode(0);
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, limit);
        List<Item> items = itemMapper.selectCondition(userName);
        PageInfo<Item> pageInfo = new PageInfo<>(items);
        response.setCount(pageInfo.getTotal());

        //转换时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

        List<ItemVO> voList = new ArrayList<>();
        if (!CollectionUtils.isEmpty(pageInfo.getList())) {
            for (Item item : pageInfo.getList()) {
                ItemVO vo = new ItemVO();
                BeanUtils.copyProperties(item, vo);
                vo.setCreatTime(sdf.format(item.getCreatTime()));
                voList.add(vo);
            }
        }
        response.setData(voList);
        return response;
    }


    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public ResponseData springUpload(HttpServletRequest request) throws IllegalStateException, IOException {
        long startTime = System.currentTimeMillis();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        String fillName = "";
        if (multipartResolver.isMultipart(request)) {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //获取multiRequest 中所有的文件名
            Iterator iter = multiRequest.getFileNames();

            while (iter.hasNext()) {
                //一次遍历所有文件
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    String contextPath = request.getServletContext().getRealPath("/");
                    String filePath = contextPath + "/WEB-INF/statics/uploadfile/";
                    fillName = file.getOriginalFilename();
                    String path = filePath + fillName;
                    System.out.println(path);
                    //上传
                    file.transferTo(new File(path));
                }

            }

        }
        long endTime = System.currentTimeMillis();
        System.out.println("方法三的运行时间：" + String.valueOf(endTime - startTime) + "ms");
//        User user = (User) session.getAttribute("User");
//        if (user != null) {
//            Item item = itemMapper.selectByPrimaryKey(id);
//            item.setStatusName("申请结题中");
//            item.setStatus(2L);
//            itemMapper.updateByPrimaryKey(item);
//        }
        return new ResponseData("uploadfile/" + fillName);
    }


    /**
     * 处理上传
     *
     * @param file
     * @param id
     * @return
     */
    @RequestMapping(value = "/doUpload", method = RequestMethod.POST)
    public String doUpload(@RequestParam(value = "file") String file, @RequestParam(value = "item") Long id) {
        Item item = itemMapper.selectByPrimaryKey(id);
        String[] str = file.split(",");
        item.setFile(str[1]);
        itemMapper.updateByPrimaryKey(item);

        return "teacher/ItemInfo";
    }


    /**
     * 处理删除
     */
    @RequestMapping(value = "/ItemDelet", method = RequestMethod.GET)
    public String ItemUpload(@RequestParam(value = "id") Long id, HttpSession session, Model model) {

        User user = (User) session.getAttribute("User");
        if (user != null) {
            itemMapper.deleteByPrimaryKey(id);
        } else {
            model.addAttribute("msg", "请先登录！");
            return "teacher/login";
        }
        return "redirect:/ItemInfo";
    }

    /**
     * 处理审核通过
     */
    @RequestMapping(value = "/audit", method = RequestMethod.GET)
    public String audit(@RequestParam(value = "id") Long id, HttpSession session, Model model) {

        User user = (User) session.getAttribute("User");
        if (user != null) {
            Item item = itemMapper.selectByPrimaryKey(id);
            item.setStatusName("审核通过");
            item.setStatus(1L);
            itemMapper.updateByPrimaryKey(item);
        } else {
            model.addAttribute("msg", "请先登录！");
            return "teacher/login";
        }
        return "redirect:/ItemAduit";
    }

    /**
     * 处理撤销
     */
    @RequestMapping(value = "/back", method = RequestMethod.GET)
    public String back(@RequestParam(value = "id") Long id, HttpSession session, Model model) {

        User user = (User) session.getAttribute("User");
        if (user != null) {
            Item item = itemMapper.selectByPrimaryKey(id);
            item.setStatusName("撤销");
            item.setStatus(3L);
            itemMapper.updateByPrimaryKey(item);
        } else {
            model.addAttribute("msg", "请先登录！");
            return "teacher/login";
        }
        return "redirect:/ItemAduit";
    }

    //项目数据分析
    @RequestMapping(value = "/shuju",produces= "application/json;charset=UTF-8")
    @ResponseBody
    public String queryForList() {

        List<Map<String, Object>> List=itemMapper.queryForList();
        //List<Chukujilu> List = chukujiluService.getAll(null);
        JSONArray json = new JSONArray();
        for(Map<String, Object> a : List){
            JSONObject jo = new JSONObject();
            jo.put("xx", a.get("user_name"));
            jo.put("yy", a.get("c"));
            json.add(jo);
        }
        System.out.print(json.toJSONString());
        return json.toJSONString();
    }

}