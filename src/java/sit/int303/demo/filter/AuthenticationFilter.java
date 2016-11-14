/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int303.demo.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author int303
 */
public class AuthenticationFilter implements Filter {

    FilterConfig config ;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        config = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) request).getSession(false);
        System.out.println(((HttpServletRequest) request).getHeader("referer"));
        if (session == null || session.getAttribute("user")==null) {
            String target = ((HttpServletRequest) request).getRequestURI();
            int secondSlashPos = target.indexOf("/", 1);
            target = target.substring(secondSlashPos);
            System.out.println("Target, Filter: "+target);
            request.getRequestDispatcher("/Login?target="+target).forward(request, response);
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }
    
}
