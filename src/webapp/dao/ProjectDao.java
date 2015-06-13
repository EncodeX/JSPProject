package webapp.dao;

/**
 * Created by Administrator on 2015/6/13.
 */
public interface ProjectDao {
    boolean isExist(String pname);
    boolean addProject(int id,String pname,String unit,String role,String money);
    boolean deleteProject(String pname);
}
