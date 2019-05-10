package sell.dao;

import sell.pojo.Project;

import java.util.List;

public interface ProjectMapper {
    //管理员查询所有
    List<Project> findAllProject();
    //管理员删除
    int deleteProject(String id);
    //管理员增加
    int addPjoject(Project project);
    //管理员修改
    int updateProject(Project project);
    //管理员模糊查询
    List<Project> findProject(Project project);
    //管理员审核，只会传id和状态，到后台进行修改
    int checkProject(Project project);
    //教师进行状态变更
    //撤销，传id，状态变更为9
    int anniuAProject(Project project);
    //提交成果，传id，状态变更为2，fileProject传入数据
    int anniuBProject(Project project);
    //提交论文，传id，状态变更为4，fileEnd传入数据
    int anniuCProject(Project project);
}
