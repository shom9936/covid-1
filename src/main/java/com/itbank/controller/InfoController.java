package com.itbank.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.service.ForeignService;
import com.itbank.service.OpenAPI;
import com.itbank.service.VaccineService;
import com.itbank.vo.ForeignCaseVO;
import com.itbank.vo.ForeignVO;
import com.itbank.vo.KoreaCaseVO;
import com.itbank.vo.VaccineVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/info/*")
@Log4j
@RequiredArgsConstructor
public class InfoController {
	
	private final VaccineService vaccineService;
	private final ForeignService foreignService;
	
	@GetMapping("/foreignNation")
	public String Foreign(Model model) {
		log.info("Operation foreign()----");
		
		/* List<ForeignVO> list = foreignService.getAllList(); */
		/* List<ForeignVO> store = list.getAllListVo(); */
		return "info/foreignNation";
		
		
	}
	
	// /Foreign/Nation/1
	@GetMapping("/foreign")
	public String getInfo(int NationNum, Model model) {
		
		log.info("단건 조회");
		
		ForeignVO vo = foreignService.getInfo(NationNum);
		/* ForeignVO Nation = service.getInfo(NationNum); */
		model.addAttribute("vo", vo);
		model.addAttribute("Nat", vo.getNation());
		model.addAttribute("Arr", vo.getArrInfo());
		model.addAttribute("Exp", vo.getExemption());
		model.addAttribute("Num", vo.getNationNum());
		/* model.addAttribute("Nation", Nation); */
		/* model.addAttribute("ArrayInfo", ArrayInfo); */
		log.info("vo");
		System.out.println(vo.getNationNum());
		/* return once; */
		return "info/foreign";
		
	}
	
	@GetMapping("/foreign_case")
	public void foreign_case(Model model) throws Exception {
		String getInfoURL = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19NatInfStateJson";
		LocalDate now = LocalDate.now();
		LocalDate twoDayAgo = now.minusDays(2);
		
		String strNow = "";
		String strTwoDayAgo = "";
		for(char t : now.toString().toCharArray()) {
			if(t != '-') strNow += t;
		}
		
		for(char t : twoDayAgo.toString().toCharArray()) {
			if(t != '-') strTwoDayAgo += t;
		}

		String foreignCaseInfoXML = OpenAPI.getXMLInfo(getInfoURL, strTwoDayAgo, strNow);		
		List<HashMap<String, String>> list = OpenAPI.getResultMap(foreignCaseInfoXML);
		List<ForeignCaseVO> resultList = new ArrayList<ForeignCaseVO>();
		
		for(Map<String,String> tmpMap : list) {
			ForeignCaseVO vo = new ForeignCaseVO();
			vo.setAreaName(tmpMap.get("areaNm")); // 지역명 (한글)
			vo.setNationName(tmpMap.get("nationNm")); // 국가명 (한글)
			vo.setNatDefCnt(tmpMap.get("natDefCnt")); // 국가별 확진자 수
			vo.setNatDeathCnt(tmpMap.get("natDeathCnt")); // 국가별 사망자 수
			if(tmpMap.get("natDeathRate").length() > 5) {
				vo.setNatDeathRate(tmpMap.get("natDeathRate").substring(0, 4)); // 확진률 대비 사망률
			} else {
				vo.setNatDeathRate(tmpMap.get("natDeathRate")); // 확진률 대비 사망률
			}
			
			resultList.add(vo);
		}
		
		log.info("foreign");
		log.info(resultList.size() + "개의 정보를 불러왔습니다.");
		 
		model.addAttribute("resultList", resultList);
		 
	}
	
	@GetMapping("/vaccine")
	public void infoForm(Model model) throws Exception {
		List<VaccineVO> list = vaccineService.getAllList();
		for(VaccineVO vo : list) {
			model.addAttribute("vaccine" + vo.getInfo_no() , vo);
		}
	}
	
	@GetMapping("/vaccine_case")
	public void vaccine_case() {
	}
	
	@GetMapping("korea")
	public void korea(Model model) throws Exception {
		String getInfoURL = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson";
		LocalDate now = LocalDate.now();
		String strNow = "";
		for(char t : now.toString().toCharArray()) {
			if(t != '-') strNow += t;
		}
		String foreignCaseInfoXML = OpenAPI.getXMLInfo(getInfoURL, strNow, strNow);
		
		List<HashMap<String, String>> list = OpenAPI.getResultMap(foreignCaseInfoXML);
		List<KoreaCaseVO> resultList = new ArrayList<KoreaCaseVO>();
		
		for(Map<String,String> tmpMap : list) {

			KoreaCaseVO vo = new KoreaCaseVO();
			vo.setDeathCnt(Integer.parseInt(tmpMap.get("deathCnt")));
			vo.setDefCnt(Integer.parseInt(tmpMap.get("defCnt")));
			vo.setGubun(tmpMap.get("gubun"));
			vo.setIncDec(Integer.parseInt(tmpMap.get("incDec")));
			vo.setIsolClearCnt(Integer.parseInt(tmpMap.get("isolClearCnt")));
			vo.setLocalOccCnt(Integer.parseInt(tmpMap.get("localOccCnt")));
			vo.setOverFlowCnt(Integer.parseInt(tmpMap.get("overFlowCnt")));
			resultList.add(vo);

		}
		log.info("korea_info");
		log.info(resultList.size() + "개의 정보를 가져왔습니다.");
		model.addAttribute("resultList", resultList);
	}
	
	@GetMapping("korea_info")
	public void korea_info() {
			
	}

}
