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
	public int qnaRe(QnaboardDto dto){//답글인경우 step+1
		return dao.qnaRe(dto); 
	}
	//----------------------------| select |----------------------------//
	//전체 글의 갯수 : qnaCount
	public int qnaCount(){
		return dao.qnaCount();
	}
	//조회수 증가 :qnaAddHit 
	public int qnaAddHit(int qna_num){
		return dao.qnaAddHit(qna_num);
	}
	//전체목록보기
	public List<QnaboardDto> qnaListAll(HashMap<String, Integer> map){
		return dao.qnaListAll(map);
	}
	//글읽기
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
	//----------------------------| 글검색하기 |----------------------------//
	public List<QnaboardDto> qnaSearch(HashMap<String, String> map){
		return dao.qnaSearch(map);
	}
	//----------------------------| 글검색하기 |----------------------------//
	public int qnaAnswer(QnaboardDto dto){
		return dao.qnaAnswer(dto);
	}

}
