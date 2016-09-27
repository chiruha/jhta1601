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
	//------------------|������ ������ �˻��ϱ�(���̺��: Income)|------------------//
	public List<IncomeDto> centerIncomeSelect(HashMap<String, Object> map){
		return dao.centerIncomeSelect(map);
	}
	//------------------|������ �� ȯ�� �˻��ϱ�(���̺��: refundseongjin)|------------------//
	public List<RefundSeongjinDto> centerrefundselect(HashMap<String, Object> map){
		return dao.centerrefundselect(map);
	}
	//------------------|������ �� �Ѹ��� insert�ϱ�(���̺��: centertotalsales)|------------------//
	public int ctsInsert(CenterTotalSalesDto dto){
		return dao.ctsInsert(dto);
	}
}
