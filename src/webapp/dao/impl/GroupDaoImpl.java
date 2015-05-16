package webapp.dao.impl;

import webapp.dao.GroupDao;
import webapp.model.SubjectGroup;
import webapp.utils.DbConnector;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by zz on 2015/5/15.
 */
public class GroupDaoImpl implements GroupDao {

    Connection connection= DbConnector.getConnection();

    @Override
    public ArrayList<SubjectGroup> getAllSubjectGroup() {
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<SubjectGroup> subjectGroups=new ArrayList<SubjectGroup>();
        try {
            ps=connection.prepareStatement("select * from subgrp where subgrp.groID>0");
            rs = ps.executeQuery();
            while(rs.next()){
                SubjectGroup sg=new SubjectGroup(rs.getInt("groID"),rs.getString("groName"),rs.getInt("subNum"));
                subjectGroups.add(sg);
            }
            return subjectGroups;
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]ArrayList<SubjectGroup> getAllSubjectGroup ERROR.");
            return null;
        }
    }

    @Override
    public ArrayList<SubjectGroup> getAllSubjectGroup(int page, int numPerPage) {
        PreparedStatement ps;
        ResultSet rs;
        ArrayList<SubjectGroup> subjectGroups=new ArrayList<SubjectGroup>();
        try {
            ps=connection.prepareStatement("select * from subgrp  where subgrp.groID>0 limit ?,?");
            ps.setInt(1,(page-1)*numPerPage);
            ps.setInt(2,numPerPage);
            rs = ps.executeQuery();
            while(rs.next()){
                SubjectGroup sg=new SubjectGroup(rs.getInt("groID"),rs.getString("groName"),rs.getInt("subNum"));
                subjectGroups.add(sg);
            }
            return subjectGroups;
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]ArrayList<SubjectGroup> getAllSubjectGroup ERROR.");
            return null;
        }
    }

    @Override
    public int getGroupAmount() {
        PreparedStatement ps;
        ResultSet rs;
        try {
            ps=connection.prepareStatement("select count(*) as num from subgrp  where subgrp.groID>0");
            rs = ps.executeQuery();
            rs.next();
            return rs.getInt("num");
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]int GroupDaoImpl.getGroupAmount ERROR.");
            return 0;
        }
    }

    @Override
    public boolean isExist(String name) {
        PreparedStatement ps;
        ResultSet rs;
        try {
            ps=connection.prepareStatement("select DISTINCT * from subgrp WHERE groName=?");
            ps.setString(1,name);
            rs = ps.executeQuery();
            return rs.next();
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]GroupDaoImpl boolean isExist ERROR.");
            return false;
        }
    }

    @Override
    public SubjectGroup getSubjectGroupByName(String name) {
        PreparedStatement ps;
        ResultSet rs;
        try {
            ps=connection.prepareStatement("select DISTINCT * from subgrp where groName=?");
            ps.setString(1,name);
            rs = ps.executeQuery();
            rs.next();
            return new SubjectGroup(rs.getInt("groID"),rs.getString("groName"),rs.getInt("subNum"));
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]SubjectGroup getSubjectGroupByName ERROR.");
            return null;
        }
    }

    @Override
    public void deleteSubjectGroupByName(String name) {
        PreparedStatement ps;
        try {
            ps=connection.prepareStatement("delete from subgrp where groName=?");
            ps.setString(1,name);
            ps.execute();
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]GroupDaoImpl void deleteSubjectGroupByName ERROR.");
        }
    }

    @Override
    public void deleteSubjectGroupByGroupId(int id) {
        PreparedStatement ps;
        ArrayList<SubjectGroup> subjectGroups=new ArrayList<SubjectGroup>();
        try {
            ps=connection.prepareStatement("delete from subgrp where groID=?");
            ps.setInt(1, id);
            ps.execute();
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]GroupDaoImpl void deleteSubjectGroupByGroupId ERROR.");
        }
    }

    @Override
    public boolean addSubjectGroup(SubjectGroup subjectGroup) {
        if(isExist(subjectGroup.getGroName())){
            return false;
        }
        PreparedStatement ps;
        try {
            ps=connection.prepareStatement("INSERT into subgrp VALUES (NULL,?,?)");
            ps.setString(1,subjectGroup.getGroName());
            ps.setInt(2, subjectGroup.getSubNum());
            ps.execute();
        }
        catch (Exception ex){
            System.err.println("[DB ERROR]GroupDaoImpl boolean addSubjectGroup ERROR.");
        }
        return true;
    }
}
