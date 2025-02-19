<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 중복확인</title>
</head>
<body>
<div id="checkId-container">
    <c:if test="${result }">
        [<span>${param.userId }</span>]는 사용가능합니다.
        <br><br>
        <button type="button" onclick="closeWin();">닫기</button>
    </c:if>
    <c:if test="${!result }">
        [<span id="duplicated">${param.userId }</span>]는 사용중입니다.
        <br><br>
        <!-- 아이디 재입력창 구성 -->
        <form action="${pageContext.request.contextPath }/member/idduplicate.do" method="get">
            <input type="text" name="userId" id="userId">
            <input type="submit" value="중복검사" >
        </form>
    </c:if>
</div>
<script>
    const closeWin=()=>{
        const $parentInput=opener.document.getElementById("userId_");
        console.log($parentInput);
        $parentInput.value="${userId}";
        $parentInput.readOnly=true;
        //중복확인 이후에 수정 불가하도록!
        $parentInput.style.backgroundColor="lightgray";
        close();
    }
</script>
</body>
</html>