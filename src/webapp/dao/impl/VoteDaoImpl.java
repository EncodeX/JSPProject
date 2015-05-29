package webapp.dao.impl;

import webapp.dao.VoteDao;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by zz on 2015/5/26.
 */
public class VoteDaoImpl implements VoteDao {

    Connection connection= DbConnector.getConnection();

    @Override
    public void deleteAllVoteByExpertID(int expID) {
        PreparedStatement ps;
        try {
            ps=connection.prepareStatement("update proposer set recResult=0 where userID in(SELECT pid as userID from vote where eid=?)");
            ps.setInt(1, expID);
            ps.execute();
            ps=connection.prepareStatement("delete from vote where eid=?");
            ps.setInt(1, expID);
            ps.execute();
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]VoteDaoImpl void deleteAllVoteByExpertID ERROR.");
        }
    }

    @Override
    public int getAlreadVoteByExpertID(int expID) {
        PreparedStatement ps;
        String sql="select count(*) from vote where eid=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,expID);
            ps=connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return 0;
        }
    }
}
