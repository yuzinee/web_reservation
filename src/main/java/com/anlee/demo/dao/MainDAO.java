package com.anlee.demo.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mainDAO")
public class MainDAO {
	
	private final SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
    public MainDAO(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }
	
	// 단건 조회
	public Map<String, Object> selectOne(String queryId, Map<String, Object> selectMap) {
		
		return sqlSessionTemplate.selectOne(queryId, selectMap);
	}
	
	// 리스트 조회
	public List<Object> selectList(String queryId, Map<String, Object> selectMap) {
		
		return sqlSessionTemplate.selectList(queryId, selectMap);
	}
	
	// 등록
	public void insert(String queryId, Map<String, Object> insertMap) {
		
		sqlSessionTemplate.insert(queryId, insertMap);
	}
	
	// 수정
	public void update(String queryId, Map<String, Object> updateMap) {
		
		sqlSessionTemplate.update(queryId, updateMap);
	}
	
	// 삭제
	public void delete(String queryId, Map<String, Object> deleteMap) {
		
		sqlSessionTemplate.delete(queryId, deleteMap);
	}
}