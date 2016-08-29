package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.ProgramPriceDao;
import fitness.dto.ProgramPriceDto;

@Service
public class ProgramPriceService {
	@Autowired ProgramPriceDao dao;
	
	public List<ProgramPriceDto> list(HashMap<String, Integer> map){
		return dao.list(map);
	}
}
