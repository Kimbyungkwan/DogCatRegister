<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/animal.css">
<!-- google font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/66d103909a.js" crossorigin="anonymous"></script>
<script defer src="js/navbar.js"></script>
<script defer src="js/animal.js"></script>
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
                            <a href="member/login">
                                로그인
                            </a> 
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
        <i class="fas fa-bars menu__toggle"></i>
    </nav>

    <section class="animal__hero">
        <h4 class="animal__hero__title">
            현재 등록된 동물은<br>
            <p class="animal__hero__title-count">100</p>마리
        </h4>
    </section>
   
    <section class="pet__container">
        <ul class="pet__list">
            <li class="pet">
                <img class="pet__thmb" src="/upload/images/coco.jpg" alt="pet__img">
                <dl class="pet__content">
                    <dt>이름</dt>   
                    <dd class="pet__name">코코</dd>
                    <dt>나이</dt>
                    <dd class="pet__pet_age">8살</dd>
                    <dt>품종</dt>
                    <dd class="pet__pet_species">토이푸들</dd>
                    <dt>사는 곳</dt>
                    <dd class="pet__pet_location">서울/중구</dd>
                </dl>
            </li>
            <li class="pet">
                <img class="pet__thmb" src="/upload/images/coco.jpg" alt="pet__img">
                <dl class="pet__content">
                    <dt>이름</dt>   
                    <dd class="pet__name">코코</dd>
                    <dt>나이</dt>
                    <dd class="pet__pet_age">8살</dd>
                    <dt>품종</dt>
                    <dd class="pet__pet_species">토이푸들</dd>
                    <dt>사는 곳</dt>
                    <dd class="pet__pet_location">서울/중구</dd>
                </dl>
            </li>
        </ul>
    </section>
</body>
</html>