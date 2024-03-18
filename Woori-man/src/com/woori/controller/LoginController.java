package com.woori.controller;


import java.sql.SQLException;
import java.util.ArrayList;




import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;		//-- check~!!!
import org.springframework.web.bind.annotation.RequestParam;

import com.woori.dto.MeetingDTO;
import com.woori.dao.MemberMainDAO;
import com.woori.dao.FriendsDAO;
import com.woori.dto.FriendsDTO;
import com.woori.dao.LoginDAO;
import com.woori.dto.GroupDTO;
import com.woori.dto.LoginDTO;
import com.woori.dto.UserDTO;



// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구성한다.
//	  cf. Controller Annotation 활용
@Controller
public class LoginController
{
	
	
	@RequestMapping(value = "/membershipform.woori")
	public String goMembership()
	{
		return "/WEB-INF/view/Membership.jsp";
	}
	
	
	
	// 회원가입 아이디 중복체크 
	@RequestMapping(value = "/idcheck.woori")
	public String checkId(Model model, @RequestParam("us_id") String us_id) throws SQLException, ClassNotFoundException
	{
		LoginDAO dao = new LoginDAO();
		dao.connection();
		
		//String result = "";
		int count = dao.checkId(us_id);
		
		model.addAttribute("count", count);
		
		return "/WEB-INF/view/checkIdAjax.jsp";
	}
	
	// 회원가입 전화번호 중복체크
	@RequestMapping(value = "/telcheck.woori")
	public String checkTel(Model model, @RequestParam("us_tel1") String us_tel1, @RequestParam("us_tel2") String us_tel2) throws ClassNotFoundException, SQLException
	{
		int count = 0;							// dao에서 중복검사를 한 카운트 수 변수 선언
		String us_tel = "";						// 최종 번호를 담을 변수
		us_tel = "010" + us_tel1 + us_tel2;		// 010 포함 4자리씩 받은 전화번호 합치기
		
		LoginDAO dao = new LoginDAO();
		
		dao.connection();
		
		count = dao.checkTel(us_tel);
		
		model.addAttribute("count", count);
		
		return "/WEB-INF/view/checkTelAjax.jsp";
	}
	
	
	
	// 회원 가입 액션 
	@RequestMapping(value = "/membership.woori")
	public String membership(Model model, @RequestParam("us_id") String us_id				// 아이디
										, @RequestParam("us_pwd") String us_pwd				// 비밀번호
										, @RequestParam("us_name") String us_name			// 이름
										, @RequestParam("us_birthday") String us_birthday	// 생년월일 앞 6
										, @RequestParam("us_lunar") String us_lunar			// 양/음력
										, @RequestParam("us_tel1") String us_tel1			// 중간4
										, @RequestParam("us_tel2") String us_tel2			// 마지막4
										, @RequestParam("us_zipcode") String us_zipcode 	// 우편번호
										, @RequestParam("us_addr1") String us_addr1			// 주소
										, @RequestParam("us_addr2") String us_addr2			// 상세주소
										, @RequestParam("us_email") String us_email			// 이메일
										) throws ClassNotFoundException, SQLException	
	{
		LoginDAO dao = new LoginDAO();
		UserDTO dto = new UserDTO();
		dao.connection();
		
		
		// 분기해서 받은 전화번호를 010 과 결합하여 이어 붙이기
		String us_tel = "";
		us_tel = "010" + us_tel1 + us_tel2;
		
		
		dto.setUs_id(us_id);
		dto.setUs_pwd(us_pwd);
		dto.setUs_name(us_name);
		dto.setUs_birthday(us_birthday);
		dto.setUs_lunar(us_lunar);
		dto.setUs_tel(us_tel);
		dto.setUs_zipcode(us_zipcode);
		dto.setUs_addr1(us_addr1);
		dto.setUs_addr2(us_addr2);
		dto.setUs_email(us_email);
		
		dao.membership(dto);
		
		return "loginform.woori";
	}
	
	
	// 로그인 
	// 넘겨받은 id와 pwd 의 알맞은 회원에 이름이 존재한다면 
	// MemberMain 으로 접속 
	// 존재하지 않는다면 Login 화면을 다시 요청 
	@RequestMapping(value = "/login.woori")
	public String login(HttpSession session, Model model, @RequestParam("id") String id,@RequestParam("pwd") String pwd) throws SQLException, ClassNotFoundException 
	{
		UserDTO userDTO = new UserDTO();
		LoginDTO user = new LoginDTO();
		LoginDAO dao = new LoginDAO();
		String loginMsg = ""; 
		
		dao.connection();
		
		// 일반 회원 로그인
		user = dao.login(id, pwd);
		
		String us_code = user.getUs_code();
		String uw_code = user.getUw_code();
		
		
		// 로그인 수행에 따른 성공 여부 확인 및 분기 / 구분
		if (us_code == null || uw_code != null)
		{
			// 로그인 실패 → 로그인 폼을 다시 요청할 수 있도록 안내
			loginMsg = "아이디 또는 비밀번호를 잘못 입력했습니다.";
			session.setAttribute("loginMsg", loginMsg);
			return "loginform.woori";
		} 
		
		// 로그인 성공 → 세션 구성 → MemberMain 페이지를  요청할 수 있도록 안내
		
		userDTO = dao.setUser(us_code);
		
		session.setAttribute("userDTO", userDTO); 
		
		dao.close();
	
		return "redirect:membermain.woori";
	}
	
	
	

