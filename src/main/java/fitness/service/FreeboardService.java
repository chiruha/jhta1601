package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.FreeboardDao;
import fitness.dto.FreeboardDto;


@Service
public class FreeboardService {
	@Autowired FreeboardDao dao;
	public int insertService(FreeboardDto dto){
		return dao.insertDao(dto);
	}
	public int updateService(FreeboardDto dto){
		return dao.updateDao(dto);
	}
	public FreeboardDto detailService(int fb_num){
		return dao.detailDao(fb_num);
	}
	public List<FreeboardDto> listService(HashMap<String, Object> map){
		return dao.listDao(map);
	}
	public int deleteService(int num){
		return dao.deleteDao(num);
	}
	public int getfbCount(HashMap<String, Object> map){
		return dao.getfbCount(map); //
	}
	// Á¶È¸¼ö
	public int fbaddHit(int fb_num){
		return dao.fbaddHit(fb_num);
	}
	public int fbrep(FreeboardDto dto){
		return dao.fbrep(dto);
	}
	public int fbmaxnum(){
		return dao.fbmaxnum();
	}
}

