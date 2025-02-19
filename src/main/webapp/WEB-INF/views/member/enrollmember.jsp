<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section id="enroll-container">
        <h2>회원 가입 정보 입력</h2>
        <form action="${path }/member/enrollmemberend.do" method="post" onsubmit="return fn_invalidate();" >
        <table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" placeholder="4글자이상" name="userId" id="userId_">
					<input type="button" value="중복확인" onclick="checkDuplicate();">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="password" id="password_" ><br>
				</td>
			</tr>
			<tr>
				<th>패스워드확인</th>
				<td>	
					<input type="password" id="password_2" ><br>
					<span id="checkResult"></span>
				</td>
			</tr>  
			<tr>
				<th>이름</th>
				<td>	
				<input type="text"  name="userName" id="userName" ><br>
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>	
				<input type="number" name="age" id="age"><br>
				</td>
			</tr> 
			<tr>
				<th>이메일</th>
				<td>	
					<input type="email" placeholder="abc@xyz.com" name="email" id="email"><br>
				</td>
			</tr>
			<tr>
				<th>휴대폰</th>
				<td>	
					<input type="tel" placeholder="(-없이)01012345678" name="phone" id="phone" maxlength="11" required><br>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>	
					<input type="text" placeholder="" name="address" id="address"><br>
				</td>
			</tr>
			<tr>
				<th>성별 </th>
				<td>
					<input type="radio" name="gender" id="gender0" value="M">
					<label for="gender0">남</label>
					<input type="radio" name="gender" id="gender1" value="F">
					<label for="gender1">여</label>
				</td>
			</tr>
			<tr>
				<th>취미 </th>
				<td>
					<input type="checkbox" name="hobby" id="hobby0" value="운동"><label for="hobby0">운동</label>
					<input type="checkbox" name="hobby" id="hobby1" value="등산"><label for="hobby1">등산</label>
					<input type="checkbox" name="hobby" id="hobby2" value="독서"><label for="hobby2">독서</label><br />
					<input type="checkbox" name="hobby" id="hobby3" value="게임"><label for="hobby3">게임</label>
					<input type="checkbox" name="hobby" id="hobby4" value="여행"><label for="hobby4">여행</label><br />
				</td>
			</tr>
		</table>
		<input type="submit" value="가입" >
		<input type="reset" value="취소">
        </form>
    </section>
    
<script type="text/javascript">
	const fn_invalidate=()=>{
		const userId=document.querySelector("#userId_").value;
		if(userId.length<4) {
			alert("아이디는 4글자 이상 입력해주세요");
			document.querySelector("#userId_").focus();
			return false;
		}
		const passwordReg=/(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()]).{8,}/;
		const password=document.querySelector("#password_").value;
		if(!passwordReg.test(password)){
			alert("비밀번호는 영문자, 숫자, 특수기호(!@#$%^&*())를 포함한 8글자 이상으로 입력해주세요.");
			return false;
		}
	}
	document.querySelector("#password_2").addEventListener("keyup",e=>{
		const password=document.querySelector("#password_").value;
		const passwordcheck=e.target.value;
			//e.target : 현재 이벤트 발생한 객체 불러올 때 사용
		const $span=document.querySelector("#checkResult");
		if(password.length>=4 && passwordcheck.length>=4) {
			if(password===passwordcheck) {
				$span.innerText="비밀번호가 일치합니다.";
				$span.style.color="green";
				document.querySelector("input[value='가입']").disabled=false;
			} else {
				$span.innerText="비밀번호가 일치하지 않습니다.";	
				$span.style.color="red";
				document.querySelector("input[value='가입']").disabled=true;
					//가입 버튼이 아예 안눌리도록 
				/* e.target.value="";
				document.querySelector("#password_").value="";
				document.querySelector("#password_").focus(); */
					//이걸 이용하면 비밀번호 잘못 이용됐을 때 비밀번호 사라짐
			}
		}
	});

	const checkDuplicate=()=>{
		const userId = document.querySelector("#userId_").value;
		if(!userId) {
			alert("아이디를 입력해주세요!");
			return;
		}
		window.open("${path}/member/idduplicate.do?userId="+userId,"_blank","width=400px, height=300px");
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>