package com.zrg.ixd.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zrg.ixd.bean.User;
import com.zrg.ixd.service.UserService;
import com.zrg.ixd.util.Msg;

@Controller
public class TestController {
	@Autowired
	UserService userService;
	
	/**
	 * 测试登...
	 * @param u
	 * @return
	 */
	@RequestMapping("/testZrg")
	@ResponseBody //加上这个 处理异步 美滋滋
	public Msg userRegist(User u) {

		System.out.println("异步来了2....");
		
		System.out.println(u.getUname());
		String utname=u.getUname().trim();
	
		if("账户名".equals(utname)) {
			//自定义失败类型...
			System.out.println("fail");
			 return Msg.fail();
		}
		 return Msg.success();
	}

	
	@RequestMapping("/user2Test")
	public String user2Test(User u) {

		System.out.println("跳转....");
		
		
	
		 return "test";
	}

	
	 @RequestMapping(value="/uplordImg",method=RequestMethod.POST)  
	    @ResponseBody  
	    public Msg uploadXXX(MultipartFile file,HttpServletRequest request) throws IOException{  
		 System.out.println("至少到这里来了..");
	        String path = request.getSession().getServletContext().getRealPath("upload");  
	        System.out.println("path"+path);
	        String fileName = file.getOriginalFilename();  
	        System.out.println("fileName"+fileName);
	     
	       /**
	        * 这里这能先这样写死
	        */
	        
	        File dir = new File("D:\\Workspaces\\Eclipes2018\\ssmDemo\\src\\main\\webapp\\upload",fileName);          
	        if(!dir.exists()){  
	            dir.mkdirs();  
	        }  
	        //MultipartFile自带的解析方法  
	        file.transferTo(dir);  
	        return Msg.success();  
	    }
	    
	
}
