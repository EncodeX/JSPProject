package webapp.dao.impl;

import webapp.dao.ProposerDao;
import webapp.model.Proposer;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by Administrator on 2015/5/19.
 */
public class ProposerDaoImpl implements ProposerDao {
    Connection connection= DbConnector.getConnection();

    @Override
    public ArrayList<Proposer> getProposersByLasResult(int page, int numPerPage) {
        PreparedStatement ps;
        ArrayList<Proposer> Proposers=new ArrayList<Proposer>();
        String sql="select * from proposer where proposer.lasResult=1 limit ?,?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,(page-1)*numPerPage);
            ps.setInt(2,numPerPage);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Proposer proposer=new Proposer(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11));
                Proposers.add(proposer);
            }
            return Proposers;
        }
        catch (Exception e){
            System.err.println("从数据库获取信息失败"+sql+e);
            return null;
        }
    }

    @Override
    public ArrayList<Proposer> getAllByLasResult() {
        PreparedStatement ps;
        ArrayList<Proposer> Proposers=new ArrayList<Proposer>();
        String sql="select * from proposer where proposer.lasResult=1";
        try {
            ps=connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Proposer proposer=new Proposer(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11));
                Proposers.add(proposer);
            }
            return Proposers;
        }
        catch (Exception e){
            System.err.println("从数据库获取信息失败"+sql+e);
            return null;
        }
    }

    @Override
    public ArrayList<Proposer> getAllProposer() {
        PreparedStatement ps;
        String sql="select * from Proposer where proposer.userID>0";
        ArrayList<Proposer> proposers=new ArrayList<Proposer>();
        try {
            ps=connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Proposer proposer=new Proposer(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11));
                proposers.add(proposer);
            }
            return proposers;
        }
        catch (Exception e){
            System.err.println("从数据库获取信息失败"+sql+e);
            return null;
        }
    }

    @Override
    public ArrayList<Proposer> getAllProposer(int page, int numPerPage) {
        PreparedStatement ps;
        ArrayList<Proposer> Proposers=new ArrayList<Proposer>();
        String sql="select * from proposer where proposer.userID>0 limit ?,?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,(page-1)*numPerPage);
            ps.setInt(2,numPerPage);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Proposer proposer=new Proposer(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11));
                Proposers.add(proposer);
            }
            return Proposers;
        }
        catch (Exception e){
            System.err.println("从数据库获取信息失败"+sql+e);
            return null;
        }
    }

    @Override
    public ArrayList<Proposer> getAllBySubID(int subID) {
        PreparedStatement ps;
        String sql="select * from Proposer where proposer.subID=?";
        ArrayList<Proposer> proposers=new ArrayList<Proposer>();
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,subID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Proposer proposer=new Proposer(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11));
                proposers.add(proposer);
            }
            return proposers;
        }
        catch (Exception e){
            System.err.println("从数据库获取信息失败"+sql+e);
            return null;
        }
    }

    @Override
    public ArrayList<Proposer> getProposersBySubClass(int page, int numPerPage, String subClass) {
        PreparedStatement ps;
        ArrayList<Proposer> Proposers=new ArrayList<Proposer>();
        String sql="select * from proposer where proposer.subClass=? limit ?,?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, subClass);
            ps.setInt(2,(page-1)*numPerPage);
            ps.setInt(3,numPerPage);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Proposer proposer=new Proposer(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11));
                Proposers.add(proposer);
            }
            return Proposers;
        }
        catch (Exception e){
            System.err.println("从数据库获取信息失败"+sql+e);
            return null;
        }
    }

    @Override
    public ArrayList<Proposer> getProposersBySubID(int page, int numPerPage, int subID) {
        PreparedStatement ps;
        ArrayList<Proposer> Proposers=new ArrayList<Proposer>();
        String sql="select * from proposer where proposer.subID=? limit ?,?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1, subID);
            ps.setInt(2,(page-1)*numPerPage);
            ps.setInt(3,numPerPage);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Proposer proposer=new Proposer(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11));
                Proposers.add(proposer);
            }
            return Proposers;
        }
        catch (Exception e){
            System.err.println("从数据库获取信息失败"+sql+e);
            return null;
        }
    }

    @Override
    public int getProposerAmountBySubID(int subID) {
        PreparedStatement ps;
        String sql="select count(*)  from proposer  where proposer.subID=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1, subID);
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
    public int getProposerAmountBySubClass(String subClass) {
        PreparedStatement ps;
        String sql="select count(*)  from proposer  where proposer.subClass=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, subClass);
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
    public int getProposerAmount() {
        PreparedStatement ps;
        String sql="select count(*)  from proposer  where proposer.userID>0";
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
    public boolean isExist(String name) {
        PreparedStatement ps;
        String sql="select DISTINCT * from proposer WHERE userName=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception e){
            System.err.println("查询信息时出现异常" + sql + e);
            return false;
        }
    }

    @Override
    public Proposer getProposerByName(String name) {
        PreparedStatement ps;
        String sql="select DISTINCT * from proposer where userName=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1,name);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Proposer proposer=new Proposer(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11));
            return proposer;
        }
        catch (Exception e){
            System.err.println("获取信息时出现异常"+sql+e);
            return null;
        }
    }

    @Override
    public boolean deleteProposerByName(String name) {
        PreparedStatement ps;
        String sql="delete from proposer where userName =?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.execute();
            return true;
        }
        catch (Exception e){
            System.err.println("删除信息时出现异常"+sql+e);
            return false;
        }

    }

    @Override
    public void deleteProposerByGroupId(int id) {

    }

    @Override
    public boolean addProposer(Proposer proposer) {
        PreparedStatement ps=null;
        String sql="INSERT INTO Proposer(username,userPwd,name,subclass,subid,recid,recResult,firCount,firResult,lasResult) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?);";
        try {
            ps=connection.prepareStatement(sql);
            ps.setString(1, proposer.getUserName());
            ps.setString(2, proposer.getUserPwd());
            ps.setString(3, proposer.getName());
            ps.setString(4, proposer.getSubClass());
            ps.setInt(5, proposer.getSubID());
            ps.setInt(6,proposer.getRecID());
            ps.setInt(7, proposer.getRecResult());
            ps.setInt(8, proposer.getFirCount());
            ps.setInt(9, proposer.getFirResult());
            ps.setInt(10,proposer.getLasResult());
            ps.executeUpdate();
            return true;
        }
        catch (Exception e){
            System.err.println("添加信息时出现异常"+sql+e);
            return false;
        }
    }

    @Override
    public boolean changeSubID(String userName, int subID) {
        Statement st;
        String sql="update proposer set subID='"+subID+"' where userName='"+userName+"'";
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
    public ArrayList<Proposer> getProposerByRecID(int recID) {
        PreparedStatement ps;
        ArrayList<Proposer> proposers=new ArrayList<Proposer>();
        try {
            ps=connection.prepareStatement("select  * from proposer where recID=?");
            ps.setInt(1, recID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Proposer proposer=new Proposer(rs.getString(1),rs.getInt(2),rs.getString(3),rs.getInt("recresult"));
                proposers.add(proposer);
            }
            return proposers;
        }
        catch (Exception e){
            System.err.println("[DB ERROR]ProposerDaoImpl ArrayList<Proposer> getProposerByrecID");
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public ArrayList<Proposer> getProposerByExpertID(int expID) {
        PreparedStatement ps;
        ArrayList<Proposer> proposers=new ArrayList<Proposer>();
        try {
            ps=connection.prepareStatement("select distinct * from proposer where userID in(select pid from vote where eid=?)");
            ps.setInt(1, expID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Proposer proposer=new Proposer(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11));
                proposers.add(proposer);
            }
            return proposers;
        }
        catch (Exception e){
            System.err.println("[DB ERROR]ProposerDaoImpl ArrayList<Proposer> getProposerByExpertID");
            return null;
        }
    }

    @Override
    public ArrayList<Proposer> getProposerBySearchName(String name) {
        PreparedStatement ps;
        ArrayList<Proposer> proposers=new ArrayList<Proposer>();
        try {
            if(name==null||name.equals("")){
                ps=connection.prepareStatement("select distinct * from proposer");
            }else{
                ps=connection.prepareStatement("select distinct * from proposer where name LIKE '%"+name+"%'");
            }
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Proposer proposer=new Proposer(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9),rs.getInt(10),rs.getInt(11));
                proposers.add(proposer);
            }
            return proposers;
        }
        catch (Exception e){
            System.err.println("[DB ERROR]ProposerDaoImpl ArrayList<Proposer> getProposerBySearchName");
            return null;
        }
    }

    @Override
    public void changeLastResult(int userid, int lastresult) {
        PreparedStatement ps;
        String sql="update proposer set lasResult=? where userid=?";
        try {
            ps=connection.prepareStatement(sql);
            ps.setInt(1,lastresult);
            ps.setInt(2,userid);
            ps.executeUpdate();
        }
        catch (Exception e){
            System.err.println("[DB ERROR]ProposerDaoImpl void changeLastResult");
        }
    }

    @Override
    public int getAmountOfLastResult() {
        PreparedStatement ps;
        String sql="select count(*)  from proposer  where lasResult=1";
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
}
