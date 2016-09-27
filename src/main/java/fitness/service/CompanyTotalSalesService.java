package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.CompanyTotalSalesDao;
import fitness.dto.CenterTotalSalesDto;

@Service
public class CompanyTotalSalesService {
	@Autowired CompanyTotalSalesDao dao;
	//----------| 지점별 월 매출 현황 전체목록보기(selectList)(테이블명: centertotalsales) |----------//
	public List<CenterTotalSalesDto> ctsSelect(HashMap<String, Object> map){
		return dao.ctsSelect(map);
	}
}
