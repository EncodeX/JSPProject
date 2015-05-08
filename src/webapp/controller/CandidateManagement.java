package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/candman")
public class CandidateManagement {

    @RequestMapping(method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getPage(ModelAndView modelAndView){
        return modelAndView;
    }

    @RequestMapping(value = "/sbjman")
    public ModelAndView sbjMan (ModelAndView modelAndView){
        modelAndView.setViewName("/candman/sbjman");
        return modelAndView;
    }

    @RequestMapping(value = "/firstresult")
    public ModelAndView firstresult (ModelAndView modelAndView){
        modelAndView.setViewName("/candman/firstresult");
        return modelAndView;
    }

    @RequestMapping(value = "/finalresult")
    public ModelAndView finalresult (ModelAndView modelAndView){
        modelAndView.setViewName("/candman/finalresult");
        return modelAndView;
    }
}
