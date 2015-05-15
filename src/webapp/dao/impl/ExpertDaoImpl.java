package webapp.dao.impl;

import webapp.dao.ExpertDao;
import webapp.model.Expert;
import webapp.utils.DbConnector;

import java.sql.*;
import java.util.Vector;

/**
 * Created by Administrator on 2015/5/11.
 */
public class ExpertDaoImpl implements ExpertDao{

    Connection connection= DbConnector.getConnection();
    @Override
    public boolean addExpert(String expName, String expPwd, String expID, int groupID) {
        PreparedStatement ps=null;
        String sql="INSERT INTO Expert(expName,expPwd,expID,groupID) VALUES (?,?,?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1,expName);
            ps.setString(2,expPwd);
            ps.setString(3, expID);
            ps.setInt(4, groupID);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("添加信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean deleteExpert(String expID) {
        PreparedStatement ps=null;
        String sql="delete from Expert where expID =?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, expID);
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("删除信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean updateExpert(String expName, String expPwd, String expID, int groupID) {
        PreparedStatement ps=null;
        String sql="update expert set expName=?,expPwd=?,groupID=? where expID='"+expID+"'";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1,expName);
            ps.setString(2,expPwd);
            ps.setInt(3, groupID);
            ps.executeUpdate();
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
                Expert.setExpID(rs.getString(3));
                Expert.setGroupID(rs.getInt(4));
                Experts.add(Expert);
            }
        } catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return null;
        }
        return Experts;
    }

}
