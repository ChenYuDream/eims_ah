package org.jypj.dev.controller.back;

import org.jypj.dev.util.FileUtil;
import org.jypj.dev.util.PropertyUtil;
import org.jypj.dev.vo.FileMeta;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * @author ChenYu
 * @date 2017-06-28
 */
@Controller
@RequestMapping("back/upload")
public class UploadController {

    @RequestMapping("/img")
    @ResponseBody
    public Map<String, Object> uploadFile(MultipartFile file, HttpServletResponse response) {
        Map<String, Object> resultMap = new HashMap<>();
        // 得到上传文件
        String fileName = file.getOriginalFilename();
        // 文件的后缀名
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
        FileMeta fileMeta = new FileMeta();
        try {
            String upload = FileUtil.upload("/anHuaImg", file);
            fileMeta.setFilePath(upload);
            fileMeta.setFileAllPath(PropertyUtil.getFileServerPath() + upload);
            fileMeta.setFileType(ext);
        } catch (Exception e) {
            e.printStackTrace();
        }
        resultMap.put("data", fileMeta);
        resultMap.put("code", 0);
        return resultMap;
    }
}
