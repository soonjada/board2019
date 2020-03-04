<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head> -->

<%@include file="../header.jsp"%>

	


	<div>

		<p>
			<br />
		<h5>${member.userName } 님 환영합니다.</h5>
		<img src="${pageContext.request.contextPath }${member.userImg }" style="max-width: 50px; min-width:30px; max-height:50px; height:auto; border: 1px solid black;">
		</p>

		<%-- board/modify?bno=${view.bno} --%>
		<a href="/"> 홈화면 돌아가기</a>&nbsp;&nbsp; <a href="#" id="list_btn"
			onclick="move_Page()"> 목록 돌아가기</a>&nbsp;&nbsp;

		<c:if test="${view.writerId == member.userId}">

			<a href="javascript:move_modify()">게시물 수정</a>&nbsp;&nbsp;  
	
		<a href="javascript:move_delete()">게시물 삭제</a>
		</c:if>
	</div>
	<br />
	
	<!--  -->
	<c:if test="${view.writerType== '1' &&member.memType == '0' && view.writerId != member.userId}">
		<style>
			form{
			display: none;
			}
			#rep{
			display: none;
			}
		</style>
		
		<div class="input-group input-group-sm mb-3" id="tg">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">비밀글 패스워드</span>
			</div>
			<input type="password" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" id="boardPassck" value=""
				name="boardPassck" />
				
				<input type="button" value="확인" onclick="psck()">
		</div>
		
		<script>
			function psck() {
				
				var ps = document.getElementById("boardPassck").value;
				var f1 = document.getElementById("viewformm");
				var f2 = document.getElementById("reply_write_form");
				var tg = document.getElementById("tg");
				var retable = document.getElementById("rep");
				var pp = '<c:out value="${view.boardPass}" />';
				if(ps==pp){
					f1.style.display='block';
					f2.style.display='block';
					tg.style.display='none';
					retable.style.display='block';					
				}else{
					alert("비밀번호를 확인해 주세요");
					 document.getElementById("boardPassck").value = '';
					 document.getElementById("boardPassck").focus();
				}
				
				
				
			}
		</script>
		
	</c:if>
	<!--  -->

	<form method="get" id="viewformm">

		<input type="hidden" id="page" name="page" value="${scri.page}"
			readonly="readonly" /> <input type="hidden" id="perPageNum"
			name="perPageNum" value="${scri.perPageNum}" readonly="readonly" />
		<input type="hidden" id="searchType" name="searchType"
			value="${scri.searchType}" readonly="readonly" /> <input
			type="hidden" id="keyword" name="keyword" value="${scri.keyword}"
			readonly="readonly" />

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="title"
				value="${view.title}" readonly />
		</div>

		<div class="input-group input-group-sm mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-sm">작성자


				</span>
			</div>
			<input type="text" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-sm" name="writer"
				value="${view.writer}" readonly />
		</div>

		<!-- 12.02 add start -->
		<input type="hidden" class="form-control"
			aria-label="Sizing example input"
			aria-describedby="inputGroup-sizing-sm" name="writer"
			value="${view.writerId}" readonly />
		<!-- 12.02 add End -->


		
		<!-- 12.03 modify end --> 
		<!-- ---------------------------------------------------------------------------------- -->
		<!-- 12.09 modify st -->
		<div class="input-group">
			<div class="input-group-prepend" >
				<span class="input-group-text">내용</span>
			</div >
			<c:if test="${view.imgUrl != null}">
			<div style="align-content: center;">
				<img src="${pageContext.request.contextPath }${view.imgUrl }"
					class="img-fluid" alt="no image" style="max-width: 250px;" />
			</div>
		</c:if>
		
				<textarea class="form-control" aria-label="With textarea" cols="50"
					rows="5" name="content"  readonly>${view.content}
				</textarea>	

		</div>
		<!-- 12.03 modify end -->
		
		<!--  -->
		<!-- 12.03 modify st -->
		<c:if test="${view.imgUrl != null && delete != false}">
		<div class="input-group">
			<div class="input-group-prepend" >
				<span class="input-group-text">파일받기</span>
			</div >
			
			<div style="align-content: center; line-height: 40px; ">
				&nbsp;<a href="../fileupload/filedown?name=${view.imgUrl}&origin=${filename.originFileName}"> ${filename.originFileName } (${filename.fileSize }KB)</a>
			</div>

		</div>
		
		</c:if>
		<!-- 12.09 modify end -->
		<!--  -->
		
		
		<!-- ---------------------------------------------------------------------------------- -->		

	</form>

	<!-- <br /> -->

	<br />
	<br />
	
