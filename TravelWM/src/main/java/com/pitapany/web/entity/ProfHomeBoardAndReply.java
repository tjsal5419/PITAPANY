package com.pitapany.web.entity;

import java.util.List;

public class ProfHomeBoardAndReply {
	MemberProfileBoard board;
	List<MemberProfileBoardReply> replyLists;
	
	public MemberProfileBoard getBoard() {
		return board;
	}
	public void setBoard(MemberProfileBoard board) {
		this.board = board;
	}
	public List<MemberProfileBoardReply> getReplyLists() {
		return replyLists;
	}
	public void setReplyLists(List<MemberProfileBoardReply> replyLists) {
		this.replyLists = replyLists;
	}

	
}
