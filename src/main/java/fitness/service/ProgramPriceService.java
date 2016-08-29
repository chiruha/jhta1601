package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.ProgramPriceDao;
import fitness.dto.ProgramPriceDto;
import fitness.dto.PtPriceDto;

@Service
public class ProgramPriceService {
	@Autowired ProgramPriceDao dao;
	//------------------|�ܰ����� select(���̺��: programprice)|------------------//
	public List<ProgramPriceDto> list(HashMap<String, Integer> map){
		return dao.list(map);
	}
	//------------------|pt���� select(���̺��: ptprice)|------------------//
	public List<PtPriceDto> ptlist(HashMap<String, Integer> map){
		return dao.ptlist(map);
	}
}
