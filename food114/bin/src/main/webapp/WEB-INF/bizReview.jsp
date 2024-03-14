<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>첫번째 페이지</title>
<link rel="stylesheet" href="../css/review_biz.css">
</head>
<body>
	<header>
<<<<<<< HEAD
		<%@include file="main(header)_biz.html"%>
	</header>
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);">리뷰&nbsp;</span>
					<span style="font-size: 18px;">여기서 한번에 관리 하세요!</span>
				</h2>
				<div>
					<table class="review">
						<tr>
							<th
								style="width: 30px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								번호</th>
							<th
								style="width: 110px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								메뉴</th>
							<th
								style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								별점</th>
							<th
								style="width: 180px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								리뷰 내용</th>
							<th
								style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								작성자</th>
							<th
								style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								작성일</th>
							<th
								style="width: 30px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								답글</th>
							<th
								style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								관리</th>
						</tr>
						<tr v-for="(review, index) in reviews" :key="index">
							<td style="font-size: 13px">{{ index + 1 }}</td>
							<td class="reviewFont">{{ review.menuList }}</td>
							<td style="font-size: 12px"><span v-if="review.raiting >= 1">★</span>
								<span v-else>☆</span> <span v-if="review.raiting >= 2">★</span>
								<span v-else>☆</span> <span v-if="review.raiting >= 3">★</span>
								<span v-else>☆</span> <span v-if="review.raiting >= 4">★</span>
								<span v-else>☆</span> <span v-if="review.raiting >= 5">★</span>
								<span v-else>☆</span></td>
							<td class="reviewFont">{{ review.contents }}</td>
							<td class="reviewFont">{{ review.userId }}</td>
							<td class="reviewFont">{{ review.orderDate }}</td>
							<td><img v-if="review.status === 1" width="23" height="20"
								src="https://img.icons8.com/sf-black-filled/64/ff7f00/x.png"
								alt="x" /> <img v-else-if="review.status === 2" width="22"
								height="20"
								src="https://img.icons8.com/sf-black/64/ff7f00/circled.png"
								alt="circled" /></td>
							<td><button class="review-detail" @click="fnInfo(review)">자세히</button></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>

	<%@include file="main(footer)_biz.html"%>

</body>
</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {
			reviews : []
		// 받은 데이터를 저장할 배열
		},
		methods : {
			list : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "reviewBizList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.reviews = data.reviewBizList; // 받은 데이터를 배열에 할당
					}
				});
			},
			fnInfo : function(review) {
				$.pageChange("/bizReview_info.do", {reviewNo : review.reviewNo});
=======
		<%@include file="main(header).html"%>
	</header>
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);">리뷰&nbsp;</span>
					<span style="font-size: 18px;">여기서 한번에 관리 하세요!</span>
				</h2>
				<div>
					<table class="review">
						<tr>
							<th
								style="width: 40px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								번호</th>
							<th
								style="width: 110px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								메뉴</th>
							<th
								style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								별점</th>		
							<th
								style="width: 180px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								리뷰 내용</th>
							<th
								style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								작성자</th>
							<th
								style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								작성일</th>
							<th
								style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								답글</th>		
							<th
								style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								관리</th>
						</tr>
						<tr>
							<td>1</td>
							<td>오아저씨세트</td>
							<td style="color: #ffcc00;">★★★☆☆</td>
							<td>리뷰 남겨요 존맛탱이네요.</td>
							<td>아무개</td>
							<td>2024.03.01</td>
							<td><img width="23" height="20" src="https://img.icons8.com/sf-black-filled/64/ff7f00/x.png" alt="x"/></td>
							<td><button class="review-detail">자세히</button></td>
						</tr>
						<tr>
							<td>1</td>
							<td>오아저씨세트</td>
							<td style="color: #ffcc00;">★★★★★</td>
							<td>리뷰 남겨요 존맛탱이네요.</td>
							<td>아무개</td>
							<td>2024.03.01</td>
							<td><img width="23" height="20" src="https://img.icons8.com/sf-black-filled/64/ff7f00/x.png" alt="x"/></td>
							<td><button class="review-detail">자세히</button></td>
						</tr>
						<tr>
							<td>1</td>
							<td>오아저씨세트</td>
							<td style="color: #ffcc00;">★★★★☆</td>
							<td>리뷰 남겨요 존맛탱이네요.</td>
							<td>아무개</td>
							<td>2024.03.01</td>
							<td><img width="23" height="20" src="https://img.icons8.com/sf-black-filled/64/ff7f00/x.png" alt="x"/></td>
							<td><button class="review-detail">자세히</button></td>
						</tr>
						<tr>
							<td>1</td>
							<td>오아저씨세트</td>
							<td style="color: #ffcc00;">★★★☆☆</td>
							<td>리뷰 남겨요 존맛탱이네요.</td>
							<td>아무개</td>
							<td>2024.03.01</td>
							<td><img width="22" height="20" src="https://img.icons8.com/sf-black/64/ff7f00/circled.png" alt="circled"/></td>
							<td><button class="review-detail">자세히</button></td>
						</tr>
					</table>
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
		data : {},
		methods : {
			list : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "test.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
					}
				});
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git
			}
		},
		created : function() {
			var self = this;
			self.list();
		}
	});
</script>