/*=====================================================================
	UserController01.java 
	- 사용자 정의 컨트롤러 클래스
	
	- 데이터베이스의 리스트를 읽어오는 액션 처리
	- 『memberlist.action』 → 요청 → memberList() 처리
	
	- 데이터 입력(회원 등록)폼 요청 관련 액션 처리
	- 『memberinsertform.action』 → 요청 → memberInsertForm() 처리
	
	- 데이터 입력(회원 등록) 액션 처리
	- 『memberinsert.action』 → 요청 → memberInsert() 처리
=====================================================================*/

package com.woori.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.woori.UserAccountDAO;
import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

@Controller
public class UserController01
{
	// 나의 플랫폼 계정정보 조회
	@RequestMapping(value = "/user.woori")
	public String userList(Model model) throws SQLException, ClassNotFoundException
	{
		UserAccountDAO dao = new UserAccountDAO();
		UserDTO myProfile = new UserDTO();
		
		int idx = 0;
		
		try
		{
			// String us_Code = "4";
			myProfile = dao.myProfile();
			
			idx = myProfile.getUs_email().indexOf("@");

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		model.addAttribute("myProfile", myProfile);
		
		model.addAttribute("email1", myProfile.getUs_email().substring(0, idx));	// 이메일 주소 보내기
		model.addAttribute("tel2", myProfile.getUs_tel().substring(3,7));			// 핸드폰 번호 보내기
		model.addAttribute("tel3", myProfile.getUs_tel().substring(7, 11));
		model.addAttribute("zipCode", myProfile.getUs_zipCode());
		model.addAttribute("addr1", myProfile.getUs_addr1());																			// 주소 보내기
		model.addAttribute("addr2", myProfile.getUs_addr2());
		
		
		return "PlatformMypageMain2.jsp";
		// return "/WEB-INF/PlatformMypageMain.jsp";
	}

	// ============================================================================
	// 데이터 입력(계정 수정) 폼 요청 관련 액션 처리 → 폼에 기존 데이터 받아오기
	/*
	@RequestMapping(value = "/platformaccountupdateform.woori")
	public String accountUpdateForm(Model model, @RequestParam("us_tel") String us_tel, @RequestParam("us_email") String us_email
									, @RequestParam("us_zipCode") String us_zipCode, @RequestParam("us_addr1") String us_addr1
									, @RequestParam("us_addr2") String us_addr2)
	{
		int indexEmail = us_email.indexOf("@");
		String email = us_email.substring(0, indexEmail);
		
		String tel1 = us_tel.substring(0, 2);
		String tel2 = us_tel.substring(3, 7);
		String tel3 = us_tel.substring(7, 11);
		
		String zipCode = us_zipCode;
		String addr1 = us_addr1;
		String addr2 = us_addr2;
				
		model.addAttribute("email", email);
		model.addAttribute("tel1", tel1);
		model.addAttribute("tel2", tel2);
		model.addAttribute("tel3", tel3);
		
		model.addAttribute("zipCode", zipCode);
		model.addAttribute("addr1", addr1);
		model.addAttribute("addr2", addr2);
		
		return "PlatformAccountUpdateF orm.jsp";
	}
	*/
	
	//-==========================================================
	
	// 데이터 입력(계정 수정) 액션 처리
	
	@RequestMapping(value = "/platformaccountupdate.woori", method = RequestMethod.POST)
	// public String accountUpdate(UserDTO dto) 
	public String accountUpdate(@RequestParam("us_Email1") String us_Email1,
			@RequestParam("us_Email2") String us_Email2, @RequestParam("tel_First") String tel_First,
			@RequestParam("us_Tel1") String us_Tel1, @RequestParam("us_Tel2") String us_Tel2,
			@RequestParam("us_addr1") String us_addr1, @RequestParam("us_addr2") String us_addr2,
			@RequestParam("us_zipCode") String us_zipCode) throws ClassNotFoundException, SQLException

	{
		String result = "";

		//int us_code = 3859105;

		String Email = us_Email1 + "@" + us_Email2;

		String Tel = tel_First + us_Tel1 + us_Tel2;

		String zipCode = us_zipCode;
		
		String addr1 = us_addr1;
		
		String addr2 = us_addr2;

		
		 //System.out.println(us_Email); System.out.println(us_Tel);
		 //System.out.println(us_Addr);

		try
		{
			UserAccountDAO dao = new UserAccountDAO();
			UserDTO dto = new UserDTO();

			// 회원프사, 회원전화번호, 회원주소, 회원이메일, 양음력
			// → ● 3/7 뷰페이지 수정 후 양음력 추가
			//dto.setUs_profile(us_profile);
			dto.setUs_tel(Tel);
			dto.setUs_zipCode(zipCode);
			dto.setUs_addr1(addr1);
			dto.setUs_addr2(addr2);
			dto.setUs_email(Email);
			//dto.setUs_lunar(lunar);
			

			// dao.connection();

			dao.modify(dto);

			// dao.close();

		} catch (Exception e)
		{
			System.out.println(e.toString());
		}

		result = "redirect:user.woori";
		return result;
	}
	
	
	// ====================================================================================
	// 플랫폼 비밀번호 수정 관련 액션 처리
	/*
	@RequestMapping("/platformpwdupdateform.do")
	public String pwdUpdateForm()
	{
		// model.addAttribute("memberInsert", "memberInsert");

		//return "PlatformPwdUpdateForm2.jsp";
		return "PlatformPwdUpdateForm2.jsp";
	}
	*/
	
	// 플랫폼 비밀번호 수정
	@RequestMapping(value = "/platformpwdupdate.woori", method = RequestMethod.POST)
	public String pwdUpdate(@RequestParam("now_pwd") String now_pwd, @RequestParam("new_pwd1") String new_pwd1)
	{
		//System.out.println("컨트롤러 요청");
		String result = "";
		
		String nowpwd = now_pwd; 	// 현재 비밀번호 받아오기
		String newpwd = new_pwd1;	// 새로운 비밀번호 받아오기
		
		//System.out.println("현재 비밀번호 확인 : " + nowpwd);
		//System.out.println("새로운 비밀번호 확인 : " + newpwd);
		
		String pwdCheck = "";
		
		String pwd = "userpwd1";	// us_code 2393726 의 비밀번호 복호화 키
		
		try
		{
			UserAccountDAO dao = new UserAccountDAO();
			UserDTO dto = new UserDTO();
			
			pwdCheck = dao.pwdCheck(pwd);	// 복호화가 되면 userpwd1 , 안되면 특수문자가 출력된 값을 pwdCheck 변수에 담기
			//System.out.println("컨트롤러에서 복호화된 비밀번호 확인 : " + pwdCheck);
			
			if (now_pwd.equals(pwdCheck))		// 입력한 현재 비번 (userpwd1) = pwdCheck메소드로 복호화된 비번(userpwd1)이 같으면 수정 메소드 호출
			{
				//System.out.println("수정 과정 거침");
				dto.setUs_pwd(newpwd);
				dto.setUs_pwd2(newpwd);
				dao.pwdModify(newpwd);
			}
			else							// 같지 않다면 안돼
				System.out.println("안됨");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		result = "redirect:user.woori";
		return result; 
	}
	
	// ====================================================================================
	// 플랫폼 탈퇴 요청 관련 액션 처리

	@RequestMapping("/accountwithdrawlform.woori")
	public String accountRemoveForm(Model model)
	{
		UserAccountDAO dao = new UserAccountDAO();
		int userPos = 0;
		UserDTO userId = new UserDTO();
		
		try
		{
			userPos = dao.count();
			userId = dao.myProfile();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 아이디 보내기
		model.addAttribute("userId", userId);
		// 직위가 있는지 확인 메소드 보내기
		model.addAttribute("userPos", userPos);
		return "AccountWithdrawal.jsp";
	}
	
	
	@RequestMapping(value = "/accountwithdrawl.woori",  method=RequestMethod.POST)
	public String accountRemove()
	{
		String result = "";
		
		UserAccountDAO dao = new UserAccountDAO();
		UserDTO dto = new UserDTO();
		
		try
		{
			dao.accountWthdr(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		result = "redirect:user.woori";
		return result;
	}
	
	//======================================================================================


}