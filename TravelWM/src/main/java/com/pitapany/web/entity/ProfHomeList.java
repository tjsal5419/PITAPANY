package com.pitapany.web.entity;

public class ProfHomeList {
	MemberProfileBoard boardList;
	MemberProfileBoardReply replyList;

	public ProfHomeList(MemberProfileBoard boardList, MemberProfileBoardReply replyList) {
		this.boardList = boardList;
		this.replyList = replyList;
	}

	public MemberProfileBoard getBoardList() {
		return boardList;
	}

	public void setBoardList(MemberProfileBoard boardList) {
		this.boardList = boardList;
	}

	public MemberProfileBoardReply getReplyList() {
		return replyList;
	}

	public void setReplyList(MemberProfileBoardReply replyList) {
		this.replyList = replyList;
	}

}
