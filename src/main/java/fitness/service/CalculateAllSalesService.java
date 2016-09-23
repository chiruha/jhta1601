package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.CalculateAllSalesDao;
import fitness.dto.IncomeDto;

@Service
public class CalculateAllSalesService {
	@Autowired CalculateAllSalesDao dao;
	//------------------|������ ������ �˻��ϱ�(���̺��: Income)|------------------//
	public List<IncomeDto> centerIncomeSelect(HashMap<String, Object> map){
		return dao.centerIncomeSelect(map);
	}
}