<div id="rep">

	<!-- 댓글 작성  시작 -->
	<div class="replyForm">
		<form id="reply_write_form" role="form" method="post"
			autocomplete="off">

			<input type="hidden" id="bno" name="bno" value="${list.bno}"
				readonly="readonly" /> <input type="hidden" id="page" name="page"
				value="${scri.page}" readonly="readonly" /> <input type="hidden"
				id="perPageNum" name="perPageNum" value="${scri.perPageNum}"
				readonly="readonly" /> <input type="hidden" id="searchType"
				name="searchType" value="${scri.searchType}" readonly="readonly" />
			<input type="hidden" id="keyword" name="keyword"
				value="${scri.keyword}" readonly="readonly" />


			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroup-sizing-sm">작성자
					</span>
				</div>
				<input type="text" class="form-control"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-sm" id="writer" name="writer"
					value="${member.userName }" readonly="readonly" />
			</div>

			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text">댓글</span>
				</div>
				<textarea class="form-control" aria-label="With textarea" cols="50"
					rows="2" id="content" name="content" escapeXml="true"></textarea>
			</div>

			<br />
			<p >
				<input type="button" class="btn btn-outline-secondary" type="button"
					id="button-addon1" onclick="if_javascript()" value="작성" />

			</p>
		</form>
	</div>
	<!-- 댓글 작성End -->
	<!-- 게시물 끝 -->

	<!-- 댓글 보여주기 시작 -->
	<%
		int i = 1;
	%>

	<!--  -->
	<table class="table table-condensed"  style="overflow: auto; ">

		<colgroup>
			<col width="10%">
			<col width="15%">
			<col width="20%">
			<col width="35%">
			<col width="10%">
		</colgroup>


		<thead class="thead-dark" style="text-align: center;">
			<tr>
				<th scope="col">순번</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">내용</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>

		<tbody>

			<c:forEach items="${replyList}" var="replyList">
				<tr style="text-align: center;">
					<td><%=i%></td>
					<td>${replyList.writer}</td>
					<td><fmt:formatDate value="${replyList.regDate}"
							pattern="MM/dd HH:mm" /><br /></td>
							<!-- word-break: break-all; word-wrap: break-word; 라인 정리 -->
					<td style="text-align: left;  height:auto;  overflow: auto;word-break: break-all; word-wrap: break-word; ">${replyList.content}</td>
					<td>
						<div>
							<a
								href="javascript:reply_delete_ck2('${replyList.writer}','${view.bno}','${replyList.rno}')">
								<button type="submit" class="btn btn-secondary btn-sm">삭제
								</button>
							</a>
						</div>
					</td>
				</tr>
				<%
					i++;
				%>
			</c:forEach>

		</tbody>

	</table>


	<!--  -->

	<!-- 댓글 보여주기 끝 -->

	<br />


</div>




<script>

