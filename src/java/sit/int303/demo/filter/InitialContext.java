/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int303.demo.filter;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author int303
 */
public class InitialContext implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String ctxName = sce.getServletContext().getServletContextName();
        sce.getServletContext().setAttribute("ctx", ctxName);
        System.out.println("Context: "+ ctxName);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
