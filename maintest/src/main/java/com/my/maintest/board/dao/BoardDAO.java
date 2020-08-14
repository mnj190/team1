package com.my.maintest.board.dao;

import java.util.List;

import com.my.maintest.board.vo.BcategoryVO;
import com.my.maintest.board.vo.BoardFileVO;
import com.my.maintest.board.vo.BoardVO;
import com.my.maintest.board.vo.HeadIdCategoryVO;

public interface BoardDAO {
	
	//게시판 카테고리 조회 
	List<BcategoryVO> selectBcategory();
	//게시판 말머리 조회
	List<HeadIdCategoryVO> selectHeadIdCategory();
	
	// 전체 게시글 조회 (default)
	List<BoardVO> selectArticles() ;	
	
	// 게시글 열람
	BoardVO selectArticle(long bnum);
	//게시글 조회수 갱신
	int updateBhits(long bnum);
	
	//게시글 등록
	int insertArticle(BoardVO boardVO);
	//첨부파일 등록
	int insertFiles(BoardFileVO boardFileVO);
	
	//게시글  수정
	int updateArticle(BoardVO boardVO);
	
	//게시글 삭제
	int deleteArticle(long  bnum);

	//게시글 답글 작성
	int insertRepliedArticle(BoardVO boardVO);
	//게시글 bstep +1 처리 (답글 등록 순위)  높을수록 오래된 답글
	int updateBstep(long bgroup, long bstep);
		
	
	
	
	//글 검색

	
	  //말머리
	
	  //제목
	//댓글 작성
	//댓글 수정
	//댓글 삭제 
	
	
	
	
}
