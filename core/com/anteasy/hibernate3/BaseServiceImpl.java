package com.anteasy.hibernate3;

import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;

import com.anteasy.common.tool.PageBean;

@Service("baseService")
public class BaseServiceImpl implements BaseService {
	protected BaseDAO dao;

	/* getter和setter */
	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}

	/* 更新、保存、删除 查找 */
	public void update(Object pojo) {
		this.dao.update(pojo);
	}

	public void save(Object pojo) {
		this.dao.save(pojo);
	}

	public void saveOrUpdate(Object pojo) {
		this.dao.saveOrUpdate(pojo);
	}

	public void delete(Object pojo) {
		this.dao.delete(pojo);
	}

	public List<?> find(String sql) {
		return this.dao.find(sql);
	}

	public Boolean isExist(String sql) {
		boolean is = false;
		List<?> list = this.dao.find(sql);
		if (list != null) {
			for (Object ob : list) {
				if (ob != null) {
					is = true;
				}
			}
		}
		return is;
	}

	public Boolean isExist(Object pojo, Object id) {
		Object obj = "3561";
		if (id instanceof Long) {
			obj = this.dao.load(pojo, Long.parseLong(id.toString()));
		} else if (id instanceof String) {
			obj = this.dao.load(pojo, id.toString());
		}
		if (null == obj) {
			return false;
		}
		return true;

	}

	/* 通过ID查询对象 */
	public Object load(Object pojo, Object id) {
		Object obj = "3561";
		if (id instanceof Long) {
			obj = this.dao.load(pojo, Long.parseLong(id.toString()));
		} else if (id instanceof String) {
			obj = this.dao.load(pojo, id.toString());
		}
		return obj;
	}

	/* 查询sql 成 页 */
	public PageBean queryForPage(int pageSize, int page, String hql) {
		int allRow = dao.getAllRowCount(hql);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, page);
		final int length = pageSize;
		final int currentPage = PageBean.countCurrentPage(page);
		List<?> list = dao.queryForPage(hql, offset, length);

		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		return pageBean;
	}

	/* 查询pojo 成 页 */
	public PageBean queryForPage(int pageSize, int page, Object pojo,
			List<?> betweens) {
		final String hql = this.querySql(pojo, betweens);
		int allRow = dao.getAllRowCount(hql);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, page);
		final int length = pageSize;
		final int currentPage = PageBean.countCurrentPage(page);
		List<?> list = dao.queryForPage(hql, offset, length);

		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);

		return pageBean;
	}

	/* 查询pojo转换sql语句 */
	public String querySql(Object pojo, List<?> betweens) {
		Class<? extends Object> clazz = pojo.getClass();// 对象的类
		String tableName = clazz.getName();
		Field[] fields = clazz.getDeclaredFields();// 对象的属性数组

		Object fieldvaule = null;
		StringBuffer sql = new StringBuffer("");
		StringBuffer tab = new StringBuffer("from " + tableName);
		boolean start = true;// 判断是否是sql语句开始

		for (Field field : fields) {// 遍历属性数组，并生成sql语句
			field.setAccessible(true);// 忽略private
			field.getName();
			try {// 尝试得到属性值
				fieldvaule = field.get(pojo);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			if (null != fieldvaule && !"".equals(fieldvaule)
					&& !" ".equals(fieldvaule)) {// 属性不为空，添加到sql语句
				String td = start ? " where " : " and ";// 判断，是开始是用“where”，不是开始用“and”
				sql.append(td).append(
						field.getName() + "  = '" + fieldvaule + "'");
				start = false;// 让开始标志为false

			}
		}

		if (null != betweens) {
			Iterator<?> it = betweens.iterator();
			while (it.hasNext()) {// 时间查询语句
				String between = (String) it.next();
				if (null != between && !"".equals(between)) {
					String td = start ? " where " : " and ";
					sql.append(td).append(between);
					start = false;
				}
			}
		}

		tab.append("").append(sql);
		return tab.toString();
	}

	/* 查询下一个语句 参数个数 方法重载 */
	public Long next(String  name) {
		String pojo = name.substring(0, 1).toUpperCase() + name.substring(1);
		String pojoID = name + "ID";
		String sql = " select max(" + pojoID + ") from " + pojo;
		return this.findNext(sql);
	}
	public Long findNext(String clazz, String param) {
		String sql = " select max(" + param + ") from " + clazz;
		return this.findNext(sql);
	}

	public Long findNext(String clazz, String param, String name, Long value) {
		String sql = " select max(" + param + ") from " + clazz + " where "
				+ name + " = " + value;
		return this.findNext(sql);
	}

	public Long findNext(String sql) {
		long next = 0;
		@SuppressWarnings("unchecked")
		List<Long> list = (List<Long>) this.dao.find(sql);
		if (null != list) {
			for (Long longer : list) {
				if (null != longer) {
					next = longer+1;
				}
			}
		}
		return next;
	}
}
