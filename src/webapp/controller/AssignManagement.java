package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/quotaman")
public class AssignManagement {

    @RequestMapping(method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getPage(ModelAndView modelAndView){
        return modelAndView;
    }

    @RequestMapping(value = "/recomquota")
    public ModelAndView recomquota (ModelAndView modelAndView){
        modelAndView.setViewName("/quotaman/recomquota");
        return modelAndView;
    }

    @RequestMapping(value = "/firstquota")
    public ModelAndView firstquota (ModelAndView modelAndView){
        modelAndView.setViewName("/quotaman/firstquota");
        return modelAndView;
    }

    @RequestMapping(value = "/finalquota")
    public ModelAndView finalquota (ModelAndView modelAndView){
        modelAndView.setViewName("/quotaman/finalquota");
        return modelAndView;
    }

}
