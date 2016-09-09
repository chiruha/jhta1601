package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.Mem_attDao;
import fitness.dto.Mem_attDto;

@Service
public class Mem_attService {
	@Autowired Mem_attDao dao;
	public int insertService(Mem_attDto dto){
		return dao.insertDao(dto);
	}

	public List<Mem_attDto> listService(HashMap<String, Object> map){
		return dao.listDao(map);
	}

}
