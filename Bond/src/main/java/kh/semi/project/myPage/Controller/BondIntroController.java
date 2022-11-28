package kh.semi.project.myPage.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.semi.project.bond.model.vo.Group;
import kh.semi.project.myPage.model.service.BondIntroService;

@Controller
@SessionAttributes({"loginMember", "groupInfo"})
public class BondIntroController {
	
	@Autowired
	private BondIntroService service;
	
	// 본드 소개 페이지 이동
	@GetMapping("/bond/bondIntro")
	public String goBodnIntro() {
		return "/myPage/bondIntro";
	}
	
	// 본드 소개 수정
	@PostMapping("/bond/bondIntro")
	public String bondIntro(
			@SessionAttribute("groupInfo") Group groupInfo,
			RedirectAttributes ra,
			Group inputGroup,
			@RequestParam(value="groupImage") MultipartFile groupImage,
			HttpSession session) throws Exception {
		
		String webPath = "/resources/images/bond/profile/";
		String filePath = session.getServletContext().getRealPath(webPath);

		
		int result = service.bondIntro(groupInfo, webPath, filePath, inputGroup, groupImage);
		
		String message = null;
		
		if(result>0) {
			groupInfo.setGroupName(inputGroup.getGroupName());
			groupInfo.setGroupComment(inputGroup.getGroupComment());
			message = "본드 소개 수정 완료 되었습니다.";
		}else { message = "본드 소개 수정이 실패했습니다."; }
		
		ra.addFlashAttribute("message", message);
		
		
		return "redirect:/myPage/bondIntro";
	}

}
