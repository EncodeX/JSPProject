package webapp.dao;

/**
 * Created by Administrator on 2015/6/13.
 */
public interface ResultDao {
    boolean isExist(String situation);
    boolean addResult(int id,String situation);
    boolean deleteResult(String situation);
}
