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
    @RequestMapping(value = "searchUnits",method = {RequestMethod.GET,RequestMethod.POST})
     public ModelAndView getSearchPage(ModelAndView modelAndView,String recID){
        ProposerDao proposerDao=new ProposerDaoImpl();
        modelAndView.setViewName("departman/searchUnits");
        ArrayList<Proposer> proposers=proposerDao.getProposerByRecID(Integer.parseInt(recID));
        modelAndView.addObject("proposers",proposers);
        return modelAndView;
    }
    @RequestMapping(value = "/citysciassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView citysciassoc (ModelAndView modelAndView){
        modelAndView.setViewName("/departman/citysciassoc");
        return modelAndView;

    }


    @RequestMapping(value = "/sciassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView sciassoc (ModelAndView modelAndView){
        modelAndView.setViewName("/departman/sciassoc");
        return modelAndView;
    }


    @RequestMapping(value = "/engassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView engassoc (ModelAndView modelAndView){
        modelAndView.setViewName("/departman/engassoc");
        return modelAndView;
    }


    @RequestMapping(value = "/agriassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView agriassoc (ModelAndView modelAndView){
        modelAndView.setViewName("/departman/agriassoc");
        return modelAndView;
    }


    @RequestMapping(value = "/mediassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView mediassoc (ModelAndView modelAndView){
        return modelAndView;
    }


    @RequestMapping(value = "/crossassoc",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView crossassoc (ModelAndView modelAndView){
        return modelAndView;
    }
    @RequestMapping(value = "/searchUnit",method = {RequestMethod.POST})
    public ModelAndView  ResUnits(ModelAndView modelAndView,String unitName){
        System.out.println(unitName);
        ResUnitsDao resUnitsDao=new ResUnitsDaoImpl();
        modelAndView.setViewName("departman/searchUnit");
        Units units=resUnitsDao.getUnitsByName(unitName);
        ArrayList<Units> unitses=new ArrayList<Units>();
        unitses.add(units);
        modelAndView.addObject("unitses",unitses);
        return modelAndView;
    }

}
