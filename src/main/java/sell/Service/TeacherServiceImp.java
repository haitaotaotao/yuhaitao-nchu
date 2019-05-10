package sell.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sell.dao.TeacherMapper;
import sell.pojo.Teacher;

import java.util.List;
@Service
public class TeacherServiceImp implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;

    public List<Teacher> findAllTeacher() {
        List<Teacher> list = teacherMapper.findAllTeacher();
        return list;
    }

    public int deleteTeacher(String id) {
        teacherMapper.deleteTeacher(id);
        return 0;
    }

    public int addTeacher(Teacher teacher) {
        teacherMapper.addTeacher(teacher);
        return 0;
    }

    public int updateTeacher(Teacher teacher) {
        teacherMapper.updateTeacher(teacher);
        return 0;
    }

    public List<Teacher> findTeacher(String teahcerName, String age) {
        List<Teacher> list =teacherMapper.findteacher(teahcerName,age);
        return list;
    }
}
