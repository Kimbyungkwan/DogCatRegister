<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" href="css/home.css">
<!-- google font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
                    <a href="about">
                        ABOUT
                    </a>
                </li>
                <li class="navbar__menu__item">
                    <a href="list">
                        동물목록
                    </a>
                </li>
                <li class="navbar__menu__item">
                    <a href="find">
                        찾아주세요
                    </a>
                </li>
                <li class="navbar__menu__item">
                    <a href="register">
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
    </nav>

    <!-- 메인이미지박스 -->
    <section class="hero__container">
        <div class="hero__content">
                <h4><span class="L_text">당신의<br></span> <span>반려동물을 등록하고<br></span><span>공유하세요.</span></h4>
                <div class="content-line"></div>
                <h5>동물을 보호하고 유실,유기를 방지 할 수 있어요.</h5>
                <a class="register__button" href="/">등록하기</a>
        </div>
    </section>

    <!-- 신규등록된 동물 -->
    <section class="mainAnimal newAnimal">
        <h3 class="mainAnimal__title newAnimal__title">
            신규 등록된 동물
        </h3>
        <h3 class="mainAnimal__welcome newAnimal__welcome">
            새로 오신것을 환영합니다!
        </h3>
        <ul class="mainAnimal__list newAnimal__list">
            <li class="newAnimal__list__item">
                <div class="image-area">
                    <img src="images/coco.jpg" alt="">
                </div>
                <div class="newAnimal__content">
                    <div class="content__bedge-area">
                        <p class="content__badge animal__country">
                            서울/중구
                        </p>
                        <div class="content__badge animal__type">
                            토이푸들
                        </div>
                        <div class="content__badge animal__name">
                            코코
                        </div>
                    </div>
                </div>
            </li>
            <li class="newAnimal__list__item">
                <div class="image-area">
                    <img src="images/coco.jpg" alt="">
                </div>
                <div class="newAnimal__content">
                    <div class="content__bedge-area">
                        <p class="content__badge animal__country">
                            서울/중구
                        </p>
                        <div class="content__badge animal__type">
                            토이푸들
                        </div>
                        <div class="content__badge animal__name">
                            코코
                        </div>
                    </div>
                </div>
            </li>
            <li class="newAnimal__list__item">
                <div class="image-area">
                    <img src="images/coco.jpg" alt="">
                </div>
                <div class="newAnimal__content">
                    <div class="content__bedge-area">
                        <p class="content__badge animal__country">
                            서울/중구
                        </p>
                        <div class="content__badge animal__type">
                            토이푸들
                        </div>
                        <div class="content__badge animal__name">
                            코코
                        </div>
                    </div>
                </div>
            </li>
            <li class="newAnimal__list__item">
                <div class="image-area">
                    <img src="images/coco.jpg" alt="">
                </div>
                <div class="newAnimal__content">
                    <div class="content__bedge-area">
                        <p class="content__badge animal__country">
                            서울/중구
                        </p>
                        <div class="content__badge animal__type">
                            토이푸들
                        </div>
                        <div class="content__badge animal__name">
                            코코
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </section>

    <!-- 잃어버린 동물 -->
    <section class="mainAnimal lostAnimal">
        <h3 class="mainAnimal__title lostAnimal__title">
            최근 잃어버린 동물
        </h3>
        <h3 class="mainAnimal__welcome lostAnimal__welcome">
            함께 찾아주세요.
        </h3>
        <ul class="mainAnimal__list lostAnimal__list">
            <li class="lostAnimal__list__item">
                <div class="image-area">
                    <img src="images/dmani.jpg" alt="">
                </div>
                <div class="lostAnimal__content">
                   
                </div>
            </li>
            <li class="lostAnimal__list__item">
                <div class="image-area">
                    <img src="images/dmani.jpg" alt="">
                </div>
                <div class="lostAnimal__content">
                    
                </div>
            </li>
        </ul>
    </section>

   
</body>
</html>