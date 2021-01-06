<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" href="../css/navbar.css">
<link rel="stylesheet" href="../css/login.css">
<!-- google font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/66d103909a.js" crossorigin="anonymous"></script>
<script defer src="../js/navbar.js"></script>
<script defer src="../js/login.js"></script>
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
                <li class="navbar__menu__item login">
                    <a href="login">
                        로그인
                    </a> 
                </li>
            </ul>
        </div>
        <i class="fas fa-bars menu__toggle"></i>
    </nav>

    <section class="login__container">
        <div class="login__top-box">
            <img src="../images/login/login_left-1.png" alt="login">
        </div>
        <div class="login__bottom-box">
            <form class="login__form" method="post" action="/member/login">
                <input type="text" name="user_id" value="${user_id}" placeholder="ID" class="form__login-id">
                <input type="password" name="user_password" value="${user_pw}"placeholder="PASSWORD" class="form__login-pw">   
                <p class="input__notMatch">${notMatch }</p>
                <button type="submit" class="form__button form__login-button">로그인</button>
                <button type="button" class="form__button">회원가입</button>
            </form>
        </div>
    </section>
   
</body>
</html>