package com.itbank.mapper;

import java.util.List;


import com.itbank.vo.ForeignVO;

public interface ForeignMapper {

	ForeignVO getInfo(int NationNum);

	List<ForeignVO> getAllList();

	ForeignVO NationNum(int NationNum);

}
