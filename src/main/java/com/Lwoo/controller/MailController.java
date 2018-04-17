package com.Lwoo.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Lwoo.pojo.MailBean;
import com.Lwoo.pojo.User;
import com.Lwoo.service.UserService;

@Controller
@RequestMapping("")
public class MailController {
	 @Autowired  
	 private JavaMailSenderImpl javaMailSenderImpl; 
	 @Autowired
	 private UserService userService;
	 
	 
	 public MimeMessage createMimeMessage(MailBean mailBean) throws MessagingException, UnsupportedEncodingException{  
	        MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();  
	        mimeMessage.addRecipients(Message.RecipientType.CC, InternetAddress.parse(mailBean.getFrom()));
	        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");  
	        messageHelper.setFrom(mailBean.getFrom(), mailBean.getFromName());
	        messageHelper.setSubject(mailBean.getSubject());   //主题 
	        messageHelper.setTo(mailBean.getToEmails());//收件人    
	        messageHelper.setText(mailBean.getContext(), true); // html: true 内容  
	        return mimeMessage;  
	    }  
	   public void sendMail(MailBean mailBean) throws UnsupportedEncodingException, MessagingException{  
	        MimeMessage msg = createMimeMessage(mailBean);  
	        javaMailSenderImpl.send(msg);  
	   }
	   @RequestMapping("senderEmail")
	   @ResponseBody
		public Map<String, String> forget(@RequestBody Map<String, String> map,HttpSession httpSession){
		   		String email=map.get("email");
		   		String validData=getThree();
		   		httpSession.setAttribute("validData", validData);
		   		httpSession.setMaxInactiveInterval(1800);//保存时间30分钟
		   		String result="false";
		   		System.out.println("=======-email"+email+"--"+validData);
			  	MailBean mailBean = new MailBean();  
		        mailBean.setFrom("18826237334@163.com");  
		        mailBean.setFromName("学生社团联合会");  
		        mailBean.setSubject("你好!");  
		        mailBean.setToEmails(new String[]{email}); 
		        mailBean.setContext("<div style='font-size: 1px; color: #ffffff;'>成功！您的 Verification code 验证码如下。</div><font>学生社团联合会，验证码"+validData+"</font>");  //获取验证码
		        System.out.println("Mail------"+mailBean);
		        try {
					sendMail(mailBean);
					result="true";
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        Map<String, String> rel=new HashMap<String,String>();
		        rel.put("result", result);
			return rel;
			
		}
	   @RequestMapping("validData")
	   @ResponseBody
		public Map<String, String> valid(@RequestBody Map<String, String> map,HttpSession httpSession){
		   		String valid=map.get("valid");
		   		String svalid=(String) httpSession.getAttribute("validData");
		   		System.out.println(svalid+"--------------"+valid);
		   		String result="false";
		   		if(valid.equals(svalid)){
		   			result="true";
		   		}
		        Map<String, String> rel=new HashMap<String,String>();
		        rel.put("result", result);
			return rel;
			
		}
		 @RequestMapping("changeUserPassword")
		   @ResponseBody
			public Map<String, String> changeUserPassword(@RequestBody Map<String, String> map,HttpSession httpSession){
			 String result="false";
			   		String email=map.get("email");
			   		String username=map.get("username");
			   		String password=map.get("password");
			   		System.out.println("-----"+email+"-----"+username+"---"+password);
			   		User user=userService.findByUsername(username);
			   		user.setPassword(password);
			   		userService.update(user);
			   		result="true";
			        Map<String, String> rel=new HashMap<String,String>();
			        rel.put("result", result);
				return rel;
				
			}
			 @RequestMapping("checkUserEmail")
			   @ResponseBody
				public Map<String, String> checkUserEmail(@RequestBody Map<String, String> map){
				   		String username=map.get("username");
				   		String emial=map.get("email");
				   		System.out.println(username+"--------------"+emial);
				   		User user=userService.findByUsername(username);
				   		String result="false";
				   		if(user.getEmail().equals(emial)){
				   			result="true";
				   		}
				   			
				        Map<String, String> rel=new HashMap<String,String>();
				        rel.put("result", result);
					return rel;
					
				}
	   /** 
	     * 产生随机的六位数 
	     * @return 
	     */  
	    public static String getThree(){  
	        Random rad=new Random();  
	        return rad.nextInt(1000000)+"";  
	    }  
}