/* 11.19 ver2 금지어 함수 시작 */
/* var result = 0; */
/* 11.19 ver2 금지어 시작 */
/* function fncRestrictedWord(wordTmp) {
try{
for ( i = 0; i < wordArr.length; i++ ) {
if ( wordTmp.indexOf(wordArr[i]) > -1 ) {
alert("Restricted Word Catched : " + wordArr[i]);

 
 	result = 1;
}
}
return true;
} catch ( exception ) {
// exception Expression
}
}

var wordArr = ['18아','18놈','18새끼','18뇬','18노','18것',
	'18','18넘','개년','개놈','개뇬','개새','개색끼','개세끼','개세이',
	'개쉐이','개쉑','개쉽','개시키','개자식','개좆','게색기','게색끼',
	'광뇬','뇬','눈깔','뉘미럴','니귀미','니기미','니미','도촬','되질래',
	'뒈져라','뒈진다','디져라','디진다','디질래','병쉰','병신','뻐큐','뻑큐',
	'뽁큐','삐리넷','새꺄','쉬발','쉬밸','쉬팔','쉽알','스패킹','스팽','시벌',
	'시부랄','시부럴','시부리','시불','시브랄','시팍','시팔','시펄','실밸','십8',
	'십쌔','십창','싶알','쌉년','썅놈','쌔끼','쌩쑈','썅','써벌','썩을년','쎄꺄',
	'쎄엑','쓰바','쓰발','쓰벌','쓰팔','씨8','씨댕','씨바','씨발','씨뱅','씨봉알',
	'씨부랄','씨부럴','씨부렁','씨부리','씨불','씨브랄','씨빠','씨빨','씨뽀랄','씨팍',
	'씨팔','씨펄','씹','아가리','아갈이','엄창','접년','잡놈','재랄','저주글','조까',
	'조빠','조쟁이','조지냐','조진다','조질래','존나','존니','좀물','좁년','좃','좆',
	'좇','쥐랄','쥐롤','쥬디','지랄','지럴','지롤','지미랄','쫍빱','凸','퍽큐','뻑큐',
	'빠큐','ㅅㅂㄹㅁ',' 바카라','필리핀','한방','카지노','아바타','세부아바타','세부카지노'
	,'온ㄹr인','ㅋrㅈl노','ㅇ rㅂrㅌr','ㅂrㅋrㄹr','ⓒⓞⓜ',' jonna',' mi쳤',
	' 가지가지',' 🍆',' 같은 새끼',' 개.웃',' 개오바',' 쌉',' 개간',' 럼들',' 시부럴',
	' 시뷰럴',' 씨부럴',' 씨뷰럴',' 시부렬',' 시뷰렬',' 씨부렬',' 씨뷰렬',' 쳐받는',' 그따구',
	' 닝기리',' 스벌',' 호로잡',' 개공감',' 개나 소나',' 개나소나',' 개넷',' 개년',' 개념빠가',
	' 개독',' 개련',' 개망',' 개무시',' 개무시',' 개무식',' 개민폐',' 개별로',' 개부랄',' 개빡',
	' 개사이다',' 개새기',' 개새끼',' 개 새끼',' 죶',' 개섹',' 개셈',' 개소리',' 개쉽',' 개싫',
	' 개쎔',' 개이뻐',' 개이쁨',' 개예뻐',' 개예쁜',' 개예쁨',' 개웃',' 개이득',' 개이뻐',
	' 개이쁘',' 개이쁨',' 개자식',' 개잼',' 개조아',' 개존',' 개좋',' 개죠',' 개짜증',
	' 개짱',' 개짲',' 개쩐',' 개쩔',' 개쩔',' 개힘들',' 계새끼',' 개저씨',' 김치녀',' 맘충',
	' tlqkf',' wlfkf',' 엿같',' 존낙',' 눈새',' 개꿀',' 지인지조',' 젖 같',' 졏 같',' 닥치세',
	' 에라이퉤',' 에라이 퉤',' 에라이퉷',' 에라이 퉷',' 슈벌',' 슈우벌',' 빻은',' 빻았',' 오진다',' 오져',
	' 골 빈',' 골1빈',' 골빈',' 글러 먹',' 글러먹',' 오짐',' 지들이',' 공개 처형',' 공개처형',' 관.종',' 관1종',
	' 관종',' 괘새끼',' 구1씹',' 구씹',' 그 나물에',' 그1켬',' 그나물에',' 그따위',' 그지 같',' 그지같',' 그켬',
	' 극1혐',' 극혐',' 기레기',' 기자레기',' 까내리',' 껒여',' 꼬라지',' 꼴갑',' 꼴값',' 꼴깝',' 꼴랑',' 꼴보기',
	' 꼴뵈기',' ㄴ1ㅇㄱ',' ㄴㅇ1ㄱ',' ㄴㅇㄱ',' 나;',' 나면갤',' 나빼썅',' 남1연갤',' 남1혐',' 남ㅇㄱ',' 남연1갤',
	' 넌씨눈',' 년놈',' 노무노무',' 노알라',' 서치해',' 핑끄',' 꼬라지',' 노인네',' 노친네',' 눈깔 파',' 눈깔파',
	' 늬믜',' 늬미',' 니년',' 니믜',' 니미럴',' 애미',' 앰',' ㄷㅇㅂ',' 닥1',' 닥2',' 닥전',' 닥후',' 덬',
	' 대가리',' 머갈',' 대갈',' 더럽네',' 정병',' 뚝배기',' 덜떨어',' 도랏',' 도랐',' 시바알',' 도른',' 돌앗구만'
	,' 돌앗나',' 돌앗네',' 돌았구만',' 은새끼',' 씨벌',' 돌았나',' 돌았네',' 둄마',' 뒈져',' 뒤져야',' 쓰레기새',
	' 쓰레기 새',' 씹뻐럴',' 또라인',' 개마이',' 시펄',' 쉬펄',' 쉬버',' 미친개',' 뇌피셜',' 뇌텅',' 뇌 텅',' 뇌1텅',
	' 뇌에',' 뒤져라',' 뒤져버',' 씨뻘',' 찝째끼',' 뒤져야지',' 뒤져요',' 뒤졌',' 뒤지겠',' 뒤지고싶',' 디지고',
	' D지고',' D쥐고',' 끼리끼리',' 개돼지',' 씹못',' 시바류',' 시바 ',' 미친~',' 시바라지',' 졸라 ',' 개같이',
	' ssㅑ',' 망해라',' 빡새끼',' 디져라',' 새끼야',' 찌질한',' ㅉ질한',' 아오ㅅㅂ',' 아오 ㅅㅂ',' 친구년',
	' 오지고',' 오지구',' 오지네',' 오졌',' 오지는',' 오찌고',' 오찌구',' 오찌네',' 오쪘',' 오쪗',' 5지',
	' 오g',' 오z',' 5쪗',' 5졌',' 5지구',' 5지고',' 5지네',' o졌',' o지구',' o지고',' o지네',' ㅈ리',
	' G리',' g리',' Z리',' z리',' 뇌텅',' 머리텅',' 뇌 텅',' 머리 텅',' 쪼다',' 새끼라',' 뒤지길',' 뒤진다',
	' 뒤질',' 디졌',' 디질',' 딴년',' 도라이',' 또라이',' 똘아이',' 멍청',' 듣보',' 뚫린 입',' 뚫린입',' 라면갤',
	' 런년',' 레1친',' 레기같',' 레기네',' 레기다',' 레친',' 롬들',' ㅁㅊ',' ㅁ친',' 망돌',' 막 내뱉',' 막내뱉',
	' 먹1금',' 먹금',' 먹끔',' ㅁ.ㄱ',' 먹.금',' 먹.끔',' ==',' 멍멍 소리',' 멍소리',' 멍멍이소리',' 명존',
	' 무개념',' 뭐래는',' 뭐임',' 뭐저래',' 뭔솔',' 믜칀',' 믜친',' 미1친',' 미시친발',' 미쳣네',' 미쳤나',
	' 미쳤니',' 미췬',' 미칀',' 미친ㅋ',' 미친새',' 미친 새',' 미친색',' 죽여버리고',' 죽여뿌고',' 죽여 버리고',
	' 죽여불고',' 미틴',' 및힌',' ㅂㄹ',' ㅂㅊ',' ㅂ크',' 발놈',' 별창',' 병1신',' 병1크',' 병맛',' 병신',
	' 병크',' 븅신',' 빠큐',' 뻐규',' 뻐큐',' 뻑유',' 뻑큐',' 뻨큐',' 뼈큐',' 뽄새',' 뽄세',' ㅄ',' ㅅ',
	'ㅂ',' ㅅ.ㅂ',' ㅅ1ㅂ',' ㅅ1발',' ㅅㄲ네',' ㅅㄲ들',' ㅅ루',' ㅅㅋ',' ㅅㅡ루',' 새1끼',' 새1키',' 새77ㅣ',
	' 새퀴',' 새킈',' 새키',' 색희',' 색히',' 샊기',' 샊히',' 샹년',' 섀키',' 섬숭이',' 성괴',' 솔1친',' 솔친',
	' 수준하고는',' 쉬이바',' 쉬이이',' 쉬이이이',' 슈1발',' 슈레기',' 슈발',' 슈ㅣ발',' 스.루',' 스ㄹㅜ',' 스죄',
	' 스타죄국',' 슨상님',' 싑창',' 시1발',' 이새끼',' 시미발친',' 시미친발',' 시발',' 시새발끼',' 씨새발끼',' 시부울',
	' 시방새',' 시벌탱',' 시볼탱',' 시빨',' 시이발',' 시친발미',' 시키가',' 시팔',' 거지같은',' 나쁜 새끼',' 개련',
	' 다꺼져',' 십창',' 십팔',' ㅆ1ㄺ',' ㅆ1ㅂ',' ㅆㄹㄱ',' ㅆㄺ',' ㅆㅂ',' 싸가지 없',' 싸가지없',' 쌍년',' 쌍놈',
	' 쌔끼',' 썅',' 썌끼',' 쒸펄',' 쓰1레기',' 쓰렉',' 씝창',' 씨1발',' 씨바라',' 씨발',' 씨방새',' 씨벌탱',' 씨볼탱'
	,' 씨빨',' 시바앙',' 시바시바',' 쉬발',' 개년',' 쳐마',' 개쩌',' 개 같',' ㅂㅁㄱ',' 처먹',' 씨이발',' 씨팔',' 씹귀',
	' 씹덕',' 씹새끼',' 씨빠빠',' 사새끼',' 씨바알',' 씹창',' 씹치',' 씹팔',' 씹할',' ㅇㅍㅊㅌ',' ㅇㅒ쁜',' 아닥',
	' 아오 시바',' 아오시바',' 안물안궁',' 앰창',' 얘쁘',' 얘쁜',' 얪',' 엠뷩신',' 엠븽신',' 엠빙신',' 엠생',' 엠창',
	' 엿이나',' 예.질',' 예1질',' 예질',' 옘병',' 오크',' 왜저럼',' 외1퀴',' 외퀴',' 은년',' 이따위',' 인간말종',
	' 一 一',' 一 ㅡ',' 一一',' 一ㅡ',' 입 털',' 입털',' ㅈㄴ',' ㅈ.ㄴ',' ㄱㄷ',' ㅈㄹ',' 자업자득',' 작작',' 잘또',
	' 저따위',' 절라',' 정떨',' 정신나갓',' 정신나갔',' 젼나',' 젼낰',' 졀라',' 졀리',' 졌같은',' 조낸',' 조녜',' 조온',
	' 조온나',' 족까',' 중립충',' 존 나',' 존 나',' 존','나',' 존.나',' 존1',' 존1나',' 존귀',' 존귘',' 존ㄴ나',' JMT',
	' 쥰내',' 존나',' 존버',' 존내',' 존똑',' 존맛',' 존멋',' 존싫',' 존쎄',' 존쎼',' 존예',' 존웃',' 존잘',' 존잼',
	' 존좋',' 존트',' 졸귀',' 졸귘',' 졸맛',' 졸멋',' 졸싫',' 졸예',' 졸웃',' 졸잼',' 졸좋',' 좁밥',' 좃',' 종나',
	' 좆',' 봊',' jot같',' 이 새끼',' 젗같',' 싸물어',' 아가리',' 닥쳐라',' 씨버럼',' 개쓰래기',' 쓰래기같',' 좆까',
	' 좇',' 죠낸',' 죠온나',' 죤나',' 죤내',' 죵나',' 죽어버려',' 줬같은',' 같은새끼',' 쥐랄',' 씹쌔',' 쥰나',' 쥰니',
	' 쥰트',' 즤랄',' 지 랄',' 지1랄',' 지뢰',' 지1뢰',' 지껄이',' 지랄',' 뚝딱',' 삐걱',' 지롤',' ㅉ',' 와꾸',
	' ㅅㅌㅊ',' ㅎㅌㅊ',' ㅍㅌㅊ',' 개삼성',' 꼴데',' 짱깨',' 짱께',' 쪼녜',' 쪽1바리',' 쪽바리',' 쪽발',' 쫀 맛',
	' 쫀1',' 쫀귀',' 쫀맛',' 쫂',' 쫓같',' 쬰잘',' 쬲',' 쯰질',' 찌1질',' 찍찍이',' 찎찎이',' 창년',' 창놈',' 凸',
	' 첫빠',' 쳐먹',' 쳐발라',' 취ㅈ',' 취좃',' 친 년',' 친 놈',' 친년',' 친노마',' 친놈',' 텐귀',' 텐덕',' 톡디',
	' 파1친',' 파친',' 피뎁',' 피뎊',' 피디에프',' 피디엪',' 피코',' 피해자 코스프레',' 피해자코스프레',' 핑1프',
	' 핑거프린세스',' 핑프',' ㅎㅃ',' 할많하않',' 할말하않',' 헛소리',' 혐석',' 호로새끼',' 새.끼',' 화낭년',
	' 화냥년',' 후.려',' 후1려',' 후1빨',' 후려',' 후빨',' 환멸',' 환1멸',' ㅗ',' ㅡ 一',' ㅡ ㅡ',' ㅡ一',
	' ————',' ㅡㅡ',' ㅡㅡ',' ㅡㅡ',' ส',' ค็',' ้',' ็',' zoomin.cur',' eventHostId',' m.instiz.net',
	' open.',' onchat',' ajax_comment',' stub-extra',' -stub',' line.me',' ask.fm',' adinc.co.kr',
	' vonvon',' superfeed',' lumieyes',' www.inlive',' apt_review',' showcat',' 쇼캣',' .pls',' stype=3',' $('
			,' bitly',' president.go.kr',' comment_memo',' onmouse',' onkey'


];
	
	 */

