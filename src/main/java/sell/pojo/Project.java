package sell.pojo;

import java.util.Date;

public class Project {
    private int projectId;
    private String applicant;
    private String projectName;
    private int statius;
    private Date startTime;
    private Date eddTime;
    private String fileProject;
    private String fileEnd;
    private String remark;

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Project() {
    }

    public Project(int projectId, String applicant, String projectName, int statius, Date startTime, Date eddTime, String fileProject, String fileEnd, String remark) {
        this.projectId = projectId;
        this.applicant = applicant;
        this.projectName = projectName;
        this.statius = statius;
        this.startTime = startTime;
        this.eddTime = eddTime;
        this.fileProject = fileProject;
        this.fileEnd = fileEnd;
        this.remark = remark;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public int getStatius() {
        return statius;
    }

    public void setStatius(int statius) {
        this.statius = statius;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEddTime() {
        return eddTime;
    }

    public void setEddTime(Date eddTime) {
        this.eddTime = eddTime;
    }

    public String getFileProject() {
        return fileProject;
    }

    public void setFileProject(String fileProject) {
        this.fileProject = fileProject;
    }

    public String getFileEnd() {
        return fileEnd;
    }

    public void setFileEnd(String fileEnd) {
        this.fileEnd = fileEnd;
    }
}
