package sell.dao;

import sell.pojo.Teacher;

import java.util.List;

public interface TeacherMapper {
    List<Teacher> findAllTeacher();
    int addTeacher(Teacher teacher);
    int updateTeacher(Teacher teacher);
    List<Teacher> findteacher(String t_name,String age);
    int deleteTeacher(String id);
}
