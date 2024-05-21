package com.anlee.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anlee.demo.dao.MainDAO;

@Service("mainService")
public class MainService {
	
	@Autowired
	MainDAO mainDAO;
	
	// 단건 조회
	public Map<String, Object> selectOne(String queryId, Map<String, Object> selectMap) throws Exception {

		return mainDAO.selectOne(queryId, selectMap);
	}
	
	// 단건 조회
	public List<Object> selectList(String queryId, Map<String, Object> selectMap) throws Exception {

		return mainDAO.selectList(queryId, selectMap);
	}
	
	// 등록
	public void insert(String queryId, Map<String, Object> insertMap) throws Exception {

		mainDAO.insert(queryId, insertMap);
	}
	
	// 수정
	public void update(String queryId, Map<String, Object> updateMap) throws Exception {

		mainDAO.update(queryId, updateMap);
	}
	
	// 삭제
	public void delete(String queryId, Map<String, Object> deleteMap) throws Exception {

		mainDAO.delete(queryId, deleteMap);
	}
}