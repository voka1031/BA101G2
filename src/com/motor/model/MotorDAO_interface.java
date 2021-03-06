package com.motor.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public interface MotorDAO_interface {
	public void insert(MotorVO motorVO);

	public void update(MotorVO motorVO);

	public void delete(String motno);

	public MotorVO findByPrimaryKey(String motno);

	public List<MotorVO> getAll();
	
	public List<MotorVO> fuzzyGetAll(String fuzzyValue);

	public Set<MotorVO> getMotorsByModelType(String modtype);

	public Set<MotorVO> getMotorsByLocNo(String locno);

	public Set<MotorVO> getMotorsByManuDate(Timestamp start_time, Timestamp end_time);
	
//	public List<MotorVO> getMotorsByAllStatus();

	public HashSet<MotorVO> getModtypeByLocNo(String locno);

	public List<MotorVO> getMotorsByModtypeAndLocno(String modtype, String locno);
	
	public List<MotorVO> getMotorsByLocno(String locno);

//以下為Hibernate用
	public void insertByHib(MotorVO motorVO);

	public void updateByHib(MotorVO motorVO);

	public void deleteByHib(String motno);

	public MotorVO findByPkByHib(String motno);

	public List<MotorVO> getAllByHib();

	public List<MotorVO> fuzzySearchByHib(String fuzzyValue);

	public List<MotorVO> getMotorsByModtypeByHib(String modtype);

	public void updateStatusByHib(String motno, String status);

	public void updateLocnoByHib(String motno, String locno);
}
