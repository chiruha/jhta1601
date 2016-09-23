package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.centerSalesSelectDao;
import fitness.dto.SalesSelectDto;

@Service
public class centerSalesSelectService {
	@Autowired centerSalesSelectDao dao;
	
	//------------------|지점별 월매출 검색하기(테이블명: member&registration join해서)|------------------//
	public List<SalesSelectDto> monthSelectSales(HashMap<String, Object> map){
		return dao.monthSelectSales(map);
	}
}
