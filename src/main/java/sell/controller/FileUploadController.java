package sell.controller;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;


@Controller
public class FileUploadController {
//    private static String UPLOAD_DIRECTORY = PropertiesUtil.get("fileupload.directory", "");
//
//    @RequestMapping(value = "uploadFile", method = RequestMethod.POST)
//    public ModelAndView uploadFile(@RequestParam("file") MultipartFile file) {
//        // 判断文件是否为空
//        if (!file.isEmpty()) {
//            try { //判断文件目录是否存在，否则自动生成
//                File directory = new File(UPLOAD_DIRECTORY);
//                if (!directory.exists()) {
//                    directory.mkdirs();
//                }
//                //失败跳转视图
//                if (file.getSize() > 30000)
//                    return new ModelAndView("uploadFail", "msg", file.getOriginalFilename() + "超过了指定大小");
//                // 文件保存路径
//                String filePath = FilenameUtils.concat(UPLOAD_DIRECTORY, file.getOriginalFilename());
//                // 转存文件
//                file.transferTo(new File(filePath));
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        //成功跳转视图
//        return new ModelAndView("uploadSuccess", "msg", file.getOriginalFilename());
//    }
}