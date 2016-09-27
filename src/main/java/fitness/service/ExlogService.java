package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.ExlogDao;
import fitness.dto.ExerciseLogDto;

@Service
public class ExlogService {
	@Autowired ExlogDao exlogDao;
	
	public int exloginsert(ExerciseLogDto dto){
		return exlogDao.exloginsert(dto);
	}
	public List<ExerciseLogDto> exloglist(HashMap<String, Object> map){
		return exlogDao.exloglist(map);		
	}
	public int exloggetCount(){
		return exlogDao.exloggetCount();
	}
}
