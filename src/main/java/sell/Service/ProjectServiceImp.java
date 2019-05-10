package sell.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sell.dao.ProjectMapper;
import sell.pojo.Project;

import java.util.List;

@Service
public class ProjectServiceImp  implements ProjectService{
    @Autowired
    private ProjectMapper projectMapper;

    public List<Project> findAllProject() {
        List<Project> list=projectMapper.findAllProject();
        return list;
    }

    public int deleteProject(String id) {
        projectMapper.deleteProject(id);
        return 0;
    }

    public int addPjoject(Project project) {
        projectMapper.addPjoject(project);
        return 0;
    }

    public int updateProject(Project project) {
        projectMapper.updateProject(project);
        return 0;
    }

    public List<Project> findProject(Project project) {
        List<Project> list=projectMapper.findProject(project);
        return list;
    }

    public int checkProject(Project project) {
        projectMapper.checkProject(project);
        return 0;
    }

    public int anniuAProject(Project project) {
        projectMapper.anniuAProject(project);
        return 0;
    }

    public int anniuBProject(Project project) {
        projectMapper.anniuBProject(project);
        return 0;
    }

    public int anniuCProject(Project project) {
        projectMapper.anniuCProject(project);
        return 0;
    }
}
