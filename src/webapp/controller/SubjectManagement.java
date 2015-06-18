package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import webapp.dao.GroupDao;
import webapp.dao.ProposerDao;
import webapp.dao.impl.GroupDaoImpl;
import webapp.dao.impl.ProposerDaoImpl;
import webapp.model.Proposer;
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
    public ModelAndView getMainPage(ModelAndView modelAndView,String page){
        int intpage;
        if(page==null){
            intpage=1;
        }else{
            intpage=Integer.parseInt(page);
        }

        modelAndView.setViewName("sbjman/main");
        ArrayList<SubjectGroup> subjectGroups=groupDao.getAllSubjectGroup(intpage,10);

        modelAndView.addObject("subjectGroups",subjectGroups);


        modelAndView.addObject("amount", groupDao.getGroupAmount());
        modelAndView.addObject("pages",intpage);
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
        return getMainPage(modelAndView,"1");
    }

    @RequestMapping(value = "toChangeSubjectGroup",method = {RequestMethod.GET})
    public ModelAndView toChangeSubjectGroup(ModelAndView modelAndView,String name){
                System.out.println(name);
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

    @RequestMapping(value = "addSubjectGroup",method = {RequestMethod.POST,RequestMethod.GET})
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
        return getMainPage(modelAndView,"1");
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
        return getMainPage(modelAndView,"1");
    }
}
