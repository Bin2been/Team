<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
<style>
[v-cloak] {
	display: none;
}

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
</style>
</head>
<link rel="stylesheet" href="../css/myPage_myInfo(updatePwd).css">
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>

	<!-- 광고창 -->
	<!--
        <div class="ad">
            광고창
            <button class="adClose">x</button>
        </div>
    -->
	<section>

		<div class="container">
			<%@include file="myPage_header.jsp"%>
			<div id="app" v-cloak>
				<div class="content" style="width: 880px;">
					<h2>
						<a href="javascript:;" style="font-size: 25px; color: #747171;">
							<span style="color: #ff7f00; font-weight: bold;">| </span>MY주소지
							관리
						</a>
					</h2>
					<div>
						<div class="table" v-for="info in list"
							style="margin-bottom: 10px;">
							<div style="border: 1px solid #c2bfbf; padding: 10px;">
								<div
									style="color: #555454; font-weight: bold; font-size: 17px; margin-bottom: 5px;">
									{{info.addrAs}} <span v-if="info.defaultYn=='Y'">(기본 주소지)</span>
								</div>
								<!-- <div class="row" style="border-top: none;">
									<div class="cell1">받는사람</div>
									<div class="cell2">{{info.name}}</div>
								</div> -->
								<div class="row">
									<div class="cell1">주소</div>
									<div class="cell2">{{info.oldAddr}}{{info.detail}}</div>
								</div>
								<div class="row">
									<div class="cell1">휴대폰번호</div>
									<div class="cell2">{{info.phone}}</div>
								</div>
								<div class="row" style="border-bottom: 1px solid #ccc">
									<div class="cell1">배송요청사항</div>
									<div class="cell2">{{info.request}}</div>
								</div>
								<!-- 모달창 -->
								<div class="modal-backdrop" id="Modal" v-if="modalFlg">
									<div class="modal-content"
										:style="{height: modalType=='phone'&&!phoneCheckFlg&&phoneCheckShow ?'270px':'220px'}">
										<h2 v-html="modalTitle">이름 변경</h2>
										<p style="color: #888; margin-top: none;" v-html="modalText">변경할
											주소를 입력해주세요.</p>
										<input class="modalInput" v-model="changeAddrValue" type="text"
											placeholder="주소" > <input style="text-align: left;"
											class="modalInput" v-model="changePhoneValue" type="text"
											placeholder="연락처"  id="phone"
											style="width: 200px"> <input class="modalInput"
											v-model="changeRequestValue" type="text" placeholder="배송 요청 사항"
											>


										<!-- 주소 변경시 -->
										<template v-if="modalType=='oldAddr'">
											<input class="modalInput" v-model="oldAddr" type="text"
												@input="fnConcat" placeholder="변경할 주소"
												style="width: 130px; margin-right: 5px;"> @ <input
												class="modalInput" v-model="oldAddr" type="text"
												@input="fnConcat" style="width: 130px;" placeholder="주소">
										</template>



										<!-- 연락처 변경시 -->
										<template v-if="modalType=='phone'">
											<button class="phone" @click="fnPhoneCheck"
												v-if="!phoneCheckShow&&!phoneCheckFlg">인증</button>
											<div style="color: #2196F3; font-size: 14px;"
												v-html="phoneCheckText" v-if="phoneCheckFlg">인증되었습니다</div>
											<div style="padding-left: 10px;" v-if="phoneCheckShow">
												<input class="modalInput" style="width: 125px;"
													placeholder="인증번호" v-model="phoneCheckInput">
												<button class="phone" @click="fnPhoneCheckConfirm">확인</button>
											</div>
											<div style="height: 20px">
												<div style="color: red; font-size: 14px;"
													v-html="phoneCheckText"
													v-if="!phoneCheckFlg&&phoneCheckShow">인증번호가 일치하지
													않습니다.</div>
											</div>
										</template>

										<!-- 배송요청사항 변경시 -->
										<template v-if="modalType=='request'">
											<input class="modalInput" v-model="request" type="text"
												@input="fnConcat" placeholder="배송요청사항"
												style="width: 130px; margin-right: 5px;"> @ <input
												class="modalInput" v-model="emailAddr" type="text"
												@input="fnConcat" style="width: 130px;" placeholder="주소">
										</template>


										<div>
											<button class="modalButton"
												@click="fnUpdate({oldAddr:changeAddrValue, phone:changePhoneValue, request:changeRequestValue})">저장</button>
											<button class="modalCancel" @click="cancelModal">닫기</button>
										</div>
									</div>
								</div>



								<div class="addrSelectDiv">
									<button @click="setDefaultAddr(info.addrNo)" class="addrSelect"
										style="display: inline;">기본주소지 설정</button>
									<button @click="openModal(info.addrNo)" class="addrUpdate"
										style="display: inline;">수정</button>
									<button @click="selectDelAddr(info.addrNo)" class="addrRemove"
										style="display: inline;">삭제</button>
								</div>
							</div>
						</div>
						<div class="row">
							<button @click="toggleTable" class="buttonSubmit"
								style="margin-left: 400px;">추가</button>
						</div>
					</div>
					<br>
					<div v-if="showTable"
						style="border-top: 1px solid #c2bfbf; overflow-y: auto; max-height: 500px;">
						<div>
							<div class="table" style="margin-bottom: 10px;">
								<div style="border: 1px solid #c2bfbf; padding: 10px;">
									<div
										style="color: #555454; font-weight: bold; font-size: 17px; margin-bottom: 5px;">
										| <input v-model="inputAddrAs" type="text"
											placeholder="별칭을 입력해주세요"> 🏠
									</div>
									<!-- <div class="row" style="border-top: none;">
									<div class="cell1">받는사람</div>
									<div class="cell2"><input type="text" placeholder="입력란(가칭)"></div>
								</div> -->
									<div class="row">
										<div class="cell1">주소</div>
										<div class="cell2">
											<input type="text" v-model="inputOldAddr"
												placeholder="시, 구, 동을 입력해주세요"><input
												v-model="inputDetail " type="text"
												placeholder="상세주소를 입력해주세요">
										</div>
									</div>
									<div class="row">
										<div class="cell1">휴대폰번호</div>
										<div class="cell2">
											<input v-model="inputPhone" type="text"
												placeholder="연락처를 입력해주세요">
										</div>
									</div>
									<div class="row" style="border-bottom: 1px solid #ccc">
										<div class="cell1">배송요청사항</div>
										<div class="cell2">
											<input v-model="inputRequest" type="text"
												placeholder="배송 요청 사항을 입력해주세요">
										</div>
									</div>
									<div class="addrSelectDiv">
										<button @click="" class="addrSelect" style="display: inline;">기본주소지
											설정</button>
									</div>
								</div>
							</div>
							<div class="row">
								<button @click="fnSubmit" class="buttonSubmit"
									style="margin-left: 400px;">추가</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="main(footer).html"%>