	// 로그인 폼 연결 메소드
	@RequestMapping(value = "/loginform.woori")
	public String loginform(HttpSession session, Model model)
	{
		String loginMsg = (String) session.getAttribute("loginMsg");
		model.addAttribute("loginMsg", loginMsg);
		session.removeAttribute("loginMsg");
		return "/WEB-INF/view/Login.jsp";
	}
	
	
	// 아이디 찾기 폼으로 연결해주는 메소드
	@RequestMapping(value = "/idfindform.woori")
	public String findIdForm(HttpSession session, Model model)
	{
		return "/WEB-INF/view/IdFindForm.jsp";
	}
	
	// 비밀번호 찾기 폼으로 연결해주는 메소드
	@RequestMapping(value = "/pwdfindform.woori")
	public String	findPwdForm()
	{			
		return "/WEB-INF/view/PwdFindForm.jsp";
	}
	
	
	// 비밀번호 재설정 폼으로 연결해주는 메소드
	@RequestMapping(value = "/pwdresetform.woori")
	public String pwdRestForm()
	{
		
		return "/WEB-INF/view/pwdResetForm.jsp";
	}
	
	// 캘린더 AJAX 
	@RequestMapping(value = "/maincalendarajax.woori")
	public String myPageCalendarAjax(ModelMap model)
	{
		return "/WEB-INF/view/MainCalendarAjax.jsp";
	}
		
		
		// 로그인 
		// 넘겨받은 id와 pwd 의 알맞은 회원에 이름이 존재한다면 
		// MemberMain 으로 접속 
		// 존재하지 않는다면 Login 화면을 다시 요청 
		@RequestMapping("/membermain.woori")
		public String enterMember(HttpSession session, Model model) throws ClassNotFoundException, SQLException
		{
			
			ArrayList<GroupDTO> groupList = new ArrayList<GroupDTO>();
			ArrayList<FriendsDTO> friendsList = new ArrayList<FriendsDTO>();
			ArrayList<MeetingDTO> allMeeting = new ArrayList<MeetingDTO>();
			MemberMainDAO memberMainDAO = new MemberMainDAO();
			UserDTO userDTO = (UserDTO) session.getAttribute("userDTO"); // 세션에 있는 userDTO가져오기
			String us_code = userDTO.getUs_code();

			
			FriendsDAO friendDao = new FriendsDAO(); // 친구 DAO
			LoginDAO dao = new LoginDAO();			// 로그인 dao
			
			memberMainDAO.connection();
			friendDao.connection();
			dao.connection();
			
			
			if (String.valueOf(us_code)==null || String.valueOf(us_code) =="")			//-- 로그인이 되어있지 않은 상황
			{
				return "redirect:loginform.woori";
				
			}
			else
			{
				
				// 액션이 처리됐다면 값을 membermain에 넘겨줌 
				// 모달을 자동으로 띄워주는 조건문을 만들기 위함
				// model 에 값을 담고 session 에서는 삭제
				if (session.getAttribute("delCount") != null)
				{
					model.addAttribute("delCount", session.getAttribute("delCount"));
					session.removeAttribute("delCount");
				}
				else if (session.getAttribute("addCount") != null)
				{
					model.addAttribute("addCount", session.getAttribute("addCount"));
					session.removeAttribute("addCount");
				}
				
				// 로그인한 회원의 그룹정보 담기
				groupList = dao.groupList(us_code);
				
				// 친구 목록 뽑기 
				friendsList = friendDao.list(us_code);
				
				// 모임 정보 뽑아오기
				allMeeting = memberMainDAO.findMeeting(us_code);	// 내 모든 그룹의 의사표현한 모임 담기
				
				
				dao.close();
				
				
				session.setAttribute("allMeeting", allMeeting);
				model.addAttribute("userDTO", userDTO);
				model.addAttribute("groupList", groupList);
				model.addAttribute("friendsList", friendsList);
			}
			
			return "WEB-INF/view/MemberMain.jsp";
		}
	
	
	
