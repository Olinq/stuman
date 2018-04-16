package com.Lwoo.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Lwoo.pojo.MailBean;

@Controller
@RequestMapping("")
public class MailController {
	 @Autowired  
	 private JavaMailSenderImpl javaMailSenderImpl;  
	 public MimeMessage createMimeMessage(MailBean mailBean) throws MessagingException, UnsupportedEncodingException{  
	        MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();  
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
		public Map<String, String> forget(@RequestBody Map<String, String> map){
		   		String email=map.get("email");
		   		String validData=getThree();
		   		String result="true";
		   		System.out.println("=======-email"+email+"--"+validData);
			  	MailBean mailBean = new MailBean();  
		        mailBean.setFrom("18826237334@163.com");  
		        mailBean.setFromName("学生社团联合会");  
		        mailBean.setSubject("你好");  
		        mailBean.setToEmails(new String[]{email}); 
		        mailBean.setContext("学生社团网站：验证码<font color='blue'>"+validData+"</font>");  //获取验证码
		        System.out.println("Mail------"+mailBean);
		        try {
					sendMail(mailBean);
					
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					result="false";
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					result="false";
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
