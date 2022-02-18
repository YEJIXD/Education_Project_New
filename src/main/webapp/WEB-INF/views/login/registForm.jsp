<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/login/regist.css">
<link rel="shortcut icon" href="#">
<title>Regist Form</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	//아이디 중복체크
	function idCheck(){
		$("#id_chk_unavailable").hide();
		$("#id_chk_available").hide();
		$("#id_chk_blank").hide();
		
		$.ajax({
			url:"idCheck.do",
			type:"post",
			dataType:"json",
			data:{"user_id" : $('#id').val()},
			success: function(data){
				if($("#id").val() != ''){
					if(data == 1){					
						$("#id_chk_unavailable").show();
					}else if(data == 0){
						$("#id").attr("title", "y");
						$("#id_chk_available").show();
						$("#user_name").focus();
					}
				}else{
					$("#id_chk_blank").show();
				}
			}
		})
	}
	
	//아이디 중복체크 확인
	function idChkConfirm(){
		var chk = document.getElementById("id").title;
		if(chk=="n"){
			alert("아이디 중복체크를 해주세요.");
			document.getElementById("id").focus();
		}
	}
	
	//비밀번호 일치
	$(function(){
		$("#pw_chk_available").hide();
		$("#pw_chk_unavailable").hide();
		
		$("#pw_chk").keyup(function(){
			var pw = $("#pw").val();
			var pw_chk = $("#pw_chk").val();
			
			if(pw != "" || pw_chk != ""){
				if(pw == pw_chk){
					$("#pw_chk_available").show();
					$("#pw_chk_unavailable").hide();
					$("#pw").attr("title", "y");
				}else{
					$("#pw_chk_available").hide();
					$("#pw_chk_unavailable").show();
				}
			}
		});
	});
	
	//비밀번호 일치 확인
	function pwChkConfirm(){
		var chk = document.getElementById("pw").title;
		if(chk=="n"){
			alert("비밀번호를 확인해주세요.");
			document.getElementById("pw").focus();
		}
	}
	var code = "";	//이메일전송 인증번호 저장하기 위한 코드
	
	//이메일 인증
	function emailCheck(){
		 var user_email = $(".user_email").val();        // 입력한 이메일
		 var checkBox = $(".user_email_injeong");		 // 인증번호 입력란

		 $.ajax({
		 	type:"GET",
		 	url:"emailCheck.do?user_email=" + user_email,
		 	success:function(data){
		 		//console.log("data: " + data);
		 		if(user_email != ''){
		 			$("#email_chk_blank").hide();
			 		checkBox.attr("disabled", false);
			 		checkBox.attr("id","user_email_injeong_true");
			 		$(".user_email_injeong").focus();
			 		code = data;
		 		}else{
		 			$("#email_chk_blank").show();
		 		}
		 	}
		 });
	}
	
	//인증번호 비교
	$(function(){
		$(".user_email_injeong").keyup(function(){
			var inputCode = $(".user_email_injeong").val();		//입력코드
			
			$("#email_chk_available").hide();
			$("#email_chk_unavailable").hide();
			
			if(inputCode == code){
				$("#email_chk_available").show();
				$("#email_chk_unavailable").hide();
				$("#user_email").attr("title", "y");
			}else{
				$("#email_chk_unavailable").show();
				$("#email_chk_available").hide();
			}
		});
	});
	
	//인증번호 일치 확인
	function emailChkConfirm(){
		var chk = document.getElementById("user_email").title;
		if(chk=="n"){
			alert("이메일 인증을 해주세요.");
			document.getElementById("user_email").focus();
		}
	}
	
	//null값 방지
	$(document).ready(function(){
		$("#submit").on("click", function(){
			if($("#id").val()==""){
				alert("아이디를 입력해주세요.");
				$("#id").focus();
				return false;
			}
			if($("#user_name").val()==""){
				alert("이름을 입력해주세요.");
				$("#user_name").focus();
				return false;
			}
			if($("#pw").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			}
			if($("#user_email").val()==""){
				alert("이메일을 입력해주세요.");
				$("#user_email").focus();
				return false;
			}
			if($("#user_addr").val()==""){
				alert("주소 입력해주세요.");
				$("#user_addr").focus();
				return false;
			}
			if($("#user_phone").val()==""){
				alert("핸드폰 번호를 입력해주세요.");
				$("#user_phone").focus();
				return false;
			}
		});
	})
