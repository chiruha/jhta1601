package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.ProgramPriceDao;
import fitness.dto.MemberDto;
import fitness.dto.ProgramPriceDto;
import fitness.dto.PtPriceDto;

@Service
public class ProgramPriceService {
	@Autowired ProgramPriceDao dao;
	//------------------|회원번호 검색하기(테이블명: member)|------------------//
	
	public List<MemberDto> memNum(HashMap<String, Object> map){
		return dao.memNum(map);
	}
	/*
	public MemberDto memNum(int mem_num){
		return dao.memNum(mem_num);
	}
	*/
	//------------------|단과과목 select(테이블명: programprice)|------------------//
	public List<ProgramPriceDto> list(HashMap<String, Integer> map){
		return dao.list(map);
	}
	public ProgramPriceDto proPirce(String pro_name){//과목선택하면 해당가격 뽑아오기
		return dao.proPrice(pro_name);
	}
	//------------------|pt과목 select(테이블명: ptprice)|------------------//
	public List<PtPriceDto> ptlist(HashMap<String, Integer> map){
		return dao.ptlist(map);
	}
	public PtPriceDto ptPrice(String pt_name){//과목선택하면 해당가격 뽑아오기
		System.out.println("ptPrice Service: "+pt_name);
		return dao.ptPrice(pt_name);
	}
}
