package fitness.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fitness.dao.QnaboardDao;
import fitness.dto.QnaboardDto;

@Service
public class QnaboardService {
	@Autowired QnaboardDao dao;
	
	public int qnaMaxNum(){
		return dao.qnaMaxNum();
	}
	public int qnaInsert(QnaboardDto dto){
		return dao.qnaInsert(dto);
	}
	public int qnaRe(QnaboardDto dto){//����ΰ�� step+1
		return dao.qnaRe(dto); 
	}
	//----------------------------| select |----------------------------//
	//��ü ���� ���� : qnaCount
	public int qnaCount(){
		return dao.qnaCount();
	}
	//��ȸ�� ���� :qnaAddHit 
	public int qnaAddHit(int qna_num){
		return dao.qnaAddHit(qna_num);
	}
	//��ü��Ϻ���
	public List<QnaboardDto> qnaListAll(HashMap<String, Integer> map){
		return dao.qnaListAll(map);
	}
	//���б�
	public QnaboardDto qnaListOne(int qna_num){
		return dao.qnaListOne(qna_num);
	}
	//----------------------------| update |----------------------------//	
	public int qnaUpdate(QnaboardDto dto){
		return dao.qnaUpdate(dto);
	}
	//----------------------------| delete |----------------------------//
	public int qnaDelete(int qna_num){
		return dao.qnaDelete(qna_num);
	}
	//----------------------------| �۰˻��ϱ� |----------------------------//
	public List<QnaboardDto> qnaSearch(HashMap<String, String> map){
		return dao.qnaSearch(map);
	}
	//----------------------------| �۰˻��ϱ� |----------------------------//
	public int qnaAnswer(QnaboardDto dto){
		return dao.qnaAnswer(dto);
	}

}
