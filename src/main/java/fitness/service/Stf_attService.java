package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.Stf_attDao;
import fitness.dto.AttListDto;
import fitness.dto.Stf_attDto;

@Service
public class Stf_attService {
	@Autowired Stf_attDao dao;
	public int insertService(Stf_attDto dto){
		return dao.insertDao(dto);
	}

	public List<AttListDto> listService(HashMap<String, Object> map){
		return dao.listDao(map);
	}
	public int sattCnt(HashMap<String, Object> map){
		return dao.sattCnt(map);
	}
}
