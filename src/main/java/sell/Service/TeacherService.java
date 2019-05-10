package sell.Service;

import org.springframework.stereotype.Service;
import sell.pojo.Teacher;

import java.util.List;

public interface TeacherService {
    List<Teacher> findAllTeacher();
    int deleteTeacher(String id);
    int addTeacher(Teacher teacher);
    int updateTeacher(Teacher teacher);
    List<Teacher> findTeacher(String t_name,String age);
}
