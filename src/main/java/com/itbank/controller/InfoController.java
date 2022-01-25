package com.itbank.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.itbank.vo.ForeignCaseVO;
import com.itbank.vo.KoreaCaseVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/info/*")
@Log4j
@RequiredArgsConstructor
public class InfoController {
	
	@GetMapping("/foreign")
	public void foreign() {
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
		
		String foreignCaseInfoXML = getXMLInfo(getInfoURL, strTwoDayAgo, strNow);
		
		List<HashMap<String, String>> list = getResultMap(foreignCaseInfoXML);
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
	public void vaccine() {
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
		
		String foreignCaseInfoXML = getXMLInfo(getInfoURL, strNow, strNow);
		
		List<HashMap<String, String>> list = getResultMap(foreignCaseInfoXML);
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
	
	public String getXMLInfo(String getInfoURL, String startDay, String endDay) throws IOException {
		String serviceKey = "BIJkXaLDYfenwgP1A8m312TOU8nyxveD2rYD61g%2FQfbFcNBWJ5uZyQpzHUUqcyDhHSMvrfMolg6OdDU2DNSgyg%3D%3D";
    	/* "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson"  */
        StringBuilder urlBuilder = new StringBuilder(getInfoURL); /*URL*/
        urlBuilder.append("?" + 
        URLEncoder.encode("serviceKey","UTF-8") + "=" + serviceKey); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("startCreateDt","UTF-8") + "=" + URLEncoder.encode(startDay, "UTF-8")); /*검색할 생성일 범위의 시작*/
        urlBuilder.append("&" + URLEncoder.encode("endCreateDt","UTF-8") + "=" + URLEncoder.encode(endDay, "UTF-8")); /*검색할 생성일 범위의 종료*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        return sb.toString();
	}
	
	public static List<HashMap<String, String>> getResultMap(String data) throws Exception {
		 
		//결과값을 넣어줄 map을 선언해줍니다.
		List<HashMap<String, String>> resultMap = new LinkedList<HashMap<String, String>>();
		        
		InputSource is = new InputSource(new StringReader(data));
		 
		//Document 클래스로 xml데이터를 취득합니다.
		Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);
		 
		//xPath 팩토리로 객체를 만듭니다.
		XPath xpath = XPathFactory.newInstance().newXPath();
		 
		//xPath를 컴파일한 후에 node단위로 데이터를 수집합니다.
		NodeList nodeList = (NodeList) xpath.compile("/response/body/items/item").evaluate(document, XPathConstants.NODESET);
		int nodeListCount = nodeList.getLength();
		for (int i = 0; i < nodeListCount; i++) {
		    NodeList childNode = nodeList.item(i).getChildNodes();
		    HashMap<String, String> nodeMap = new HashMap<String, String>();
		    int childNodeCount = childNode.getLength();
		    for (int j = 0; j < childNodeCount; j++) {
		        nodeMap.put(childNode.item(j).getNodeName(), childNode.item(j).getTextContent());
		    }
		    resultMap.add(nodeMap);
		}
		
		return resultMap;
	}

}
