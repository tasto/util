/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

/**
 *
 * @author tasto
 */
public class HelloService {
    // HelloServeiceをapplicationContext.xmlに以下記載で登録する
    // <bean name="helloService" class="service.HelloService" />
    public static String sayHello(String name) {
        return "Hello " + name + "!";
    }
}
