package com.itbank.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.itbank.vo.VaccineVO;

@Mapper
public interface VaccineMapper {

	public void insertPf(VaccineVO vo);
	
	public void insertMf(VaccineVO vo);
	
	public void insertVaccine(VaccineVO vo);
	
	ArrayList<VaccineVO> getAllList() throws Exception;
	
	public int update(VaccineVO vo);
	
	public int delete(int i);
	
}
