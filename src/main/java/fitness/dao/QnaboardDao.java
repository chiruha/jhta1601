package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.QnaboardDto;

@Repository
public class QnaboardDao {
	@Autowired private SqlSession sqlSession;
	
	private String NAMESPACE="orm.mybatis.FinalMapper";
//----------------------------| insert |----------------------------//	
	public int qnaMaxNum(){
		return sqlSession.selectOne(NAMESPACE+".qnaMaxNum");
	}
	public int qnaInsert(QnaboardDto dto){
		return sqlSession.insert(NAMESPACE+".qnaInsert",dto);
	}
	public int qnaRe(QnaboardDto dto){//답글인경우 step+1
		return sqlSession.update(NAMESPACE+".qnaRe",dto);
	}
//----------------------------| select |----------------------------//
	//전체 글의 갯수 : qnaCount
	public int qnaCount(){
		return sqlSession.selectOne(NAMESPACE+".qnaCount");
	}
	//조회수 증가 :qnaAddHit 
	public int qnaAddHit(int qna_num){
		return sqlSession.update(NAMESPACE+".qnaAddHit",qna_num);
	}
	//전체목록보기
	public List<QnaboardDto> qnaListAll(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE+".qnaListAll",map);
	}
	//글읽기
	public QnaboardDto qnaListOne(int qna_num){
		return sqlSession.selectOne(NAMESPACE+".qnaListOne",qna_num);
	}
//----------------------------| update |----------------------------//	
	public int qnaUpdate(QnaboardDto dto){
		return sqlSession.update(NAMESPACE+".qnaUpdate",dto);
	}
//----------------------------| delete |----------------------------//
	public int qnaDelete(int qna_num){
		return sqlSession.delete(NAMESPACE+".qnaDelete",qna_num);
	}
//----------------------------| 글검색하기 |----------------------------//
	public List<QnaboardDto> qnaSearch(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".qnaSearch",map);
	}
	//검색한 글의 갯수 구하기
	public int getQnaSearchCount(HashMap<String, Object> map){
		return sqlSession.selectOne(NAMESPACE+".getQnaSearchCount",map);
	}
//----------------------------| 답변하기 : step+1 |----------------------------//
	public int qnaAnswer(QnaboardDto dto){
		return sqlSession.update(NAMESPACE+".qnaRe",dto);
	}

}
