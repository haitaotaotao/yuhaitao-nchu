package techermanager.pojo;

import java.io.Serializable;
import java.util.Date;

public class Course implements Serializable {
    private Long id;

    private String courseName;

    private String courseCode;

    private Date courseCreatTime;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName == null ? null : courseName.trim();
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode == null ? null : courseCode.trim();
    }

    public Date getCourseCreatTime() {
        return courseCreatTime;
    }

    public void setCourseCreatTime(Date courseCreatTime) {
        this.courseCreatTime = courseCreatTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", courseName=").append(courseName);
        sb.append(", courseCode=").append(courseCode);
        sb.append(", courseCreatTime=").append(courseCreatTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}