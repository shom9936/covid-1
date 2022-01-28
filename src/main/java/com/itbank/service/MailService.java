package com.itbank.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailService {
	@Autowired
	private JavaMailSender mailSender;
	
	@Async
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("shom32@naver.com", "COVID-19 안내 페이지");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText(body,true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
