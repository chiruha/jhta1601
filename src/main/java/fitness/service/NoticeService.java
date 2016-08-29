package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.NoticeDao;
import fitness.dto.NoticeDto;

@Service
public class NoticeService {
	@Autowired NoticeDao noticeDao;
	
	public int insert(NoticeDto dto){
		return noticeDao.insert(dto);
	}
	public int getCount(){
		return noticeDao.getCount();
	}
	public int delete(int num){
		return noticeDao.delete(num);
	}
	public NoticeDto detail(int num){
		return noticeDao.detail(num);
	}
	public int update(NoticeDto dto){
		return noticeDao.update(dto);
	}
	public List<NoticeDto> list(HashMap<String, String> map) {
		return noticeDao.list(map);
	}
}
