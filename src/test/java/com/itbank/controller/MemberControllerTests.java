package com.itbank.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.context.WebApplicationContext;

import com.itbank.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
         "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class MemberControllerTests {
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mokMvc;
	
	@Before
    public void setup() {
        this.mokMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }
	
	@Test
	public void testList() throws Exception{
        log.info(
                mokMvc.perform(
                        MockMvcRequestBuilders.post("/member/join")
                	.param("id", "test01")
                	.param("pwd", "test01123")
                	.param("name", "test")
                	.param("email", "test01@test.com")
                	.param("location", "test")
                	.param("tel", "010-1111-2222"))
                .andReturn()
                .getModelAndView()
                .getModelMap());
    }
	
	
}
