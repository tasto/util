/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jp.operation.check;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 *
 * @author t.kawamata.ez
 */
@Controller
public class OpeCheckController {
    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String showMessage(Model model) {
        model.addAttribute("message", "hello world!!");
        return "showMessage";
    }

    @RequestMapping(value = "/show", method = RequestMethod.POST)
    public String showMessagePost(Model model) {
        model.addAttribute("message", "hello world!!");
        return "showMessage";
    }
}
