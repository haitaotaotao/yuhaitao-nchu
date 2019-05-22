
package techermanager.controller;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping("/load")
public class MessageController{
    /**
     * 单个文件上传
     * @param request
     * @return
     */
    @RequestMapping(value="/upload2",produces="text/html;charset=utf-8")
    @ResponseBody
    private String upload2(@RequestParam("file") CommonsMultipartFile partFile, HttpServletRequest request) {
        try {
            String path = request.getServletContext().getRealPath("/upload");
            String name = request.getParameter("name");
//            log.info("其他的参数{}",name);
//            log.info("upload2---------------start---------------------");
//            log.info("这个临时文件的路径是[{}]", path);
            String filename = partFile.getOriginalFilename();
//            log.info("文件的名字：{}",filename);
            File file = new File(path+"/"+filename);
            InputStream inputStream = partFile.getInputStream();
            FileUtils.copyInputStreamToFile(inputStream, file);
            if(inputStream!=null){
                inputStream.close();
            }
            return "文件上传成功！";
        } catch (Exception e) {
            e.printStackTrace();
            return "文件上传失败！";
        }
    }



    /**
     * 文件下载
     * 单个文件下载
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/down1")
    private void down(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String path = request.getServletContext().getRealPath("/upload");
        File file = new File(path);
        File[] files = file.listFiles();
        String name = files[0].getName();//随机获取一个文件，实际中按需编写代码
        System.out.println("文件的名字："+name);
        response.addHeader("content-disposition", "attachment;filename="+name);
        FileUtils.copyFile(files[0], response.getOutputStream());
    }
}