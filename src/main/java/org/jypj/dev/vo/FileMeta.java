package org.jypj.dev.vo;

/**
 * 文件上传的数据对象
 */
public class FileMeta {

    private String fileAllPath;//文件全路径 http://
    private String filePath; //文件上传相对路径 /shoesImg/uuid
    private String fileName; //文件名称
    private String fileSize;//文件大小
    private String fileType;//文件类型

    /**
     * layui使用
     */
    private String src;

    public String getFileAllPath() {
        return fileAllPath;
    }

    public void setFileAllPath(String fileAllPath) {
        this.fileAllPath = fileAllPath;
        this.src = fileAllPath;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }
}