</body>

</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			info : {},
			sessionId : "${sessionId}",
			showTable : false,
			inputAddrAs : '',
			inputOldAddr : '',
			inputDetail : '',
			inputPhone : '',
			inputRequest : '',
			modalTitle : "",
			modalText : "",
			modalType : "",
			changeValue : "",
			changeAddrValue : "",
			changePhoneValue : "",
			changeRequestValue : "",
			modalFlg : false,
			addrNo : ''

		},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {
					userId : self.sessionId,
				};
				$.ajax({
					url : "myInfoAddr.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						console.log(self.list);
					}
				});
			},
			toggleTable : function() {
				var self = this;
				self.showTable = !self.showTable;
			},
			setDefaultAddr : function(addrNo) {
				var self = this;
				var nparmap = {
					userId : self.sessionId,
					addrNo : addrNo
				};
				$.ajax({
					url : "myInfoAddrListYn.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("기본 주소지로 변경되었습니다.");
							location.reload();
							return;
						} else {
							alert("오류가 발생하였습니다.");
						}
						self.info = data.info;
						console.log(data.info);
					}
				});
			},
			// 수정 클릭시 오픈 모달창
			openModal : function(addrNo) {
				var self = this;
				self.modalFlg = true;
				self.addrNo = addrNo;
				
			},
			/* 모달창 닫기 */
			cancelModal : function() {
				var self = this;
				self.modalFlg = false;
				self.changeValue = "";
				self.phoneCheckShow = false;
				self.phoneCheckFlg = false;
				self.phoneCheckText = "";
			},
			fnSubmit : function(info) {
				var self = this;
				var nparmap = {
					userId : self.sessionId,
					addrAs : self.inputAddrAs,
					oldAddr : self.inputOldAddr,
					detail : self.inputDetail,
					phone : self.inputPhone,
					request : self.inputRequest
				};
				$.ajax({
					url : "insertAddr.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("주소가 추가 되었습니다.");
							return location.href = "/myInfoAddr.do";
						} else {
							alert("오류가 발생하였습니다.");
						}
						self.info = data.info;
						console.log(data.info);
					}
				});
			},
			fnUpdate : function(map) {
				var self = this;
				/* map["userId"] = self.info.userId; */
				map["userId"] = self.sessionId;
				map["addrNo"] = self.addrNo;
				

				$.ajax({
					url : "updateAddr.dox",
					dataType : "json",
					type : "POST",
					data : map,
					success : function(data) {
						if (data.result == "success") {
							alert("정보가 수정되었습니다");
							self.cancelModal();
							self.fnList();
						} else {
							alert("실패");
						}
					}
				});
			},
			selectDelAddr : function(addrNo) {
				var self = this;
				var nparmap = {
					userId : self.sessionId,
					addrNo : addrNo
				};
				$.ajax({
					url : "deleteAddr.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("주소가 삭제 되었습니다.");
							return location.href = "/myInfoAddr.do";
						} else {
							alert("오류가 발생하였습니다.");
						}
						self.info = data.info;
						console.log(data.info);
					}
				});
			},
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>
