package webapp.dao;

/**
 * Created by Administrator on 2015/6/13.
 */
public interface PaperDao {
    boolean isExist(String paper);
    boolean addPaper(int id,String paper);
    boolean deletePaper(String paper);
}
