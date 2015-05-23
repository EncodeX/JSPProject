package webapp.dao;

import webapp.model.SubjectGroup;

import java.util.*;
/**
 * Created by zz on 2015/5/8.
 */
public interface GroupDao {
    ArrayList<SubjectGroup> getAllSubjectGroup();
    ArrayList<SubjectGroup> getAllSubjectGroup(int page,int numPerPage);
    int getGroupAmount();
    boolean isExist(String name);
    SubjectGroup getSubjectGroupByName(String name);
    void deleteSubjectGroupByName(String name);
    void deleteSubjectGroupByGroupId(int id);
    boolean addSubjectGroup(SubjectGroup subjectGroup);
    boolean changeQuotaByGroupName(String name,int number);
    boolean changeQuotaByGroupId(int id,int number);

    void addFinalGroup();
}
