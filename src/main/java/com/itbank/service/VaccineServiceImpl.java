package com.itbank.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.mapper.VaccineMapper;
import com.itbank.vo.VaccineVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class VaccineServiceImpl implements VaccineService {
	
	@Autowired
	private VaccineMapper mapper;
	
	@Override
	public void insertPf(VaccineVO vo) {
		mapper.insertPf(vo);
		log.info("Insert new Vaccine Platform info......" + vo);
		return;
	}

	@Override
	public void insertMf(VaccineVO vo) {
		mapper.insertMf(vo);
		log.info("Insert new Vaccine Menufacture info......" + vo);
		return;
	}

	@Override
	public void insertVaccine(VaccineVO vo) {
		mapper.insertVaccine(vo);
		log.info("Insert new Vaccine info......" + vo);
		return;
	}
	
	@Override
	public ArrayList<VaccineVO> getAllList() throws Exception {
		log.info("Access and searching recorded all vaccine informations......");
		ArrayList<VaccineVO> list = mapper.getAllList();
		log.info(list);
		return list;
	}
	
	@Override
	public int update(VaccineVO vo) {
		log.info("Recorded informations update now......" + vo);
		return mapper.update(vo);
	}

	@Override
	public int delete(VaccineVO vo) {
		log.info("Delete data from list now......");
		return mapper.delete(0);
	}
	
	@Override
	public void Reservate() {
		System.out.println("Vaccine reservation sites loading now......");
	}
	
	
}
