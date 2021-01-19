<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- css -->
<link rel="stylesheet" href="/static/css/navbar.css">
<link rel="stylesheet" href="/static/css/login.css">
<!-- google font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/66d103909a.js" crossorigin="anonymous"></script>
<script defer src="/static/js/navbar.js"></script>
<script defer src="/static/js/login.js"></script>
<title>Dog & Cat Register</title>
</head>
<body>
    <!-- 네비게이션 -->
    <nav id="navbar">
        <div class="navbar__container">
            <div class="navbar__logo">
                <h1><a href="/">Dog&Cat</a></h1>
            </div>
            <ul class="navbar__menu">
                <li class="navbar__menu__item">
                    <a href="/">
                        HOME
                    </a>
                </li>
                <li class="navbar__menu__item">
                    <a href="/animal">
                        동물목록
                    </a>
                </li>
                <li class="navbar__menu__item">
                    <a href="/find">
                        찾아주세요
                    </a>
                </li>
                <li class="navbar__menu__item">
                    <a href="/regist">
                        등록하기
                    </a>
                </li>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <li class="navbar__menu__item logout">
                            <a href="member/logout">
                                로그아웃
                            </a> 
                        </li>
                    </c:when>
                    <c:otherwise>  
                        <li class="navbar__menu__item login">
                            <a href="login">
                                로그인
                            </a> 
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
        <i class="fas fa-bars menu__toggle"></i>
    </nav>

    <section class="login__container">
        <div class="login__top-box">
            <img src="/static/images/login/login_left-1.png" alt="login">
        </div>
        <div class="login__bottom-box">
            <form class="login__form" method="post" action="/member/login">
                <input type="text" name="user_id" value="${user_id}" placeholder="ID" class="form__login-id" maxlength="20">
                <input type="password" name="user_password" value="${user_pw}"placeholder="PASSWORD" maxlength="20" class="form__login-pw">   
                <p class="input__notMatch">${notMatch }</p>
                <button type="submit" class="form__button form__login-button">로그인</button>
                <button type="button" class="form__button form__signUp__button ">회원가입</button>
            </form>
        </div>
    </section>
    <!-- sign up -->
    <section class="signUp__container">
        <h3 class="signUp__title">
            회원가입
        </h3>
        <form class="signUp__form" method="post" action="/member/signup">
            <div class="signUp__box">
                <input type="text" name="sign__id" value="${sign__id}" placeholder="ID" class="signUp__form-id"
                maxlength="20" data-sql-col="user_id">
                <button type="button" class="signUp__id-check" >확인</button>
            </div>
            <p class="input__notMatch sign__message-id" style="margin: 0.25rem 0 0.25rem 0;"></p>
            <input type="password" name="sign__password" value="${sign__pw}"placeholder="PASSWORD" maxlength="20" class="signUp__form-pw  sign__password__match-target" data-sql-col="user_password">  

            <input type="password" name="sign__password" value="${sign__pw}"placeholder="PASSWORD CHECK" maxlength="20" class="signUp__form-pw  sign__password__match">   
            
            <p class="input__notMatch sign__message-pw" style="margin: 0.25rem 0 0.25rem 0;"></p>

            <input type="text" name="sign__nickname" value="${sign__nickname}"placeholder="NICKNAME" maxlength="20" class="signUp__form-nickname" data-sql-col="user_nickname">

            <input type="email" disabled  name="sign__email" placeholder="EMAIL"  value="${sign__email}" maxlength="100" class="signUp__form-email" data-sql-col="user_email">

            <input type="text" disabled  name="sign__phone" placeholder="PHONE"   value="${sign__phone}" maxlength="20" class="signUp__form-phone"data-sql-col="user_phone">
            
            <button type="button"  class="form__button signUp__button signUp__button__POST">회원가입 </button>
            <button type="button" class="form__button signUp__button__cancle ">취소</button>
            <div class="spinner__box">
                <div class="spinner"></div>
            </div>
        </form>
    </section>
</body>
</html>