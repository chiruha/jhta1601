package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.CalculateAllSalesDao;
import fitness.dto.CenterTotalSalesDto;
import fitness.dto.IncomeDto;
import fitness.dto.RefundSeongjinDto;

@Service
public class CalculateAllSalesService {
	@Autowired CalculateAllSalesDao dao;
	//------------------|지점별 월수입 검색하기(테이블명: Income)|------------------//
	public List<IncomeDto> centerIncomeSelect(HashMap<String, Object> map){
		return dao.centerIncomeSelect(map);
	}
	//------------------|지점별 월 환불 검색하기(테이블명: refundseongjin)|------------------//
	public List<RefundSeongjinDto> centerrefundselect(HashMap<String, Object> map){
		return dao.centerrefundselect(map);
	}
	//------------------|지점별 월 총매출 insert하기(테이블명: centertotalsales)|------------------//
	public int ctsInsert(CenterTotalSalesDto dto){
		return dao.ctsInsert(dto);
	}
}
