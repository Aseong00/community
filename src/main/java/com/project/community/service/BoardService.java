package com.project.community.service;

import com.project.community.domain.BoardDto;
import com.project.community.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface BoardService {
    int getCount() throws Exception;

    int remove(Integer bno, String writer) throws Exception;

    int write(BoardDto boardDto) throws Exception;

    int modify(BoardDto boardDto) throws Exception;

    BoardDto read(Integer bno) throws Exception;

    List<BoardDto> getList() throws Exception;

    List<BoardDto> getPage(Map map) throws Exception;

    int getSearchResultCnt(SearchCondition searchCondition) throws Exception;

    List<BoardDto> getSearchResultPage(SearchCondition searchCondition) throws Exception;
}
