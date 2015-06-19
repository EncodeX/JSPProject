package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import webapp.dao.ProposerDao;
import webapp.dao.ResUnitsDao;
import webapp.dao.impl.ProposerDaoImpl;
import webapp.dao.impl.ResUnitsDaoImpl;
import webapp.model.Proposer;
import webapp.model.Units;

import java.util.ArrayList;

import static webapp.dao.ResUnitsDao.*;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/departman")
public class RecommendManagement {

    @RequestMapping(method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getPage(ModelAndView modelAndView){
        return modelAndView;
    }

    @RequestMapping(value = "main",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getMainPage(ModelAndView modelAndView,String page){
    ResUnitsDao ResUnitsDao=new ResUnitsDaoImpl();
        ProposerDao ProposerDao=new ProposerDaoImpl();

            int pages;
            if(page==null){
                pages=1;
            }else{
                pages=Integer.parseInt(page);
        }
      //  System.out.println(recID);
        modelAndView.setViewName("departman/main");
      //  ArrayList<Proposer> proposers=proposerDao.getProposerByRecID(recID);
        ArrayList<Units> units=ResUnitsDao.getAllUnits(pages,10);
        int proposerNum=ProposerDao.getProposerAmount();
        modelAndView.addObject("proposerNum",proposerNum);
    //    modelAndView.addObject("proposers",proposers);
        modelAndView.addObject("units",units);
        modelAndView.addObject("pages", pages);
        modelAndView.addObject("amount",ResUnitsDao.getUnitsAmount());


        return modelAndView;
    }
    @RequestMapping(value = "/searchUnits",method = {RequestMethod.GET,RequestMethod.POST})
     public ModelAndView getSearchPage(ModelAndView modelAndView,String recID){
        System.out.println("\nin\n");
        ProposerDao proposerDao=new ProposerDaoImpl();
        System.out.println(recID);
        modelAndView.setViewName("departman/searchUnits");
        System.out.println(recID);
        ArrayList<Proposer> proposers=proposerDao.getProposerByRecID(Integer.parseInt(recID));
        modelAndView.addObject("proposers",proposers);
        return modelAndView;
    }
    @RequestMapping(value = "/citysciassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView citysciassoc (ModelAndView modelAndView){
        ResUnitsDao resUnitsDao=new ResUnitsDaoImpl();
        modelAndView.setViewName("/departman/citysciassoc");
        ArrayList<Units> unitses=resUnitsDao.getAllUnitsName();
        //    System.out.println(unitses.toString());
        modelAndView.addObject("unitses", unitses);
        return modelAndView;

    }


    @RequestMapping(value = "/sciassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView sciassoc (ModelAndView modelAndView){
        ResUnitsDao resUnitsDao=new ResUnitsDaoImpl();
        modelAndView.setViewName("/departman/sciassoc");
        ArrayList<Units> unitses=resUnitsDao.getAllUnitsName();
        //    System.out.println(unitses.toString());
        modelAndView.addObject("unitses", unitses);
        return modelAndView;
    }


    @RequestMapping(value = "/engassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView engassoc (ModelAndView modelAndView){

        ResUnitsDao resUnitsDao=new ResUnitsDaoImpl();
        modelAndView.setViewName("/departman/engassoc");
        ArrayList<Units> unitses=resUnitsDao.getAllUnitsName();
        //    System.out.println(unitses.toString());
        modelAndView.addObject("unitses", unitses);
        return modelAndView;
    }


    @RequestMapping(value = "/agriassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView agriassoc (ModelAndView modelAndView){
        ResUnitsDao resUnitsDao=new ResUnitsDaoImpl();
        modelAndView.setViewName("/departman/agriassoc");
        ArrayList<Units> unitses=resUnitsDao.getAllUnitsName();
    //    System.out.println(unitses.toString());
        modelAndView.addObject("unitses", unitses);
        return modelAndView;

    }


    @RequestMapping(value = "/mediassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView mediassoc (ModelAndView modelAndView){
        ResUnitsDao resUnitsDao=new ResUnitsDaoImpl();
        modelAndView.setViewName("/departman/mediassoc");
        ArrayList<Units> unitses=resUnitsDao.getAllUnitsName();
        //    System.out.println(unitses.toString());
        modelAndView.addObject("unitses", unitses);
        return modelAndView;
    }


    @RequestMapping(value = "/crossassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView crossassoc (ModelAndView modelAndView){
        ResUnitsDao resUnitsDao=new ResUnitsDaoImpl();
        modelAndView.setViewName("/departman/crossassoc");
        ArrayList<Units> unitses=resUnitsDao.getAllUnitsName();
        //    System.out.println(unitses.toString());
        modelAndView.addObject("unitses", unitses);
        return modelAndView;
    }
    @RequestMapping(value = "/searchUnit",method = {RequestMethod.POST})
    public ModelAndView  ResUnits(ModelAndView modelAndView,String unitName,String bigclass){
       if(unitName.equals("所有小类")){

           ResUnitsDao resUnitsDao=new ResUnitsDaoImpl();
           modelAndView.setViewName("departman/searchallUnits");
           ArrayList<Units> unitses=new ArrayList<Units>();
           System.out.println(unitName+bigclass);
           if(bigclass.equals("市科协")){unitses=resUnitsDao.getPartUnits(0,14);}
           if(bigclass.equals("理科学会")){unitses=resUnitsDao.getPartUnits(14,16);}
           if(bigclass.equals("工科学会")){unitses=resUnitsDao.getPartUnits(30,40);}
           if(bigclass.equals("农林学会")){unitses=resUnitsDao.getPartUnits(71,14);}
           if(bigclass.equals("医疗学会")){unitses=resUnitsDao.getPartUnits(85,26);}
           if(bigclass.equals("交叉学科学会")){unitses=resUnitsDao.getPartUnits(111,30);}
System.out.println(unitses.size());




           modelAndView.addObject("unitses",unitses);

       }
        else
        {
            System.out.println(bigclass+" "+unitName);
        ResUnitsDao resUnitsDao = new ResUnitsDaoImpl();
        modelAndView.setViewName("departman/searchUnit");
        Units units=resUnitsDao.getUnitsByName(unitName);
        ArrayList<Units> unitses=new ArrayList<Units>();
        unitses.add(units);
            System.out.println(unitses.size());
        modelAndView.addObject("unitses",unitses);
            return modelAndView;
        }
        return modelAndView;
    }

}
