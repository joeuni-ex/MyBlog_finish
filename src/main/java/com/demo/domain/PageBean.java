package com.demo.domain;

public class PageBean {

	
	private int min;		//최소 페이지 번호
	private int max;		//최대 페이지 번호
	private int prevPage;	//이전 버튼의 페이지 번호
	private int nextPage;	//다음 버튼의 페이지 번호
	private int pageCnt;	//전체 페이지 개수
	private int currentPage;//현재 페이지 번호

	
	public PageBean(int contentCnt, int currentPage, int contentPageCnt,
					int paginationCnt) {
		
		//현재 페이지 번호
		this.currentPage = currentPage;
		//전체 페이지 개수
		pageCnt = contentCnt / contentPageCnt;
		if(contentCnt % contentPageCnt>0) {
			pageCnt++;
		}
		//페이지네이션 최소값, 최대값
		min = ((currentPage - 1)/paginationCnt) * paginationCnt+1;
		max = min + paginationCnt -1;
		//최대값이 실제 최대 페이지보다 크면 최대 페이지로 설정
		if(max>pageCnt) {
			max = pageCnt;
		}
		
		//이전 페이지 값, 다음 페이지 값
		prevPage = min-1;
		nextPage = max+1;
		
		//다음 페이지가 최대 페이지보다 크면 최대페이지로 설정
		if(nextPage>pageCnt){
			nextPage = pageCnt;
		}
	}
	
	//게터 생성
	public int getMin() {
		return min;
	}
	public int getMax() {
		return max;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	
	
	
}
