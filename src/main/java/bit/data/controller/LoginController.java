package bit.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;
import util.SHA256Util;

@Controller
public class LoginController {
	
	@Autowired
	UserServiceInter userService;
	
	@GetMapping("/loginmain")
	public String userlogin() {
		  
	      return "/bit/login/login";
	   }
	
	@GetMapping("/login")
	@ResponseBody
	public Map<String, String> loginprocess(String id,String pass,HttpSession session)
	{
		Map<String, String> map=new HashMap<String, String>();
		UserDto dto = userService.getDataById(id);
		String salt=dto.getSalt();
		int result=0;
		if(salt==null) {
			 result=userService.getIdPassCheck(id, pass);
		}else {
			String user_pw = SHA256Util.getEncrypt(pass, salt);
			 result=userService.getIdPassCheck(id, user_pw);
		}
				
		if(result==1)//아이디와 패스가 모두 맞는 경우 
		{
			//유지 시간 설정
			session.setMaxInactiveInterval(60*60*4);//4시간
			//로그인한 아이디에 대한 정보를 얻어서 세션에 저장
			UserDto udto=userService.getDataById(id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("loginid", id);
			session.setAttribute("loginname", udto.getNickname());
			session.setAttribute("loginphoto", udto.getProfileImage());
			
		}
		map.put("result", result==1?"success":"fail");
		return map;
		
	}
	@GetMapping("/logout")
	public String logout(HttpSession session)
	{
		//로그아웃이 제거되어야할 세션
		session.removeAttribute("loginok");
		session.removeAttribute("loginid");
		
		return "/bit/main/main";
	}

}