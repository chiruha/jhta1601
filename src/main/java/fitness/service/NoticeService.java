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
		//�۵���ϱ� �μ�Ʈ
		public int insert(NoticeDto dto){
			return noticeDao.insert(dto);
		}
		//�۸����ü���� ����Ʈ
		public int getNocCount(HashMap<String, Object> map){
			return noticeDao.getNocCount(map);
		}
		public List<NoticeDto> list(HashMap<String, Object> map){
			return noticeDao.listAll(map);
		}
		
		//���ϳ����� 
		public NoticeDto listOne(int nt_num){
			return noticeDao.listOne(nt_num);
		}
		
		//�ۻ����ϱ�
		public int NocDelete(int nt_num){
			return noticeDao.NocDelete(nt_num);
		}
		
		//�ۼ����ϱ�
		public int NocUpdate(NoticeDto dto){
			return noticeDao.NocUpdate(dto);
		}
		
		// ��ȸ��
		public int addHit(int nt_num){
			return noticeDao.addHit(nt_num);
		}
}