</script>

<!-- 카카오 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function addr_search() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("user_addr").value = extraAddr;
                
                } else {
                    document.getElementById("user_addr").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("user_addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_addr_sub").focus();
            }
        }).open();
    }
</script>
<body>
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
	
    <div class="login_regist_wrap">
        <div class="regist_wrap">
            <div class="container">
                <a>회 원 가 입</a>
                <hr>
            </div>
            
            <div class="regist_form">
            <form action="memberRegist.do" method="post">
                <table width="550px">
                    <tr>
                        <col width="150px"> <col width="300px">
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td>
                            <input type="text" class="user_id" name="user_id" id="id" title="n" required="required" placeholder="아이디를 입력하세요." autofocus>
                            <input type="button" class="user_id_chk" value="중복 확인" onclick="idCheck();"><br>
                            <span class="divSpan" id="id_chk_available">사용가능한 아이디입니다.</span>
                            <span class="divSpan" id="id_chk_unavailable">중복된 아이디입니다.</span>
                            <span class="divSpan" id="id_chk_blank">아이디를 입력하세요.</span>
                        </td>
                    </tr>
                    <tr height="15"></tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" class="user_name" name="user_name" id="user_name" required="required" placeholder="이름을 입력하세요." onclick="idChkConfirm();"></td>
                    </tr>
                    <tr height="15"></tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" class="user_pw" name="user_pw" id="pw" title="n" required="required" placeholder="비밀번호를 입력하세요." onclick="idChkConfirm();"></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td>
                        	<input type="password" class="user_pw_chk" name="pw_chk" id="pw_chk" required="required" onclick="idChkConfirm();"><br>
                        	<span class="divSpan" id="pw_chk_available">비밀번호가 일치합니다.</span>
                            <span class="divSpan" id="pw_chk_unavailable">비밀번호가 일치하지 않습니다.</span>
                        </td>
                    </tr>
                    <tr height="15"></tr>
                    <tr>
                        <th>이메일</th>
                        <td>
                        	<input type="text" class="user_email" name="user_email" id="user_email" title="n" required="required" placeholder="이메일을 입력하세요." onclick="pwChkConfirm();">
                        	<input type="button" class="user_email_chk" value="인증번호" onclick="emailCheck();">
                        	<input type="text" class="user_email_injeong" name="user_email_injeong" id="user_email_injeong_false" required="required" disabled="disabled"><br>
                        	<span class="divSpan" id="email_chk_blank">이메일을 입력하세요.</span>
                        	<span class="divSpan" id="email_chk_available">인증번호가 일치합니다.</span>
                            <span class="divSpan" id="email_chk_unavailable">인증번호가 일치하지 않습니다.</span>
                        </td>
                    </tr>
                    <tr height="15"></tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            <input type="text" class="user_addr" name="user_addr" id="user_addr" required="required" placeholder="우편번호를 입력하세요." readonly="readonly">
                            <input type="button" class="user_addr_chk" value="주소 검색" onclick="addr_search();"><br>
                            <input type="text" class="user_addr_sub" name="user_addr_sub" id="user_addr_sub" required="required" placeholder="상세주소를 입력하세요." onclick="emailChkConfirm();">
                        </td>
                    </tr>
                    <tr height="15"></tr>
                    <tr>
                        <th>핸드폰 번호</th>
                        <td>
                            <input type="text" class="user_phone" name="user_phone" id="user_phone" required="required" placeholder="'-' 부호 없이 숫자만 입력하세요.">
                        </td>
                    </tr>
                </table>
                    <div class="regist_btn">
                        <input type="submit" class="subBtn" id="submit" value="가 입">
                        <input type="button" class="antBtn" value="취 소" onclick="location.href='index.do'">
                    </div>
            </form>
          </div>
        </div> 
    </div>
    
    <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>