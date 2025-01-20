<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>풀스택 8기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css"/>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
</head>
<body>
<div id="header">
    <header>
        <h1>HelloMVC</h1>
        <div class="login-container">
            <c:if test="${sessionScope.loginMember==null }">
                <form action="${path }/member/login.do" method="post">
                    <table>
                        <tr>
                            <td>
                                <input type="text" name="userId" id="userId"
                                       placeholder="아이디입력" value="${cookie.saveId!=null?cookie.saveId.value:'' }">
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <input type="password" name="password" id="password"
                                       placeholder="패스워드입력">
                            </td>
                            <td>
                                <input type="submit" value="로그인" >
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="checkbox" name="saveId"
                                       id="saveId" ${cookie.saveId!=null?"checked":"" }>
                                <label for="saveId">아이디저장</label>
                                <input type="button" value="회원가입"
                                       onclick="location.assign('${path}/member/enrollmember.do');">
                            </td>
                        </tr>
                    </table>
                </form>
            </c:if>
            <c:if test="${sessionScope.loginMember!=null }">
                <table id="logged-in">
                    <tr>
                        <td colspan="2">
                                ${loginMember.userName } 님, 안녕하세요 :)
                        </td>
                    </tr>
                    <tr>
                        <td>
                                <%-- 							<input type="button" value="내정보보기" onclick="location.assign('${path }/member/memberinfo.do?id${sessionScope.loginMember.userId }');">
                                 --%>							<input type="button" value="내정보보기" onclick="fn_info();">
                        </td>
                        <td>
                            <input type="button" value="로그아웃" onclick="location.assign('${path }/member/logout.do');">
                        </td>
                    </tr>
                </table>
            </c:if>
        </div>
        <nav>
            <ul class="main-nav">
                <li class="home">
                    <a href="">Home</a>
                </li>
                <li id="notice">
                    <a href="">공지사항</a>
                </li>
                <li>
                    <a href="${path }/board/boardlist.do">게시판</a>
                </li>
                <li>
                    <a href="${path }/ajax/basicajax.do">ajax</a>
                </li>

                <c:if test="${loginMember!=null }">
                    <li>
                        <a href="${path }/chattingpage.do">채팅</a>
                    </li>
                </c:if>

                <c:if test="${loginMember.userId eq 'admin' }">
                    <li id="manager">
                        <a href="${path}/admin/memberList.do">회원 관리</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </header>
</div>

<script>
    const fn_info=()=>{
        location.assign('${path}/member/memberinfo.do?id=${sessionScope.loginMember.userId}');
    }
</script>