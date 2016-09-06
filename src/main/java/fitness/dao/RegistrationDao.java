package fitness.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import fitness.dto.ProperiodDto;
import fitness.dto.ProsignDto;
import fitness.dto.PtperiodDto;
import fitness.dto.PtsignDto;
import fitness.dto.RegistrationDto;

@Repository
public class RegistrationDao {
	@Autowired private SqlSession sqlSession;
	
	private String NAMESPACE="orm.mybatis.FinalMapper";
	
////////////////////////////////--| Insert |--////////////////////////////////	
	//----------| ȸ���������(insert)(���̺��: registration) |----------//
	public int regiInsert(RegistrationDto dto1){
		return sqlSession.insert(NAMESPACE+".regiInsert",dto1);
	}
	public int getRgnum(){//���� ū rg_num������
		return sqlSession.selectOne(NAMESPACE+".rgNum");
	}
	
	//----------| �ܰ�������(insert)(���̺��: prosign) |----------//
	public int prosignInsert(ProsignDto dto2){
		return sqlSession.insert(NAMESPACE+".prosignInsert", dto2);
	}
	
	//----------| pt������(insert)(���̺��: ptsign) |----------//
	public int ptsignInsert(PtsignDto dto3){
		return sqlSession.insert(NAMESPACE+".ptsignInsert", dto3);
	}
	//----------| �ܰ����� �Ⱓ���(insert)(���̺��: properiod) |----------//
	public int properiodInsert(ProperiodDto dto4){
		return sqlSession.insert(NAMESPACE+".properiodInsert",dto4);
	}
	//----------| pt���� �Ⱓ���(insert)(���̺��: ptperiod) |----------//
	public int ptperiodInsert(PtperiodDto dto5){
		return sqlSession.insert(NAMESPACE+".ptperiodInsert",dto5);
	}
//////////////////////////////--| select |--////////////////////////////////
	//----------| ȸ��������� ����¡ó��(select)(���̺��: registration) |----------//
	public int getCountRegi(){
		return sqlSession.selectOne(NAMESPACE+".getCountRegi");
	}
	//----------| ȸ��������� ��ü��Ϻ���(selectList)(���̺��: registration) |----------//
	public List<RegistrationDto> regiListAll(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE+".regiListAll",map);
	}
	
	//----------| ȸ����ȣ�� ���� ��������(rg_type)�� ��ü��Ϻ���(���̺��: prosign,ptsign) |----------//
	//�ܰ�����
	public ProsignDto prosignListone(HashMap<String, Integer> map1){
		return sqlSession.selectOne(NAMESPACE+".regiSimpleListOne",map1);
	}
	//-- �ܰ���, ��ϰ����� �̾ƿ���
	//<select id="regiSimpleListOneName" parameterType="int" resultType="">
	public ProsignDto prosignListoneName(String pro_code){
		return sqlSession.selectOne(NAMESPACE+".regiSimpleListOneName");
	}
	//PT����
	public PtsignDto ptsignListone(HashMap<String, Integer> map2){
		return sqlSession.selectOne(NAMESPACE+".regiPTListOne",map2);
	}
	//-- pt��, ��ϰ�����, Ƚ�� �̾ƿ��� 
	public PtsignDto ptsingListoneName(String pt_code){
		return sqlSession.selectOne(NAMESPACE+".regiPTListOneName");
	}
////////////////////////////////--| Update |--////////////////////////////////	
	//update�ϱ� ���� getInfo
	public RegistrationDto regiGetInfo(HashMap<String, Integer>map){
		return sqlSession.selectOne(NAMESPACE+".regiGetInfo",map);
	}
	
	//----------| ȸ���������(Update)(���̺��: registration) |----------//
	public int regiUpdate(RegistrationDto dto1){
		return sqlSession.update(NAMESPACE+".regiUpdate",dto1);
	}
	
	//----------| �ܰ�������(Update)(���̺��: prosign) |----------//
	public int prosignUpdate(ProsignDto dto2){
		return sqlSession.update(NAMESPACE+".prosignUpdate",dto2);
	}
	
	//----------| pt������(Update)(���̺��: ptsign) |----------//
	public int ptsignUpdate(PtsignDto dto3){
		return sqlSession.update(NAMESPACE+".ptsignUpdate",dto3);
	}
	
	//----------| �ܰ����� �Ⱓ���(Update)(���̺��: properiod) |----------//
	public int properiodUpdate(ProperiodDto dto4){
		return sqlSession.update(NAMESPACE+".properiodUpdate",dto4);
	}
	
	//----------| pt���� �Ⱓ���(Update)(���̺��: ptperiod) |----------//
	public int ptperiodUpdate(PtperiodDto dto5){
		return sqlSession.update(NAMESPACE+".ptperiodUpdate",dto5);
	}
////////////////////////////////--| Delete |--////////////////////////////////	
	//-- 4.delete �������� :prosign(�ܰ�������) table -->
	public int regiDel(int rg_num){
		return sqlSession.delete(NAMESPACE+".regiDel",rg_num);
	}
	public int prosignDel(int rg_num){
		return sqlSession.delete(NAMESPACE+".prosignDel",rg_num);
	}
	//-- 4.delete �������� :ptsign(pt���) table -->
	public int ptsignDel(int rg_num){
		return sqlSession.delete(NAMESPACE+".ptsignDel",rg_num);
	}
	//-- 4.delete �������� :properiod(�ܰ�-��Ⱓ���) table-->
	public int properiodDel(int rg_num){
		return sqlSession.delete(NAMESPACE+".properiodDel",rg_num);
	}
	//-- 4.delete �������� :ptperiod(pt-��Ⱓ���) table -->
	public int ptperiodDel(int rg_num){
		return sqlSession.delete(NAMESPACE+".ptperiodDel",rg_num);
	}
////////////////////////////////--| PTregister |--////////////////////////////////
	
	public RegistrationDto ptRe(int mem_num){
		return sqlSession.selectOne(NAMESPACE+".regtDetail",mem_num);
	}
	
}
