package com.itbank.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itbank.service.OpenAPI;
import com.itbank.vo.DomesticCaseVO;
import com.itbank.vo.ForeignCaseVO;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
public class HomeController {
	
	@RequestMapping(value = {"/" , "/index"}, method = RequestMethod.GET)
	public String home(Model model) throws Exception {
		String getInfoURL = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson";
		LocalDate now = LocalDate.now();
		LocalDate sevenDayAgo = now.minusDays(7);
		
		String strNow = "";
		String strSevenDayAgo = "";
		for(char t : now.toString().toCharArray()) {
			if(t != '-') strNow += t;
		}
		
		for(char t : sevenDayAgo.toString().toCharArray()) {
			if(t != '-') strSevenDayAgo += t;
		}

		String domesticCaseInfoXML = OpenAPI.getXMLInfo(getInfoURL, strSevenDayAgo, strNow);		
		List<HashMap<String, String>> list = OpenAPI.getResultMap(domesticCaseInfoXML);
		List<DomesticCaseVO> resultList = new ArrayList<DomesticCaseVO>();
		
		for(Map<String,String> tmpMap : list) {
			DomesticCaseVO vo = new DomesticCaseVO();
			vo.setDecideCnt(Integer.parseInt(tmpMap.get("decideCnt")));
			String startDt = tmpMap.get("stateDt");
			vo.setStartDt(startDt.substring(4,6) + "." + startDt.substring(6,8));
			resultList.add(vo);
		}
		
		Collections.reverse(resultList);
		int max = 0;
		for(int i=1; i<resultList.size(); i++) {
			int incDec = resultList.get(i).getDecideCnt() - resultList.get(i-1).getDecideCnt();
			if(max < incDec) max = incDec;
			resultList.get(i).setIncDec(incDec);
			if(i==resultList.size()-1) model.addAttribute("nowDayIncDec", incDec);
		}
		resultList.remove(0);
		
		for(DomesticCaseVO vo : resultList) {
			vo.setWeekPercent((int) (((double)vo.getIncDec()/(double)max)*100.0));
		}
		
		model.addAttribute("resultList", resultList);
		
		log.info("index");
		log.info(resultList.size() + "개의 정보를 가져왔습니다.");
		
		return "index";
	}
	
}
