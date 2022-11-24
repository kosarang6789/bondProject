package kh.semi.project.member.model.service;


import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.semi.project.member.model.dao.FindEPDAO;
import kh.semi.project.member.model.vo.Member;

@Service
public class FindPWServiceImpl implements FindEPService{

	@Autowired
	private FindEPDAO dao;
	
	@Autowired
	private JavaMailSender mailSender;

	/**
	 * 이메일 찾기
	 */
	@Override
	public Member findEmail(Member inputMember) {
		return dao.findEmail(inputMember);
	}


	
	/**
	 * 비밀번호 찾기
	 */
	@Override
	public Member findPw(Member inputMember) {
		return dao.findPw(inputMember);
	}


	
	


	/**
	 * 인증번호 만들기
	 */
	@Override
	public String createAuthKey() {
		String key = "";
		for(int i=0; i<6; i++) {
			int sel1 = (int)(Math.random()*3); // 0:숫자 / 1,2:영어
			if(sel1 == 0) {
				int num = (int)(Math.random()*10);
				key += num;
			}else {
				char ch = (char)(Math.random()*26+65); // A~Z
				int sel2 = (int)(Math.random()*2); // 0:소문자 / 1:대문자
				if(sel2 == 0) {
					ch = (char)(ch + ('a' - 'A')); // 대문자로 변경
				}
				key += ch;
			}
		}
		return key;
	}	
	
	private String fromEmail = "khbond6789@gmail.com";
	private String fromUserName = "본드 이메일 인증";
	

	/**
	 * 인증번호 보내기
	 */
	@Transactional
	@Override
	public String sendKey(String sendEmail) {
		
		
		String authKey = createAuthKey();
		try {
			//인증메일 보내기
			MimeMessage mail = mailSender.createMimeMessage();
			//제목
			String subject = "[본드]비밀번호 찾기 인증번호 발송";
			// 문자 인코딩
			String charset = "UTF-8";
			// 메일 내용
			String mailContent = 
					"<p>본드 비밀번호 찾기 인증번호입니다.</p>"
					+ "<h3 style='color:green'>" + authKey + "</h3>";
					
			// 송신자
			mail.setFrom(new InternetAddress(fromEmail, fromUserName));
			// 수신자
			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(sendEmail));
			// 이메일 제목
			mail.setSubject(subject, charset);
			// 내용
			mail.setText(mailContent, charset, "html");
			// 메일 발송
			mailSender.send(mail);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return authKey;
	}

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	// 비밀번호 찾기 -> 변경
	@Transactional
	@Override
	public int changePw(Map<String, Object> paramMap) {
		
		String newPw = bcrypt.encode((String)paramMap.get("newPw"));
		
		paramMap.put("newPw", newPw);
		
		int result = dao.changePw(paramMap);
		
		return result;
	}


	
	
	
	
	
}
