package com.example.servergateway.controller;

//import org.apache.coyote.Response;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FallbackController {

    /*@GetMapping("/fallbackA")
    public Response fallbackA() {
        Response response = new Response();
        //response.setCode("100");
        response.setStatus(100);
        response.setMessage("服务暂时不可用");
        return response;
    }*/

}
