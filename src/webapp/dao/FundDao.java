package webapp.dao;

/**
 * Created by Administrator on 2015/6/13.
 */
public interface FundDao {
    boolean isExist(String fname);
    boolean addFund(int id,String fname,String rank,String way,String situation);
    boolean deleteFund(String fname);
}
