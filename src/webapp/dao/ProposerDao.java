package webapp.dao;

import webapp.model.Proposer;

import java.util.ArrayList;

/**
 * Created by zz on 2015/5/8.
 */
public interface ProposerDao {
    ArrayList<Proposer> getAllProposer(int page,int numPerPage);
    int getProposerAmount();
    boolean isExist(String name);
    Proposer getProposerByName(String name);
    boolean deleteProposerByName(String name);
    void deleteProposerByGroupId(int id);
    boolean addProposer(Proposer proposer);
  //  ArrayList<Proposer> searchInfoByUnitsName(String unitsName,int page, int numPerPage);
    //by zz
    ArrayList<Proposer> getProposerByExpertID(int expID);
    ArrayList<Proposer> getProposerByRecID(int recID);
    ArrayList<Proposer> getProposerBySearchName(String name);
    void changeLastResult(int userid,int lastresult);
    int getAmountOfLastResult();

}