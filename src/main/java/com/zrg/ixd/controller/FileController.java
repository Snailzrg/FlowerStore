package com.zrg.ixd.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zrg.ixd.bean.User;
import com.zrg.ixd.service.UserService;
import com.zrg.ixd.util.Msg;

@Controller
public class FileController {

	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/uploadHeadPicParmas", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Msg uploadHeadPicpas(@RequestParam(value="canshu1") String  canhs,@RequestParam() MultipartFile file, HttpSession session,HttpServletRequest request) {
		// 在这里面文件存储的方案一般是：收到文件→获取文件名→在本地存储目录建立防重名文件→写入文件→返回成功信息
		// 如果上面的步骤中在结束前任意一步失败，那就直接失败了。
		System.out.println("tupianshangchaun1g.."+canhs);
		User u = (User) session.getAttribute("User");
		if (u == null) {
			return Msg.fail().add("msg", "用户不存在");
		}
		String imgg=u.getUimg();
		if (null == file || file.isEmpty()) {
			return Msg.fail().add("msg", "文件不能为空").add("imgold", imgg);

		} else {
			// 创建一个文件夹，网上代码很多
			 String path = request.getSession().getServletContext().getRealPath("userImg");  
		        System.out.println("上传路径path"+path);
		        String fileName = file.getOriginalFilename();  
		        System.out.println("图片名称 images/userImg"+fileName);		     
		       /**
		        * 这里这能先这样写死
		        */		       
		        File dir = new File("D:\\Workspaces\\Eclipes2018\\FlowerStore\\src\\main\\webapp\\images\\userImg",fileName);          
		        if(!dir.exists()){  
		            dir.mkdirs();  
		        }  
		      
		        try {
		        	 //MultipartFile自带的解析方法 
					file.transferTo(dir);
					u.setUimg("images/userImg/"+fileName);
					//改变数据库...
					userService.updateUser(u);
					 return Msg.success();  
				}  catch (Exception e) {
					// TODO Auto-generated catch block
					 e.printStackTrace();
					 return Msg.success().add("msg", "上传失败").add("imgold", imgg);  
				}  

		//	String url = new FileUtil().createImageDir( String.valueOf(2)); 暂时写死*/
		
		}
	}
	
	
	@RequestMapping(value = "/uploadHeadPic", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public Msg uploadHeadPic(@RequestParam() MultipartFile file, HttpSession session,HttpServletRequest request) {
		// 在这里面文件存储的方案一般是：收到文件→获取文件名→在本地存储目录建立防重名文件→写入文件→返回成功信息
		// 如果上面的步骤中在结束前任意一步失败，那就直接失败了。
		System.out.println("tupianshangchaun1g..");
		User u = (User) session.getAttribute("User");
		if (u == null) {
			return Msg.fail().add("msg", "用户不存在");
		}
		String imgg=u.getUimg();
		if (null == file || file.isEmpty()) {
			return Msg.fail().add("msg", "文件不能为空").add("imgold", imgg);

		} else {
			// 创建一个文件夹，网上代码很多
			 String path = request.getSession().getServletContext().getRealPath("userImg");  
		        System.out.println("上传路径path"+path);
		        String fileName = file.getOriginalFilename();  
		        System.out.println("图片名称 images/userImg"+fileName);		     
		       /**
		        * 这里这能先这样写死
		        */		       
		        File dir = new File("D:\\Workspaces\\Eclipes2018\\FlowerStore\\src\\main\\webapp\\images\\userImg",fileName);          
		        if(!dir.exists()){  
		            dir.mkdirs();  
		        }  
		      
		        try {
		        	 //MultipartFile自带的解析方法 
					file.transferTo(dir);
					u.setUimg("images/userImg/"+fileName);
					//改变数据库...
					userService.updateUser(u);
					 return Msg.success();  
				}  catch (Exception e) {
					// TODO Auto-generated catch block
					 e.printStackTrace();
					 return Msg.success().add("msg", "上传失败").add("imgold", imgg);  
				}  

		//	String url = new FileUtil().createImageDir( String.valueOf(2)); 暂时写死*/
		
		}
	}
}
