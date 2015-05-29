package webapp.dao;

/**
 * Created by zz on 2015/5/26.
 */
public interface VoteDao {
    void deleteAllVoteByExpertID(int expID);
    int getAlreadVoteByExpertID(int expID);
}
