package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import webapp.dao.ExpertDao;
import webapp.dao.GroupDao;
import webapp.dao.impl.ExpertDaoImpl;
import webapp.dao.impl.GroupDaoImpl;
import webapp.model.Expert;
import webapp.model.SubjectGroup;

import java.util.ArrayList;
import java.util.Vector;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/userinfo")
public class UserInfoManagement {
    ExpertDao ExpertDao=new ExpertDaoImpl();
    GroupDao GroupDao=new GroupDaoImpl();
    //Expert
    @RequestMapping(value = "main",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getMainPage(ModelAndView modelAndView,String page){
        int pages;
        if(page==null){
            pages=1;
        }else{
            pages=Integer.parseInt(page);
        }
        modelAndView.setViewName("userinfo/main");
        ArrayList<Expert> experts=ExpertDao.getAllExperts(pages,10);
        if(ExpertDao.getExpertAmount()==0) {
            modelAndView.addObject("message", "目前还没有评审专家信息！");
        }else {
            modelAndView.addObject("experts", experts);
            modelAndView.addObject("pages", pages);
            modelAndView.addObject("amount", ExpertDao.getExpertAmount());
        }
        return modelAndView;
    }
    @RequestMapping(value = "addExpert",method =RequestMethod.GET)
    public ModelAndView addExpert(ModelAndView modelAndView) {
        modelAndView.setViewName("/userinfo/addExpert");
        return modelAndView;
    }
    @RequestMapping(value = "addExpertToDB",method =RequestMethod.POST)
    public ModelAndView addExpertToDB(ModelAndView modelAndView,String expName,String expPwd,
                                      String expPwd2,String groID) {
        modelAndView.setViewName("userinfo/main");
        String message="";
        try{
            if(Integer.parseInt(expPwd)!=Integer.parseInt(expPwd2)){
                message="您两次输入的密码不一致";
                modelAndView.setViewName("userinfo/error");
                modelAndView.addObject("message", message);
                return modelAndView;
            }
            if(!ExpertDao.isExist(expName)){
                ExpertDao.addExpert(expName, expPwd, Integer.parseInt(groID));
            }else{
                message="该用户已存在！";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("userinfo/error");
            message="添加失败： "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getMainPage(modelAndView,"1");
    }
    @RequestMapping(value = "changeExpert",method =RequestMethod.GET)
    public ModelAndView changeExpert(ModelAndView modelAndView,String name) {
        Expert expert=ExpertDao.getExpertByName(name);
        modelAndView.addObject(expert);
        modelAndView.setViewName("/userinfo/changeExpert");
        return modelAndView;
    }
    @RequestMapping(value = "updateExpertToDB",method =RequestMethod.POST)
    public ModelAndView updateExpertToDB(ModelAndView modelAndView,String exOldname,String expName,String expPwd,
                                      String expPwd2,String groID) {
        modelAndView.setViewName("userinfo/main");
        String message="";
        try{
            if(Integer.parseInt(expPwd)!=Integer.parseInt(expPwd2)){
                message="您修改时两次输入的密码不一致";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
            if(!ExpertDao.isExist(expName)){
                ExpertDao.updateExpert(exOldname, expName, expPwd, Integer.parseInt(groID));
            }else{
                message="该用户名已存在！";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("userinfo/error");
            message="添加失败： "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getMainPage(modelAndView,"1");
    }
    @RequestMapping(value = "deleteExpert",method = RequestMethod.GET)
    public ModelAndView deleteExpert(ModelAndView modelAndView,String name){
        if(!ExpertDao.isExist(name)){
            modelAndView.setViewName("userinfo/main");
            modelAndView.addObject("message","该用户名不存在!");
            return modelAndView;
        }
        ExpertDao.deleteExpert(name);
        return getMainPage(modelAndView,"1");
    }
    //Group
    @RequestMapping(value = "groupmain",method = {RequestMethod.GET})
    public ModelAndView getGroupMainPage(ModelAndView modelAndView,String page){
        int intpage;
        if(page==null){
            intpage=1;
        }else{
            intpage=Integer.parseInt(page);
        }
        modelAndView.setViewName("userinfo/groupmain");
        ArrayList<SubjectGroup> subjectGroups=GroupDao.getAllSubjectGroup(intpage,10);
        modelAndView.addObject("subjectGroups",subjectGroups);
        modelAndView.addObject("amount", GroupDao.getGroupAmount());
        modelAndView.addObject("pages", intpage);
        return modelAndView;
    }
    @RequestMapping(value = "addGroup",method =RequestMethod.GET)
    public ModelAndView addGroup(ModelAndView modelAndView) {
        modelAndView.setViewName("userinfo/addGroup");
        return modelAndView;
    }
    @RequestMapping(value = "addGroupToDB",method =RequestMethod.POST)
    public ModelAndView addGroupToDB(ModelAndView modelAndView,String groName,String subNum) {
        modelAndView.setViewName("userinfo/groupmain");
        String message="";
        try{
            SubjectGroup subjectGroup=new SubjectGroup(0,groName,Integer.parseInt(subNum));
            if(!GroupDao.addSubjectGroup(subjectGroup)){
                //modelAndView.setViewName("sbjman/msg");
                message="Insert Fail:Already exist";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("userinfo/error");
            message="增加失败: "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getMainPage(modelAndView,"1");
    }
    @RequestMapping(value = "changeGroup",method =RequestMethod.GET)
    public ModelAndView changeGroup(ModelAndView modelAndView,String name) {
        SubjectGroup subjectGroup=GroupDao.getSubjectGroupByName(name);
        modelAndView.addObject(subjectGroup);
        modelAndView.setViewName("/userinfo/changeGroup");
        return modelAndView;
    }
    @RequestMapping(value = "updateGroupToDB",method = RequestMethod.POST)
    public ModelAndView updateGroupToDB(ModelAndView modelAndView,String groName,String subNum,String oldname){
        modelAndView.setViewName("userinfo/groupmain");
        String message="";
        try{
            SubjectGroup subjectGroup=new SubjectGroup(0,groName,Integer.parseInt(subNum));
            GroupDao.deleteSubjectGroupByName(oldname);
            if(!GroupDao.isExist(groName)) {
                GroupDao.addSubjectGroup(subjectGroup);
            }else{
                message = "该用户名已经存在";
                modelAndView.addObject("message", message);
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("userinfo/error");
            message="更改失败！ "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        return getMainPage(modelAndView,"1");
    }
    @RequestMapping(value = "deleteGroup",method = {RequestMethod.GET})
    public ModelAndView deleteGroup(ModelAndView modelAndView,String name){
        if(!GroupDao.isExist(name)){
            modelAndView.setViewName("userinfo/groupmain");
            modelAndView.addObject("message","该用户名不存在 :"+name);
            return modelAndView;
        }
        GroupDao.deleteSubjectGroupByName(name);
        return getMainPage(modelAndView,"1");
    }
}
