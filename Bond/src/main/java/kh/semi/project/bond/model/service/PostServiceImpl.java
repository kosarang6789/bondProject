package kh.semi.project.bond.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.semi.project.bond.model.dao.PostDAO;
import kh.semi.project.bond.model.vo.Post;
import kh.semi.project.bond.model.vo.PostImage;

@Service
public class PostServiceImpl implements PostService{
	
	@Autowired
	private PostDAO dao;

	// 게시글 상세조회
	@Override
	public Post selectPostDetail(int postNo) {
		
		return dao.selectPostDetail(postNo);
	}

	// 게시글 작성
	@Override
	public int postWrite(Post post) {
		
		int postNo = dao.postWrite(post);
		
		if(postNo>0) {
			
			// img태그를 내용에서 비교하여 db에 저장
			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
			
			// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
			Matcher matcher = pattern.matcher((String)post.getPostContent());     
			
			String imagePath = null;
			String imageRename = null; // 파일명 변환 후 저장할 임시 참조 변수
			String src = null; // src 속성값을 저장할 임시 참조 변수
			List<PostImage> uploadImages = new ArrayList<PostImage>();
			
			// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우 true 
			while(matcher.find()){
				src=  matcher.group(1); // 매칭된 src 속성값을  Matcher 객체에서 꺼내서 src에 저장 
				
				imagePath = "/resources/images/post/"; // 파일명을 제외한 경로만 별도로 저장.
				
				imageRename = src.substring(src.lastIndexOf("/")+ 1); // 업로드된 파일명만 잘라서 별도로 저장.
				
				// PostImage 객체를 이용하여 DB에 파일 정보를 저장
				PostImage postImage = new PostImage(postNo, imageRename, imagePath);
				uploadImages.add(postImage);
			}
			if(!uploadImages.isEmpty()) {
			int result = dao.insertPostImages(uploadImages);
			}
		}
		
		return postNo;
	}
}
