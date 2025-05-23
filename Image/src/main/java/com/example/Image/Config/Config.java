package com.example.Image.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class Config implements WebMvcConfigurer {
	
	@Configuration
	public class WebConfig implements WebMvcConfigurer {
		
//public void addResourceHandlers(ResourceHandlerRegistry registry)
		//this method handle ResourceHandlerRegistry & risponsible to serve image on frontend 

	    @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry.addResourceHandler("/uploads/image/**")
	                .addResourceLocations("file:" + System.getProperty("user.dir") + "/uploads/image/");
	    }
	}
//registry.addResourceHandler("/uploads/image/**")  mins the url what ever we browse from html, get this with the /uploads/image/** here ** is file name  

//.addResourceLocations("file:" + System.getProperty("user.dir") + "/uploads/image/"); its searching your photo from your current dir here ("user.dir") its your current project path,  
	//make sure this path and your image saving path must be same 
}
