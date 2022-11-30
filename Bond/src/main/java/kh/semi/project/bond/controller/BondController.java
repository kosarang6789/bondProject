package kh.semi.project.bond.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kh.semi.project.bond.model.service.BondService;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember", "groupInfo"})
public class BondController {

	@Autowired 
	private BondService service;
	
	// 본드 생성 페이지 이동
	@GetMapping("/bond-create")
	public String createBond() {
		return "bond/createBond";
	}
	
	// 본드 생성 페이지
	@PostMapping("/bond-create")
	public String createBond(
			String groupName, String openYN, int topicCode,
			@RequestParam(value="groupImage", required=false) MultipartFile groupImage,
			RedirectAttributes ra, HttpSession session,
			@RequestHeader("referer") String referer,
			@SessionAttribute("loginMember") Member loginMember
			) throws Exception {
		
		Group newGroup = new Group();
		newGroup.setGroupName(groupName);
		newGroup.setTopicCode(topicCode);
		newGroup.setOpenYN(openYN);
		
		String webPath = "/resources/images/bond/profile/";
		String folderPath = session.getServletContext().getRealPath(webPath);
		
		// 만든 회원 번호 -> join group에 삽입
		int memberNo = loginMember.getMemberNo();
		int groupNo = service.createGroup(newGroup, groupImage, webPath, folderPath, memberNo);
		
		String message = null;
		String path = null;
		
		if(groupNo>0) {
			message = "본드가 생성되었습니다!";
			path = "/bond/" + groupNo;
		} else {
			message = "본드 만들기 실패";
			path = referer;
		}
		ra.addFlashAttribute("message",message);
		return "redirect:"+path;
	}
	
	// 사진첩 페이지로 이동 
	@GetMapping("/bond/{groupNo}/album")
	public String albumPage(
			@PathVariable("groupNo") int groupNo,
			Model model) {
		
		// 본드 기본정보 불러오기(이름, 사진, 멤버수, 소개글)
		Group groupInfo = service.selectGroupInfo(groupNo);
		
		model.addAttribute("groupInfo", groupInfo);
		
		return "bond/album";
	}
	

	// 게시글 상세 조회를 목록 형식으로 
	@GetMapping("/bond/{groupNo}")
	public String selectBoardDetail(
			@PathVariable("groupNo") int groupNo,
			Model model,
			@RequestParam(value="cp", required=false, defaultValue= "1") int cp,
			HttpServletRequest req, HttpServletResponse resp,
			@SessionAttribute(value="loginMember", required=false) Member loginMember,
			RedirectAttributes ra
			) {
		
		
		// 본드 기본정보 불러오기(이름, 사진, 멤버수, 소개글)
		Group groupInfo = service.selectGroupInfo(groupNo);
		
		// 신고 기록 조회
		String checkReport = service.checkReport(groupNo);
		String path = "";
		String message = "";
		
		if(checkReport == null) { // 신고 기록이 없으면
			model.addAttribute("groupInfo", groupInfo);
			
			
			// 게시글 불러오기
			Map<String, Object> map = service.selectBoardDetail(groupNo, cp);
			
			model.addAttribute("map",map);
			int memberNo = loginMember.getMemberNo();
			
			Map<String, Object> map1;
			map1.put("groupNo", groupNo);
			map1.put("memberNo", memberNo);
			int result1 = service.selectJoinNo(map1);
			
			// 밴드 가입 여부
			if(result1 > 0) { // 가입X
				String resultYN = service.selectOpenYN(groupNo);
				// 게시물 공개 여부
				if(resultYN.equals("Y")) { // 공개X
					path = "/";
					
				} else { // 공개O
					path = "bond/openYes";
				}
			} else { // 가입O
				path = "bond/bond";
				
			}
			
			path = "bond/openYes";
			
		} else { // 신고 기록이 있으면
			String notice = "모임 이용 중지됨"
					+ "(기간 : " + checkReport
					+ ") 자세한 사항은 고객센터(help@kosaran)으로 문의 바랍니다.";
			ra.addFlashAttribute("message", notice);
			
			path = "redirect:/member/mainPage";
		}
		
		
		return path;
	}
	
	
	// 게시물 조회 무한스크롤
	@PostMapping("/bond/{groupNo}")
	@ResponseBody
	public String selectBoardScroll(
			@PathVariable("groupNo") int groupNo,
			Model model,
			@RequestParam(value="cp", required=false, defaultValue= "1") int cp,
			HttpServletRequest req, HttpServletResponse resp,
			@SessionAttribute(value="loginMember", required=false) Member loginMember
			) {
		
		// 게시글 불러오기
		Map<String, Object> map = service.selectBoardDetail(groupNo, cp);
		
		model.addAttribute("map",map);
		
		return new Gson().toJson(map);
	}
	

	
	
}

