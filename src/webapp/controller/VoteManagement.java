package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/voteman")
public class VoteManagement {

    @RequestMapping(method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getPage(ModelAndView modelAndView){
        return modelAndView;
    }

    @RequestMapping(value = "/provote")
    public ModelAndView provote (ModelAndView modelAndView){
        modelAndView.setViewName("/voteman/provote");
        return modelAndView;
    }

    @RequestMapping(value = "/councilvote")
    public ModelAndView councilvote (ModelAndView modelAndView){
        modelAndView.setViewName("/voteman/councilvote");
        return modelAndView;
    }
}
