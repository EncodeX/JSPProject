package webapp.dao.impl;

import webapp.dao.ExpertDao;
import webapp.model.Expert;
import webapp.utils.DbConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

/**
 * Created by Administrator on 2015/5/11.
 */
public class ExpertDaoImpl implements ExpertDao{

    Connection connection= DbConnector.getConnection();
    @Override
    public boolean addExpert(String expName, String expPwd, int groupID) {
        PreparedStatement ps=null;
        String sql="INSERT INTO Expert(expName,expPwd,groupID) VALUES (?,?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1,expName);
            ps.setString(2,expPwd);
            ps.setInt(3, groupID);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("添加信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean deleteExpert(String expName) {
        PreparedStatement ps=null;
        String sql="delete from Expert where expName =?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, expName);
            ps.execute();
            return true;
        }
        catch (Exception e){
            System.err.println("删除信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean updateExpert(String exOldname,String expName, String expPwd, int groupID) {
        Statement st=null;
        String sql="update expert set expName='"+expName+"',expPwd='"+expPwd+"',groupID='"+groupID+"' where expName='"+exOldname+"'";
        try {
            st=connection.createStatement();
            st.executeUpdate(sql);
            return true;
        }
        catch (Exception e){
            System.err.println("更新信息时出现异常"+sql+e);
            return false;
        }
    }
    @Override
    public Vector<Expert> updateExpert() {
        Statement st=null;
        String sql="select * from expert;";
        Vector<Expert> Experts=new Vector<Expert>();
        try {
            st = (Statement) connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                Expert Expert=new Expert();
                Expert.setExpName(rs.getString(1));
                Expert.setExpPwd(rs.getString(2));
                Expert.setExpID(rs.getInt(3));
                Expert.setGroupID(rs.getInt(4));
                Experts.add(Expert);
            }
        } catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return null;
        }
        return Experts;
    }

    @Override
    public ArrayList<Expert> getAllExperts(int page, int numPerPage) {
        PreparedStatement ps;
        String sql="select * from expert  where expert.expID>0 limit ?,?";
        ArrayList<Expert> experts=new ArrayList<Expert>();
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,(page-1)*numPerPage);
            ps.setInt(2,numPerPage);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Expert expert=new Expert();
                expert.setExpName(rs.getString(1));
                expert.setExpPwd(rs.getString(2));
                expert.setExpID(rs.getInt(3));
                expert.setGroupID(rs.getInt(4));
                experts.add(expert);
            }
            return experts;
        }
        catch (Exception e){
            System.err.println("获取信息时出现异常" + sql + e);
            return null;
        }
    }

    @Override
    public boolean isExist(String expName) {
        PreparedStatement ps;
        String sql="select DISTINCT * from expert WHERE expName=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1,expName);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return false;
        }
    }

    @Override
    public int getExpertAmount() {
        PreparedStatement ps;
        String sql="select count(*) from expert";
        try {
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

    @Override
    public Expert getExpertByName(String name) {
        PreparedStatement ps;
        String sql="select DISTINCT * from expert where expName=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1,name);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Expert expert=new Expert();
            expert.setExpName(rs.getString(1));
            expert.setExpPwd(rs.getString(2));
            expert.setExpID(rs.getInt(3));
            expert.setGroupID(rs.getInt(4));
            return expert;
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]SubjectGroup getSubjectGroupByName ERROR.");
            return null;
        }
    }
}
