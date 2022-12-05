package kh.semi.project.bond.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kh.semi.project.bond.model.service.PostService;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.common.Util;
import kh.semi.project.member.model.vo.Member;

@Controller
@SessionAttributes({"loginMember"})
public class PostController {

	@Autowired
	private PostService service;
	
	// 게시물 상세조회
	@ResponseBody
	@GetMapping("bond/{groupNo}/{postNo}")
	public String postSelect(@PathVariable("postNo") int postNo,
			HttpServletRequest req,
			@SessionAttribute("loginMember") Member loginMember) {
		
		Post post = service.selectPostDetail(postNo);
		
		if(post!=null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("postNo", postNo);
			map.put("memberNo", loginMember.getMemberNo());
			
			int result = service.postLikeCheck(map);
			if(result>0) {
				post.setLikeCheck("on"); // 좋아요하면 likeCheck값을 on로
			}
			
			// 조회수 검사 후 조회수 증가
			int viewResult = service.postViewUpdate(map);
			if(viewResult>0) { // insert시에 데이터와 화면 동기화
				post.setPostView(post.getPostView()+1);
			}
		}
		
		return new Gson().toJson(post);
	}
	
	// 좋아요 증가
	@GetMapping("/postLikeUp")
	@ResponseBody
	public int postLikeUp(@RequestParam Map<String, Object> paramMap) {
		return service.postLikeUp(paramMap);
	}
	
	// 좋아요 취소
	@GetMapping("/postLikeDown")
	@ResponseBody
	public int postLikeDown(@RequestParam Map<String, Object> paramMap) {
		return service.postLikeDown(paramMap);
	}
	
	
	// 게시물 작성 페이지
	@GetMapping("/bond/{groupNo}/postWrite")
	public String postWrite(@PathVariable("groupNo") int groupNo,
							Model model) {
		model.addAttribute("groupNo", groupNo);
		return "post/postWrite";
	}

	// 게시글 작성(INSERT)
	@ResponseBody
	@PostMapping("/bond/{groupNo}/postWrite")
	public int postWirte(
		@RequestParam("postContent") String postContent,
		@SessionAttribute("loginMember") Member loginMember,
		RedirectAttributes ra, HttpSession session,
		@PathVariable("groupNo") int groupNo,
		@RequestHeader("referer") String referer) {
		
		// 로그인 한 회원의 번호를 board 객체에 세팅
		Post post = new Post();
		post.setPostContent(postContent);
		post.setMemberNo(loginMember.getMemberNo());
		post.setGroupNo(groupNo);
		
		// 게시글 작성 서비스 수행 후 작성된 게시글의 번호로 반환
		int postNo = service.postWrite(post);
	    
	    return postNo;   
	      
	}
	      
	// 썸머노트 - 이미지 업로드 (postContent 내에 저장) 
	// produces 속성 : @ResponseBody를 사용하여 문자열을 return할 때 인코딩 문제 해결(이미지 파일명)
	@ResponseBody
	@RequestMapping(value="/uploadImageFile", produces = "application/json; charset=utf8")
	public String uploadImageFile(
				@RequestParam("file") MultipartFile multipartFile, 
				HttpServletRequest request) throws IOException {
	      
		JsonObject json = new JsonObject();
	      
		// 내부경로로 저장
		String webPath = "/resources/images/post/";
		String folderPath = request.getSession().getServletContext().getRealPath(webPath); // application scope

		String rename = Util.fileRename(multipartFile.getOriginalFilename());   		
													//오리지널 파일명
		File targetFile = new File(folderPath + rename);   
	    
		try {
			// 파일 저장
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);   
	            
			// ajax로 전달
			json.addProperty("url", webPath +rename);  
			json.addProperty("responseCode", "success");
	         
	       } catch (IOException e) {
	    	   FileUtils.deleteQuietly(targetFile);   
	    	   json.addProperty("responseCode", "error");
	    	   e.printStackTrace();
	       }
	      
	       return json.toString();
	   }
	
	
}
