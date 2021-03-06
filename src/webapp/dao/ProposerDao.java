package webapp.dao;

import webapp.model.Proposer;

import java.util.ArrayList;

/**
 * Created by zz on 2015/5/8.
 */
public interface ProposerDao {
    ArrayList<Proposer> getAllProposer();
    ArrayList<Proposer> getAllProposer(int page,int numPerPage);
    ArrayList<Proposer> getAllBySubID(int subID);
    ArrayList<Proposer> getAllByLasResult();
    ArrayList<Proposer> getProposersBySubClass(int page,int numPerPage,String subClass);
    ArrayList<Proposer> getProposersBySubID(int page,int numPerPage,int subID);
    ArrayList<Proposer> getProposersByLasResult(int page,int numPerPage);
    int getProposerAmount();
    int getProposerAmountBySubClass(String subClass);
    int getProposerAmountBySubID(int subID);
    boolean isExist(String name);
    Proposer getProposerByName(String name);
    boolean deleteProposerByName(String name);
    void deleteProposerByGroupId(int id);
    boolean addProposer(Proposer proposer);
    boolean changeSubID(String userName,int subID);
    ArrayList<String> getAllSubclass();

    //by zz
    ArrayList<Proposer> getProposerByExpertID(int expID);
    ArrayList<Proposer> getProposerByRecID(int recID);
    ArrayList<Proposer> getProposerBySearchName(String name);
    void changeLastResult(int userid,int lastresult);
    int getAmountOfLastResult();

}
