package com.itbank.service;

import java.util.ArrayList;
import com.itbank.vo.VaccineVO;

public interface VaccineService {
	
	void insertPf(VaccineVO vo);
	
	void insertMf(VaccineVO vo);
	
	void insertVaccine(VaccineVO vo);
	
	ArrayList<VaccineVO> getAllList() throws Exception;
	
	int update(VaccineVO vo);
	
	int delete(VaccineVO info_no);

	public void Reservate();

}
