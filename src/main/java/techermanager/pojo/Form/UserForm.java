package techermanager.pojo.Form;

import java.io.Serializable;

public class UserForm implements Serializable {


    private String password;


    private String uNo;

    private String userName;

    private String faculty;


    private String phone;



    private String sex;


    private String status;


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private static final long serialVersionUID = 1L;




    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getuNo() {
        return uNo;
    }


    public void setuNo(String uNo) {
        this.uNo = uNo == null ? null : uNo.trim();
    }


    public String getUserName() {
        return userName;
    }


    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }


    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }


    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }



    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", password=").append(password);
        sb.append(", uNo=").append(uNo);
        sb.append(", userName=").append(userName);
        sb.append(", faculty=").append(faculty);
        sb.append(", phone=").append(phone);
        sb.append(", sex=").append(sex);
        sb.append(", status=").append(status);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}