	// 아이디 찾기 액션 처리
	@RequestMapping(value = "/idfind.woori")
	public String findId(Model model, @RequestParam("us_name") String us_name
									, @RequestParam("us_birthday") String us_birthday
									, @RequestParam("us_tel") String us_tel) throws ClassNotFoundException, SQLException
	{
		LoginDAO dao = new LoginDAO();
		dao.connection();
		
		StringBuffer sb = new StringBuffer();
		String us_id = dao.searchId(us_name, us_birthday, us_tel);
		int str = 0;		// 가운데 글자의 갯수 
		String temp = "";	// 가운데 글자 담을 변수
		String mid = ""; 	// 가운데 글자를 별로 치환하는 변수
		
		
		if (us_id == "" || us_id == null)
		{
			us_id = "회원정보가 존재하지 않습니다.";
			
			model.addAttribute("us_id", us_id);
			return "/WEB-INF/view/findIdAjax.jsp";
		}
		
		if (us_id.length() < 10)
		{
			str = us_id.length() - 4; //  가운데 글자가 몇개인지 찾기
			
			temp  = us_id.substring(2, str + 2); // 가운데 글자 구하기
			
			System.out.println(us_id.substring(2, str + 2));
			
			// 가운데 글자 만큼 반복문을 통해 *을 찍음
			for (int i = 0; i < temp.length(); i++)
			{
				sb.append("*");
			}
			mid = sb.toString(); // 찍은 별을 mid 변수에 담기
			us_id = us_id.substring(0, 2) + mid + us_id.substring(us_id.length()-2, us_id.length()); // 끝 두자리
		}
		else if (us_id.length() >= 10 || us_id.length() < 15)	// 아이디가 10글자 이상 15글자 미만 일때 (앞 뒤 각각 3글자씩)
		{
			str = us_id.length() - 6;
			temp = us_id.substring(3, str + 3);
			
			for (int i = 0; i < temp.length(); i++)
			{
				sb.append("*");
			}
			mid = sb.toString(); 
			us_id = us_id.substring(0, 3) + mid + us_id.substring(us_id.length()-3, us_id.length()); // 끝 두자리
			
		}
		else if (us_id.length() <= 20) // 아이디가 15글자 이상 20글자이하 일때 (앞 뒤 각각 4글자씩) 
		{
			str = us_id.length() - 8;
			temp = us_id.substring(4, str + 4);
			
			for (int i = 0; i < temp.length(); i++)
			{
				sb.append("*");
			}
			mid = sb.toString(); 
			us_id = us_id.substring(0, 4) + mid + us_id.substring(us_id.length()-4, us_id.length()); // 끝 두자리
		}
		
		System.out.println(us_id);
		
		model.addAttribute("us_id", us_id);
		return "/WEB-INF/view/findIdAjax.jsp";
	}
	
	
	// 비밀번호 찾기 액션 처리
	@RequestMapping(value = "/pwdfind.woori")
	public String findPwd(Model model, @RequestParam("us_id") String us_id
									 , @RequestParam("us_name") String us_name
									 , @RequestParam("us_birthday") String us_birthday) throws ClassNotFoundException, SQLException
	{
		
		LoginDAO dao = new LoginDAO();
		
		dao.connection();
		
		LoginDTO info = dao.searhPwd(us_id, us_name, us_birthday);
		
		String us_code = info.getUs_code();
		String us_pwd = info.getUs_pwd();
		
		if (us_pwd == null)
		{
			return "/WEB-INF/view/PwdFindForm.jsp";
		}
		
		model.addAttribute("us_code", us_code);
		model.addAttribute("us_id", us_id);
		
		dao.close();
		
		return "/pwdresetform.woori";
	}
	
	
	// 비밀번호 재설정 액션처리
	@RequestMapping(value = "/pwdreset.woori" )
	public String modifyPwd(Model model, @RequestParam("us_code") String us_code	// 회원코드
								   	   , @RequestParam("us_pwd1") String us_pwd 	// 새 비밀번호
									   , @RequestParam("us_pwd2") String us_Pwd2 	// 새 비밀번호 확인
									 ) throws ClassNotFoundException, SQLException
	{
		
		LoginDAO dao = new LoginDAO();
		dao.connection();
		
		dao.modifyPwd(us_code, us_pwd);
		
		dao.close();
		
		return "/WEB-INF/view/Login.jsp";
	}

}











































