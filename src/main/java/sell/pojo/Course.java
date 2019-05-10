package sell.pojo;

import java.util.Date;

public class Course {
    private String courseId;
    private String courseName;
    private String teacherName;
    private String address;
    private Date startTimes;
    private Date eddTimes;

    public Course() {
    }

    public Date getStartTimes() {
        return startTimes;
    }

    public void setStartTimes(Date startTimes) {
        this.startTimes = startTimes;
    }

    public Date getEddTimes() {
        return eddTimes;
    }

    public void setEddTimes(Date eddTimes) {
        this.eddTimes = eddTimes;
    }

    public Course(String courseId, String courseName, String teacherName, String address, Date startTimes, Date eddTimes) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.teacherName = teacherName;
        this.address = address;
        this.startTimes = startTimes;
        this.eddTimes=eddTimes;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String coursseId) {
        this.courseId = coursseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


}
