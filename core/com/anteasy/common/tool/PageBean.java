package com.anteasy.common.tool;

import java.util.List;

public class PageBean {
	/* 数据list、所有行、总共页、当前页、页大小 */
	private List<?> list;
	private int allRow;
	private int totalPage;
	private int currentPage;
	private int pageSize;

	/* getter和setter */
	public List<?> getList() {
		return list;
	}

	public void setList(List<?> list) {
		this.list = list;
	}

	public int getAllRow() {
		return allRow;
	}

	public void setAllRow(int allRow) {
		this.allRow = allRow;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/* 判断边界;是否第一页、最后一页。是否有前驱、后续 */
	public boolean isFitstPage() {
		return currentPage == 1;
	}

	public boolean isLastPage() {
		return currentPage == totalPage;
	}

	public boolean isHasPreviusPage() {
		return currentPage != 1;
	}

	public boolean isHasNextpage() {
		return currentPage != totalPage;
	}

	/* 总页数 */
	public static int countTotalPage(final int pageSize, final int allRow) {
		int totalPage = allRow % pageSize == 0 ? allRow / pageSize : allRow
				/ pageSize + 1;
		return totalPage;
	}

	/* 计算当前页开始记录 */
	public static int countOffset(final int pageSize, final int currentPage) {
		final int offset = pageSize * (currentPage - 1);
		return offset;

	};

	/* 计算当前页 */
	public static int countCurrentPage(int page) {
		final int curPage = (page == 0 ? 1 : page);
		return curPage;
	}

}
