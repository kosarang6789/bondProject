package kh.semi.project.myPage.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.semi.project.member.model.vo.Member;
import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.common.Util;
import kh.semi.project.myPage.model.service.BondIntroService;

@Controller
@SessionAttributes({"loginMember", "groupInfo"})
public class BondIntroController {
	
	@Autowired
	private BondIntroService service;
	
	// 본드 소개 페이지 이동
//	@GetMapping("/bond-bondIntro")
//	public String goBodnIntro() {
//		return "/bond/bond-bondIntro";
//	}
	@GetMapping("/bond/{groupNo}/bond-bondIntro")
	public String goBodnIntro(
			@SessionAttribute("groupInfo") Group groupInfo,
			@PathVariable("groupNo") int groupNo,
			Model model) {
		
		if(groupInfo.getGroupComment() != null) {
			
			groupInfo.setGroupNo(groupNo);
			
			groupInfo.setGroupComment(Util.newLineClear(groupInfo.getGroupComment()));
		}
		
		model.addAttribute("groupInfo", groupInfo);
		return "/bond/bond-bondIntro";
	}
	
	// 본드 소개 수정
	@PostMapping("/bond/{groupNo}/bond-bondIntro")
	public String bondIntro(
			@PathVariable("groupNo") int groupNo,
			@SessionAttribute("groupInfo") Group groupInfo,
			RedirectAttributes ra,
			Group inputGroup,
			@RequestParam(value="groupImage2") MultipartFile groupImage2,
			HttpSession session,
			@RequestHeader("referer")String referer,
			Model model,
			@RequestParam(value="deleteYN", required = false) int deleteYN) throws Exception {
		
		String webPath = "/resources/images/bond/profile/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		Group newGroup = new Group();
		newGroup.setGroupName(inputGroup.getGroupName());
		newGroup.setGroupComment(inputGroup.getGroupComment());

		newGroup.setGroupNo(groupNo);
		
		int result = service.bondIntro(groupInfo, webPath, filePath, newGroup, groupImage2, deleteYN);
		
		String message = null;
		
		if(result>0) {
			groupInfo.setGroupName(newGroup.getGroupName());
			groupInfo.setGroupComment(Util.newLineClear(newGroup.getGroupComment()));
//			groupInfo.setGroupImage(groupImage2.getName());

			model.addAttribute("groupInfo", groupInfo);
			
			message = "본드 소개 수정 완료 되었습니다.";
		}else { message = "본드 소개 수정이 실패했습니다."; }
		
		ra.addFlashAttribute("message", message);
		
		
		return "redirect:"+referer;
	}

}
