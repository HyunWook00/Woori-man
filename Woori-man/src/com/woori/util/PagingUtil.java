package com.woori.util;


// 2023-02-24 노은하
public class PagingUtil
{
	// numPerPage : 한 페이지에 게시글 목록 몇개 보여줄건가용?
	// totalData : 전체 게시글 수
	public int getPageCount(int numPerPage, int totalData)
	{
		int pageCount = 0;
		
		pageCount = totalData / numPerPage;
		
		if (totalData%numPerPage != 0)
			pageCount++;
		
		return pageCount;
	}
	
	public String pageIndexList(int currentPage, int totalPage, String listUrl)
	{
		StringBuilder strList = new StringBuilder();
		
		int numPerBlock = 10;
		int currentPageSetup;
		
		int page;
		int n;
		
		if(currentPage==0)
			return "";
		
		if(listUrl.indexOf("?") != -1)
			listUrl = listUrl + "&";
		else
			listUrl = listUrl + "?";
		
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		
		if(currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
		
		if ((totalPage>numPerBlock) && (currentPageSetup>0))
			strList.append("<li><a href='" + listUrl + "pageNum=1' class='page-control first-page-control'>1</a></li>");
		
		n = currentPage - numPerBlock;
		
		if ((totalPage > numPerBlock) && (currentPageSetup > 0))
			strList.append("<a href='" + listUrl + "pageNum=" + n + "' class='page-control pre-page'>이전 페이지</a>");
		strList.append("<ul class='page-list'>");
		
		
		page = currentPageSetup + 1;
		while ((page <= totalPage) && (page <= currentPageSetup + numPerBlock))
		{
			if(page==currentPage)
				strList.append("<li><a class='page-control now-page'>" + page + "</a></li>");
			else
				strList.append("<li><a href='" + listUrl + "pageNum=" + page + "' class='page-control'>" + page + "</a></li>");
			page++;
		}
			
		n = currentPage + numPerBlock;
		
			
		if((totalPage>numPerBlock)&&(currentPageSetup + numPerBlock)<totalPage)
			strList.append("<li><a href='" + listUrl + "pageNum=1' class='page-control list-page-control'>" + totalPage + "</a></li>");
		
		strList.append("</ul>");
		if((totalPage - currentPageSetup) > numPerBlock)
			strList.append("<a href='" + listUrl + "pageNum=" + n + "' class='page-control next-page'>다음 페이지</a>");
		
		return strList.toString();	
	}
	
	
}
