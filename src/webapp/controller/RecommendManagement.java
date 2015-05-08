package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping(value = "/citysciassoc")
    public ModelAndView citysciassoc (ModelAndView modelAndView){
        modelAndView.setViewName("/departman/citysciassoc");
        return modelAndView;
    }


    @RequestMapping(value = "/sciassoc")
    public ModelAndView sciassoc (ModelAndView modelAndView){
        modelAndView.setViewName("/departman/sciassoc");
        return modelAndView;
    }


    @RequestMapping(value = "/engassoc")
    public ModelAndView engassoc (ModelAndView modelAndView){
        modelAndView.setViewName("/departman/engassoc");
        return modelAndView;
    }


    @RequestMapping(value = "/agriassoc")
    public ModelAndView agriassoc (ModelAndView modelAndView){
        modelAndView.setViewName("/departman/agriassoc");
        return modelAndView;
    }


    @RequestMapping(value = "/mediassoc")
    public ModelAndView mediassoc (ModelAndView modelAndView){
        modelAndView.setViewName("/departman/mediassoc");
        return modelAndView;
    }


    @RequestMapping(value = "/crossassoc")
    public ModelAndView crossassoc (ModelAndView modelAndView){
        modelAndView.setViewName("/departman/crossassoc");
        return modelAndView;
    }


}
