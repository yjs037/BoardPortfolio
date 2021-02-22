package com.board.vo;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
	
	private int page; // 현재 페이지 번호
	private int pageSize; //보여줄 개시글의 갯수
	
	private String searchType;
	private String keyword;
	
	public Criteria() {
		this.page = 1;
		this.pageSize = 10;
		this.searchType = null;
		this.keyword = null;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		} else {
			this.page = page;
		}
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		if(pageSize <= 0 || pageSize > 100) {
			this.pageSize = 10;
			return;
		} else {
			this.pageSize = pageSize;
		}
	}
	
	//페이징 처리 시작 값생성
	//멤버변수가 아니지만 getter와 setter를 생성하면 Mapper에서 접근가능
	// #{pageStart}
	public int getPageStart() {
		return (this.page-1) * this.pageSize;
	}
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", pageSize=" + pageSize + ", searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}
	
	public String makeQuery() {
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", this.pageSize);
		if(searchType != null) {
			uriComponentsBuilder
				.queryParam("searchType", this.searchType)
				.queryParam("keyword", this.keyword);
		}else {
			
		}				
		return uriComponentsBuilder.build().encode().toString();
	}
	
}


