package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.RefundSeongjinDao;
import fitness.dto.MemberDto;
import fitness.dto.ProgramPriceDto;
import fitness.dto.ProsignDto;
import fitness.dto.PtPriceDto;
import fitness.dto.PtsignDto;
import fitness.dto.RefundSeongjinDto;
import fitness.dto.RegistrationDto;
@Service
public class RefundSeongjinService {
	@Autowired RefundSeongjinDao dao;
	//--------------------| 환불할 회원 검색하기 |--------------------//
	public List<RegistrationDto> memRegiRefundSearch(HashMap<String, Object> map){
		return dao.memRegiRefundSearch(map);
	}
	//--------------------| 환불할 회원 검색한 글의 갯수 구하기(페이징처리)  |--------------------//
	public int getMemSearchCount(HashMap<String, Object> map){//페이징처리(count구하기)
		return dao.getMemSearchCount(map);
	}
	//--------------------| 환불할 회원 등록지점정보 얻어오기  |--------------------//
	public MemberDto regiRefundCenter(HashMap<String, Object> map){//페이징처리(count구하기)
		return dao.regiRefundCenter(map);
	}
	//------------------|단과과목회원 환불 '과목정보' select(테이블명: prosign/properiod)|------------------//
	public ProsignDto simpleSelect(HashMap<String, Object> map){
		return dao.simpleSelect(map);
	}
	//------------------|단과과목회원 환불 '가격정보' select(테이블명: prosign/programprice)|------------------//
	public ProgramPriceDto simplePriceSelect(HashMap<String, Object> map){
		return dao.simplePriceSelect(map);
	}
	//------------------|단과과목 운동 총 수업일 계산하기(테이블명: properiod)|------------------//
	public int calculateSimpleOneday(HashMap<String, Object> map){
		return dao.calculateSimpleOneday(map);
	}
	//------------------|단과과목 운동 총 잔여일 계산하기(테이블명: properiod)|------------------//
	public int calculateSimpleRemnant(HashMap<String, Object> map){
		return dao.calculateSimpleRemnant(map);
	}
	//------------------|pt과목회원 환불 '과목정보' select(테이블명: ptsign/ptperiod)|------------------//
	public PtsignDto ptSelect(HashMap<String, Object> map){
		return dao.ptSelect(map);
	}
	//------------------|pt과목회원 환불 '가격정보' select(테이블명: prosign/programprice)|------------------//
	public PtPriceDto ptPriceSelect(HashMap<String, Object> map){
		return dao.ptPriceSelect(map);
	}
	
	//------------------|PT과목 총 수업일(환불날짜) 계산하기(테이블명: ptperiod)|------------------//
	public int calculatePtOneday(HashMap<String, Object> map){
		return dao.calculatePtOneday(map);
	}
	//------------------|PT과목 잔여일(환불날짜) 계산하기(테이블명: ptperiod)|------------------//
	public int calculatePtRemnant(HashMap<String, Object> map){
		return dao.calculatePtRemnant(map);
	}
	
	//------------------|환불 insert(테이블명: refundseongjin)|------------------//
	public int refundSeongjinInsert(RefundSeongjinDto dto){
		return dao.refundSeongjinInsert(dto);
	}
}
