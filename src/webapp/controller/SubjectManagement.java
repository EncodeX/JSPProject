package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import webapp.dao.GroupDao;
import webapp.dao.impl.GroupDaoImpl;
import webapp.model.SubjectGroup;

import java.util.*;
/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/sbjman")
public class SubjectManagement {

    GroupDao groupDao=new GroupDaoImpl();

    @RequestMapping(value = "main",method = {RequestMethod.GET})
    public ModelAndView getMainPage(ModelAndView modelAndView){
        modelAndView.setViewName("sbjman/main");
        ArrayList<SubjectGroup> subjectGroups=groupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        return modelAndView;
    }

    @RequestMapping(value = "toAddSubjectGroup",method = {RequestMethod.GET})
    public ModelAndView toAddSubjectGroup(ModelAndView modelAndView){
        modelAndView.setViewName("sbjman/addsubjectgroup");
        return modelAndView;
    }

    @RequestMapping(value = "deleteSubjectGroup",method = {RequestMethod.GET})
    public ModelAndView deleteSubjectGroup(ModelAndView modelAndView,String name){
        if(!groupDao.isExist(name)){
            modelAndView.setViewName("sbjman/msg");
            modelAndView.addObject("message","Failed: No name exist :"+name);
            return modelAndView;
        }
        groupDao.deleteSubjectGroupByName(name);
        ArrayList<SubjectGroup> subjectGroups=groupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        modelAndView.setViewName("sbjman/main");
        return modelAndView;
    }

    @RequestMapping(value = "toChangeSubjectGroup",method = {RequestMethod.GET})
    public ModelAndView toChangeSubjectGroup(ModelAndView modelAndView,String name){
        if(!groupDao.isExist(name)){
            modelAndView.setViewName("sbjman/msg");
            modelAndView.addObject("message","Failed: No name exist :"+name);
            return modelAndView;
        }
        SubjectGroup subjectGroup=groupDao.getSubjectGroupByName(name);
        modelAndView.addObject(subjectGroup);

        modelAndView.setViewName("sbjman/changesubjectgroup");
        return modelAndView;
    }

    @RequestMapping(value = "addSubjectGroup",method = RequestMethod.POST)
    public ModelAndView addSubjectGroup(ModelAndView modelAndView,String groName,String subNum){
        modelAndView.setViewName("sbjman/main");
        String message="";
        try{
            SubjectGroup subjectGroup=new SubjectGroup(0,groName,Integer.parseInt(subNum));
            if(!groupDao.addSubjectGroup(subjectGroup)){
                modelAndView.setViewName("sbjman/msg");
                message="Insert Fail:Already exist";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("sbjman/msg");
            message="Insert Fail:->Format error: "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        ArrayList<SubjectGroup> subjectGroups=groupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        return modelAndView;
    }

    @RequestMapping(value = "changeSubjectGroup",method = RequestMethod.POST)
    public ModelAndView changeSubjectGroup(ModelAndView modelAndView,String groName,String subNum,String oldname){
        modelAndView.setViewName("sbjman/main");
        String message="";
        try{
            SubjectGroup subjectGroup=new SubjectGroup(0,groName,Integer.parseInt(subNum));
            groupDao.deleteSubjectGroupByName(oldname);
            if(!groupDao.addSubjectGroup(subjectGroup)){
                modelAndView.setViewName("sbjman/msg");
                message="Insert Fail:Already exist";
                modelAndView.addObject("message",message);
                return modelAndView;
            }
        }catch (Exception e){
            modelAndView.setViewName("sbjman/msg");
            message="Insert Fail:->Format error: "+e.toString();
            modelAndView.addObject("message",message);
            return modelAndView;
        }
        ArrayList<SubjectGroup> subjectGroups=groupDao.getAllSubjectGroup();
        modelAndView.addObject("subjectGroups",subjectGroups);
        return modelAndView;
    }
}
