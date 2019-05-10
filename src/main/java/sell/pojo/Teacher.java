package sell.pojo;

public class Teacher {
    private String teacherId;
    private String teacherName;
    private String sex;
    private String faculty;
    private String phone;
    private String age;

    public Teacher() {
    }

    public Teacher(String teacherId, String teacherName, String sex, String faculty, String phone, String age) {
        this.teacherId = teacherId;
        this.teacherName = teacherName;
        this.sex = sex;
        this.faculty = faculty;
        this.phone = phone;
        this.age = age;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }


    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(String teacherId) {
        this.teacherId = teacherId;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "teacherId='" + teacherId + '\'' +
                ", teacherName='" + teacherName + '\'' +
                ", sex='" + sex + '\'' +
                ", faculty='" + faculty + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
