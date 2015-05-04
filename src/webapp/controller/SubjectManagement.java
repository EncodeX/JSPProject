package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/sbjman")
public class SubjectManagement {

    @RequestMapping(value = "main",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getMainPage(ModelAndView modelAndView){
        modelAndView.setViewName("sbjman/main");
        return modelAndView;
    }
}
