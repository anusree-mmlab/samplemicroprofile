package com.tm.demo;

import javax.inject.Singleton;
import javax.ws.rs.GET;
import javax.ws.rs.Path;

/**
 *
 */
@Path("/hello")
@Singleton
public class HelloController {

    @GET
    public String sayHello() {
        return "Hello feb 18 - 8:30 PM";
    }
}
