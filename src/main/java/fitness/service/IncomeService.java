package fitness.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.IncomeDao;
import fitness.dto.IncomeDto;

@Service
public class IncomeService {
	@Autowired IncomeDao dao;
	//------------------|�� ���� insert(���̺��: income)|------------------//
	public int centerInsert(IncomeDto dto){
		return dao.centerInsert(dto);
	}
}
