package com.anteasy.hibernate3;

import java.util.List;

public interface BaseDAO {

	/* 更新、保存、删除、查找*/
	public void update(Object pojo);

	public void save(Object pojo);

	public void delete(Object pojo);

	public List<?> find(String sql);
	
	public void saveOrUpdate(Object pojo);
	
	/* 通过ID查询对象*/
	public Object load(Object pojo, String id);
	public Object load(Object pojo, Long id);
	
	/* 得到所有行 */
	public int getAllRowCount(String hql);

	/* 查询 成 页 */
	public List<?> queryForPage(final String hql, final int offset,
			final int length);


}
