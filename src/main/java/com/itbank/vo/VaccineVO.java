package com.itbank.vo;

import lombok.Data;

@Data
public class VaccineVO {
	private String info_vp, info_vm, info_ages, info_prd, info_bs;
	private int info_no, info_num;
	private String pf_name, mf_name;
	private int pf_no, mf_no;
	
	@Override
	public String toString() {
		return "[info_no=" + info_no + ", info_vp=" + info_vp + ", info_vm=" + info_vm + ", info_ages=" + info_ages + ", info_num=" + info_num +", info_prd="
				+ info_prd + ", info_bs=" + info_bs + "]";
	}
	
	public String toStringPf() {
		return "[pf_no=" + pf_no + "pf_name=" + pf_name + "]";
	}
	
	public String toStringMf() {
		return "[mf_no=" + mf_no + "mf_name=" + mf_name + "]";
	}
}
