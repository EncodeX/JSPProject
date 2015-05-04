package webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by zz on 2015/4/28.
 */
@Controller
@RequestMapping("/sysman")
public class SystemManagement {


    @RequestMapping(value = "main",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView getMainPage(ModelAndView modelAndView){
        modelAndView.setViewName("sysman/main");
        return modelAndView;
    }
}