/* 11.19 ver2 금지어 함수 끝 */

	function reply_delete_ck(a){
		console.log(a);

		alert('지금유저'+'${member.userName}');
		if('${member.userName}' == a){
			alert("동일");
		}else{
			alert("다름");
		}
	}
	
	function reply_delete_ck2(writer,bno,rno){
		/* alert('rno = '+ rno);
		alert('bno = '+ bno);
		alert('지금유저'+'${member.userName}'); */
		if('${member.userName}' == writer){
			
			location.href="/board/replyDelete?bno=${view.bno}&rno="+rno+"&writer="+writer;
		}else{
			alert("댓글 작성자 본인만 지울 수 있습니다.");
		}
	}
	

	function if_javascript() {
		
		/*  */
		
		if(document.getElementById("content").value.trim() == ""){
			alert("공백만 입력되었습니다.");
			location.href = location.href;
		}else{
		
		
		var str = document.getElementById("content").value;
		var limit = 300;
		var strLength = 0;
        var strTitle = "";
        var strPiece = "";
        var check = false;
                 
        for (i = 0; i < str.length; i++){
            var code = str.charCodeAt(i);
            var ch = str.substr(i,1).toUpperCase();
            //체크 하는 문자를 저장
            strPiece = str.substr(i,1)
             
            code = parseInt(code);
             
            if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0))){
                strLength = strLength + 3; //UTF-8 3byte 로 계산
            }else{
                strLength = strLength + 1;
            }
             
            if(strLength>limit){ //제한 길이 확인
                check = true;
                break;
            }else{
                strTitle = strTitle+strPiece; //제한길이 보다 작으면 자른 문자를 붙여준다.
            }
             
        }
         
        if(check){
            alert(limit+"byte 를 초과할 수 없습니다.");
            return false;
        }
         
       
		/*  */

		if (confirm("정말 작성하시겠습니까??") == true) { //확인
		
			/* 글자수 제한 시작 */
			
			var length = document.getElementById("content").value.length;
		
		
		
		if(length > 300){
			alert("작성자는 필수항목입니다.");
			return false;
		}
			
			/* 글자수 제한 끝 */
			
			
			/* 특수문자 리플레이스 시작부분 */
			var str = document.getElementById("content").value;
					
			str = str.replace(/</g,"&lt;");
			 str = str.replace(/>/g,"&gt;");
			 str = str.replace(/\"/g,"&quot;");
			 str = str.replace(/\'/g,"&#39;");
/* 			 str = str.replace(/\n/g,"<br />"); */
			 
			 document.getElementById("content").value = str;
			
			 /* 특수문자 리플레이스 끝부분 */
			 
			var value = document.getElementById("writer").value;
			if (value == "") {
				alert("작성자는 필수항목입니다.");
			} else {
				
				/* 11.19 ver2 금지어 호출 시작 */
				fncRestrictedWord(document.getElementById("content").value);
				if(notword == 1){
					 console.log("금지어");
					 notword = 0;
					 return false;
				 }
				/* 11.19 ver2 금지어 호출 끝 */
				reply_write_form.submit();
			}

		} else { //취소

			return false;
		}
		}
	};
	
	function move_delete(){
		if(<%=i%>==1){
				if(${member.userName != view.writer}){
				alert("작성자만이 글을 삭제할 수 있습니다.");			
			}else{
				location.href="/board/delete?bno=${view.bno}";	
			}		
		}else{
			alert("댓글이 있으면 글을 삭제할 수 없습니다.");
		}
	};
	
	function move_modify(){
		//댓글있으면 글 수정 불가
		if(<%=i%>==1){
			
			if(${member.userName == view.writer}){
				location.href="/board/modify?bno=${view.bno}";
			}else{
				alert("작성자만이 글을 수정할 수 있습니다.");
			}		
		}else{
			alert("댓글이 있으면 글을 수정할 수 없습니다.");
		}	
	};
	
	/* function move_modify(){
				
		if(${member.userName == view.writer}){
			location.href="/board/modify?bno=${view.bno}";
		}else{
			alert("작성자만이 글을 수정할 수 있습니다.");
		}
	}; */
	

	function move_Page() {
		location.href = "/board/listSearch?page=${scri.page}&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}&keyword=${scri.keyword}"
	};

	function move_Page2() {
		alert();
		location.href = "/board/listSearch"
	};

	
</script>
<%@include file="../footer.jsp"%>
