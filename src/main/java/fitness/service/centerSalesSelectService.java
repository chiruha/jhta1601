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
	
	//------------------|������ ������ �˻��ϱ�(���̺��: member&registration join�ؼ�)|------------------//
	public List<SalesSelectDto> monthSelectSales(HashMap<String, Object> map){
		return dao.monthSelectSales(map);
	}
}
