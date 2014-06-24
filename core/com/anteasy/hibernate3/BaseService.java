package com.anteasy.hibernate3;

import java.util.List;

import com.anteasy.common.tool.PageBean;

public interface BaseService {
	
	/* 更新、保存、删除、查找、取消*/
	public void update(Object pojo);

	public void save(Object pojo);

	public void saveOrUpdate(Object pojo);
	
	public void delete(Object pojo);

	public List<?> find(String sql);
	
	
	/*是否存在*/
	public Boolean isExist(String sql);
	public Boolean isExist(Object pojo,Object id);
	
	/* 通过ID查询对象*/
	public Object load(Object pojo, Object id);
	
	/* 查询pojo 成 页 */
	public PageBean queryForPage(int pageSize, int page, Object pojo,
			List<?> betweens);
	
	/* 查询sql 成 页 */
	public PageBean queryForPage(int pageSize, int page,String hql);
	
	/* 查询pojo转换sql语句 */
	public String querySql(Object pojo, List<?> betweens);
	
	/* 查询下一个语句 参数个数 方法重载 */
	public Long next(String type);
	
	public Long findNext(String clazz, String param);

	public Long findNext(String clazz, String param, String name, Long value);
	
	public Long findNext(String sql);
	
}
