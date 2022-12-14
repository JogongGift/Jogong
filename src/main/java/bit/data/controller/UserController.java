package bit.data.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.data.dto.QnaDto;
import bit.data.dto.UserDto;
import bit.data.service.UserServiceInter;

@Controller
public class UserController {
	
	@Autowired
	UserServiceInter userServiceInter;
	
	@PostMapping("/user/friendData")
	@ResponseBody
	public List<UserDto> selectFriendData(
	        @RequestBody HashMap<String,Object> param) {
	    
	    Map<String,Object> map = (HashMap<String, Object>) param.get("data");
	    
		return userServiceInter.selectFriendData(map);
	}
	
	@PostMapping("/user/friendRequest")
	@ResponseBody
	public List<UserDto> selectFreindRequest(
	        @RequestBody HashMap<String,Object> param) {
	    
	    Map<String,Object> map = (HashMap<String, Object>) param.get("data");
	    
	    return userServiceInter.selectFreindRequest(map);
	}
	
	@PostMapping("/user/friendCount")
	@ResponseBody
	public int getUserFriendCount(
	        @RequestBody HashMap<String,Object> param) {
	    
	    HashMap<String,Object> map = (HashMap<String, Object>) param.get("data");
	    
		return userServiceInter.getUserFriendCount(map);
	}
	
	@GetMapping("/mypage/cart")
	public String cartList() {
	    return "/mypage/mypage/cart";
	}
	

    @GetMapping("/mypage/user")
    public String userPage(HttpSession session,Model model) {
    	String email = (String) session.getAttribute("loginid");
    	UserDto list= userServiceInter.getDataById(email);
    	model.addAttribute("list", list);
    	model.addAttribute("birthday", list.getDate().length()==3?"0"+list.getDate():list.getDate());

    	if(list.getAddress()!=null) {
    		model.addAttribute("addressNumber", list.getAddress().substring(0, 5));
    		model.addAttribute("address", list.getAddress().substring(5));
    	}
    	
        return "/mypage/mypage/user";
    }
    
    @GetMapping("/mypage/qna")
    public String qnaPage(Model model, HttpSession session) {
    	
    	int userNum;
    	
    	//user ????????? (??????????????? ??????)
    	if(session.getAttribute("loginUserNum")!=null) {
    		
    		userNum=(int) session.getAttribute("loginUserNum");
    		
		//seller ?????????
    	} else {
    		
    		userNum=0;
    	}
    	
    	//userNum ??? ????????? qnaList ????????????
		List<QnaDto> qnaList=userServiceInter.getQnaList(userNum);
		
		//model??? ?????? ??????
		model.addAttribute("qnaList",qnaList);
    	
        return "/mypage/mypage/qna";
    }
    
    
    @GetMapping("/user/review")
	@ResponseBody
	public List<UserDto> getReviewUserInfo(){
		
		return userServiceInter.getReviewUserInfo();
	}
	
    // ????????? ?????? ?????? ??????
	@PostMapping("/user/nonFriend")
	@ResponseBody
	public List<UserDto> selectNonFriendlyUsersList(
	        @RequestBody HashMap<String,Object> param) {
	        
	    Map<String,Object> map = (HashMap<String, Object>) param.get("data");
	        
	    return userServiceInter.selectNonFriendlyUsersList(map);
	}
	
    // ????????????
    @PostMapping("/user/insertFriend")
    public String insertFriend(
            @RequestBody HashMap<String,Object> params) {
        
        HashMap<String,Object> map = new HashMap<String,Object>();
        
        List<Map<String,Object>> list = (List<Map<String,Object>>) params.get("list");
        
        map.put("list" , list);
        
        userServiceInter.insertFriend(map);
        
        return "/mypage/mypage/friend";
    }
    
    // ????????????
    @PostMapping("/user/deleteFriend")
    public String deleteFriend(
            @RequestBody HashMap<String,Object> param) {
        
        HashMap<String,Object> map = (HashMap<String,Object>) param.get("data");
        
        System.out.println(map.get("userNum"));
        System.out.println(map.get("friendNum"));
        
        userServiceInter.deleteFriend(map);
        
        return "/mypage/mypage/friend";
    }
    
    // ????????????
    @PostMapping("/user/updateFriend")
    public String updateFriend(
            @RequestBody HashMap<String,Object> param) {
        
        HashMap<String,Object> map = (HashMap<String,Object>) param.get("data");
        
        System.out.println(map.get("userNum"));
        System.out.println(map.get("friendNum"));
        
        userServiceInter.updateFriend(map);
        
        return "/mypage/mypage/friend";
    }
    
    // ?????? ?????? ??????
    @GetMapping("/user/data")
    @ResponseBody
    public UserDto selectUser(int userNum) {
        return userServiceInter.selectUser(userNum);
    }
}



