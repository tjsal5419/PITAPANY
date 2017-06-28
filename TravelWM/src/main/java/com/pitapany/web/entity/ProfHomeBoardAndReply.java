package com.pitapany.web.entity;

import java.util.List;

public class ProfHomeBoardAndReply {
	MemberProfileBoard board;
	List<OnlyProfBoardReplyView> replyLists;
	
	public MemberProfileBoard getBoard() {
		return board;
	}
	public void setBoard(MemberProfileBoard board) {
		this.board = board;
	}
	public List<OnlyProfBoardReplyView> getReplyLists() {
		return replyLists;
	}
	public void setReplyLists(List<OnlyProfBoardReplyView> replyLists) {
		this.replyLists = replyLists;
	}
	
}
