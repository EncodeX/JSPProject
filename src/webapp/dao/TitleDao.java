package webapp.dao;

/**
 * Created by Administrator on 2015/6/13.
 */
public interface TitleDao {
    boolean isExist(String title);
    boolean addTitle(int id,String title);
    boolean deleteTitle(String title);
}
