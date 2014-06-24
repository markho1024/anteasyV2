package com.anteasy.hibernate3;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

@Repository("baseDAO")
public class BaseDaoImpl extends HibernateDaoSupport implements BaseDAO{
	/* session方法 */
	@Autowired
	public void setSessionFactoryOverride(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	/* 更新、保存、删除、查找 */
	public void update(Object pojo) {
		this.getHibernateTemplate().update(pojo);
	}

	public void save(Object pojo) {
		this.getHibernateTemplate().save(pojo);
	}
	
	public void saveOrUpdate(Object pojo){
		this.getHibernateTemplate().saveOrUpdate(pojo);
	}

	public void delete(Object pojo) {
		this.getHibernateTemplate().delete(pojo);
	}
	
	public List<?> find(String sql) {
		return this.getHibernateTemplate().find(sql);
	}

	/* 通过ID查询对象  */
	public Object load(Object pojo, String id) {
		return this.getHibernateTemplate().get(pojo.getClass(), id);
	}
	public Object load(Object pojo, Long id) {
		return this.getHibernateTemplate().get(pojo.getClass(), id);
	}
	
	/* 得到所有行 */
	public int getAllRowCount(String hql) {
		return this.getHibernateTemplate().find(hql).size();
	}
	
	/* 查询 成 页 */
	public List<?> queryForPage(final String hql, final int offset,
			final int length) {
		List<?> list = this.getHibernateTemplate().executeFind(
				new HibernateCallback<Object>() {
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						query.setFirstResult(offset);
						query.setMaxResults(length);
						List<?> list = query.list();
						return list;
					}
				});
		return list;
	}

}
