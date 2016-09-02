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
		//글등록하기 인서트
		public int insert(NoticeDto dto){
			return noticeDao.insert(dto);
		}
		//글목록전체보기 리스트
		public int getNocCount(HashMap<String, Object> map){
			return noticeDao.getNocCount(map);
		}
		public List<NoticeDto> list(HashMap<String, Object> map){
			return noticeDao.listAll(map);
		}
		
		//글하나보기 
		public NoticeDto listOne(int nt_num){
			return noticeDao.listOne(nt_num);
		}
		
		//글삭제하기
		public int NocDelete(int nt_num){
			return noticeDao.NocDelete(nt_num);
		}
		
		//글수정하기
		public int NocUpdate(NoticeDto dto){
			return noticeDao.NocUpdate(dto);
		}
		
		// 조회수
		public int addHit(int nt_num){
			return noticeDao.addHit(nt_num);
		}
}
