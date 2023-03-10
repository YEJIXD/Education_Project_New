<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/course/appCourse.css">
<title>go_App</title>
<style type="text/css">
	table{
		width:30%;
		text-align:left;
	}
	
	.content{
		width: 100%;
		margin-left:10%;
		margin-right:10%;
	}
	
	.subBtn{ margin-left:22%; }

</style>
</head>
<body>
	<div id="header"><%@ include file="../../common/header.jsp" %></div>
	<div class="container">
		<form  action="/application/courseList" method="GET">
			<div class="content">
				<div class="beforeApp">
					<h3 class="beforeTitle">π κ΅μ‘μ μ²­ μ  νμΈμ¬ν­</h3><br>
					<p>CUBe Academy <b>λ‘κ·ΈμΈ ν</b>μ κ΅μ‘μ μ²­μ΄ κ°λ₯ν©λλ€. <b id="strong"> (νμκ°μμ )</b><br></p>
				</div>
				<br><br>
				<div class="beforeApp">
					<h3 class="beforeTitle">π κ΅μ‘μ μ²­ λ°©λ²</h3><br>
					<p class="stepText">β  μλ¨ λ©λ΄ 'κ΅μ‘ μ μ²­' λ²νΌ ν΄λ¦­ β π© μλ΄ μ¬ν­ μμ§ π©</p>
					<p class="stepImg"><img src="../resources/images/appStep/step1.png"></p><br>
					<hr>
					<p class="stepText">β‘ νλ¨μ 'κ΅μ‘ λ³΄λ¬κ°κΈ°' ν΄λ¦­ β κ΅μ‘ κ°μ λͺ©λ‘μΌλ‘ μ΄λ</p>
					<p class="stepImg"><img src="../resources/images/appStep/step2.PNG"></p><br>
					<hr>	
					<p class="stepText">β’ μνλ κ°μ ν΄λ¦­ β κ΅μ‘ μμΈλ³΄κΈ° λͺ©λ‘μΌλ‘ μ΄λ<br><br>β» μ μ μν νμΈ ν <b style="color:blue;">"μ  μ μ€"</b>μΈ κ°μλ₯Ό μ μ²­ν΄μ£ΌμΈμ : )</p>
					<p class="stepImg"><img src="../resources/images/appStep/step3.PNG"></p><br>
					<p class="stepText">β κ°μ λͺ¨μ§μΈμμ΄ λ€ μ°¨λ©΄ μ μκ° λ§κ°λ  μ μμ΅λλ€.<br>
					<hr>
					<p class="stepText">β£ κ΅μ‘ μμΈλ³΄κΈ°μμ κ΅μ‘ μ’λ₯, κ³Όμ  μ λ³΄, κ΅μ‘λΉ λ± μλ΄μ¬ν­μ λ°λμ νμΈ<br>β» μλ΄ λ―ΈνμΈ λλ μ°©μ€λ‘ μΈν λΆμ΄μ΅μ μ μ²­μ λ³ΈμΈμκ² μμ<br></p>	
					<p class="stepText">β κ°μ μ λ³΄ νμΈ ν, νλ¨μ μ μ²­ λ²νΌ ν΄λ¦­ β μ μ²­ μλ£<br>
					<p class="stepImg"><img src="../resources/images/appStep/step4.PNG" style="height:600px;"></p><br>
					<hr>
					<p class="stepText">β€ μ μ²­ μλ£ μ°½μ΄ λ¨λ©΄μ μ μ²­ μ λ³΄ νμΈ β νμΈ λ²νΌ ν΄λ¦­ μ, λ΄ κ°μμ€μ μκ°λ΄μ­μΌλ‘ μ΄λ<br></p>
					<p class="stepImg"><img src="../resources/images/appStep/step5.PNG"></p><br>
					<hr>
					<p class="stepText">β₯ My Classμμ μ μ²­ λ΄μ­ νμΈ<br></p>
					<p class="stepImg"><img src="../resources/images/appStep/step6.PNG"></p><br>
					<hr>
					<p class="stepText">* μκ° μ μ²­ μ·¨μλ₯Ό μν  μ, μκ° μ·¨μ μλμ μ·¨μ λ²νΌ ν΄λ¦­ <br>β 'μκ° μ μ²­μ μ·¨μνμκ² μ΅λκΉ?' μλ¦Όμ°½μμ 'νμΈ'λ²νΌμ λλ₯΄λ©΄ μ·¨μ μλ£<br><br>β» μλ΄ λ―ΈνμΈ λλ λ³ΈμΈ μ€μλ‘ μΈν λΆμ΄μ΅μ μ μ²­μ λ³ΈμΈμκ² μμ<br></p>
					<p class="stepImg"><img src="../resources/images/appStep/step7.PNG"></p><br>
					<hr>
				</div><br><br>
				<div class="beforeApp">
					<h3 class="beforeTitle">π κ΅μ‘ λμ λ° μλ΄</h3><br>
					<p><b>κ΅μ‘ λμ</b> : λ§ 18μΈ μ΄μ λ§ 70μΈ μ΄ν<br></p>
					<p><b>κ΅μ‘ μλ£μ¦ λ°κΈ</b>μ μκ°λ₯  85% μ΄μμ΄μ΄μΌ κ°λ₯ν©λλ€.<br></p>
					<p>κ΅μ‘ μ μ²­μ <b>μ μμ€μΈ κ΅μ‘λ§ κ°λ₯</b>ν©λλ€.<br></p>
				</div><br><br>
				<div class="beforeApp">
					<h3 class="beforeTitle">π κ΅μ‘ μ  μμλμ΄μΌ ν  μ¬ν­</h3><br>
					<p>μ€κ°μ ν¬κΈ°νμ€ κ²½μ°, ν΄λΉ μμ μ’λ£μΌλ‘λΆν° 1λΆκΈ° κ° λ€λ₯Έ κ΅μ‘μ λ€μΌμ€ μ μμ΅λλ€.<br><br></p>
				</div>		
				<input type="submit" class="subBtn" value="κ΅μ‘ λ³΄λ¬κ°κΈ°">
			</div>
		</form>
	</div>
	<div id="footer"><%@ include file="../../common/footer.jsp" %></div>	
</body>
</html>