package com.itbank.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class KoreaCaseVO {
	private String gubun; // 시도명(한글)
	private int defCnt; // 확진자 수
	private int deathCnt; // 사망자 수
	private int incDec; // 전일대비 증감 수
	private int isolClearCnt; // 격리 해제 수
	private int overFlowCnt; // 해외 유입 수
	private int localOccCnt; // 지역 발생 수
	
}
