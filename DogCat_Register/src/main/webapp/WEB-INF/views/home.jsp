<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" href="css/home.css">
<!-- google font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script defer src="js/home.js"></script>
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
                    <div class="content-left">
                        <p>아무개</p>
                        <p>수컷</p>
                        <p>5살</p>
                        <p>래브라도 리트리버</p>
                    </div>
                    <div class="content-right">
                        <p>서울 용산</p>
                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corrupti alias quas aliquid animi delectus </p>
                    </div>
                </div>
            </li>
            <li class="lostAnimal__list__item">
                <div class="image-area">
                    <img src="images/dmani.jpg" alt="">
                </div>
                <div class="lostAnimal__content">
                    <div class="content-left">
                        <p>아무개</p>
                        <p>수컷</p>
                        <p>5살</p>
                        <p>래브라도 리트리버</p>
                    </div>
                    <div class="content-right">
                        <p>서울 용산</p>
                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corrupti alias quas aliquid animi delectus </p>
                    </div>
                </div>
            </li>
            <li class="lostAnimal__list__item">
                <div class="image-area">
                    <img src="images/dmani.jpg" alt="">
                </div>
                <div class="lostAnimal__content">
                    <div class="content-left">
                        <p>아무개</p>
                        <p>수컷</p>
                        <p>5살</p>
                        <p>래브라도 리트리버</p>
                    </div>
                    <div class="content-right">
                        <p>서울 용산</p>
                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corrupti alias quas aliquid animi delectus </p>
                    </div>
                </div>
            </li>
            <li class="lostAnimal__list__item">
                <div class="image-area">
                    <img src="images/dmani.jpg" alt="">
                </div>
                <div class="lostAnimal__content">
                    <div class="content-left">
                        <p>아무개</p>
                        <p>수컷</p>
                        <p>5살</p>
                        <p>래브라도 리트리버</p>
                    </div>
                    <div class="content-right">
                        <p>서울 용산</p>
                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Corrupti alias quas aliquid animi delectus </p>
                    </div>
                </div>
            </li>
        </ul>
    </section>

    <section class="mainAnimal notice">
        <h3 class="mainAnimal__title notice__title">
            알려드림
        </h3>
        <!--  heightx1 -> 15rem / 
              heightx2 -> 30rem -->
        <div class="notice__container">
            <div class="notice-card-left">
                <div class="notice-card heightx1" style='background-image: url("images/notice3.jpg");'>
                    <div class="notice__content">
                        <h3 class="notice__content-title">반려동물등록대상</h3>
                        <p class="notice__content-desc">태어난지 3개월 이상의 강아지는 3개월이 지난 날 부터 30일 이내에 동물등록을 의무적으로 해야한답니다. 2020년 3월부터는 2개월 이상부터 등록 대상이니 참고해주시면 좋을 것 같아요!
                        </p>
                    </div>
                </div>
                <div class="notice-card heightx1" style='background-image: url("images/notice2.jpg");'>
                    <div class="notice__content">
                        <h3 class="notice__content-title">미등록시 벌금 100만원!</h3>
                        <p class="notice__content-desc">반려동물등록대상에 해당하는 반려동물을 등록하지 않으면, 동물보호법에 따라 최대 100만원의 벌금을 지불해야 합니다! 자진 신고 기간이 끝나서 9월부터는 지역별로 미등록자와 동물 정보 변경 미신고자를 집중단속 한다고 해요.</p>
                    </div>
                </div></div>
            <div class="notice-card-right">
                <div class="notice-card heightx2"  style='background-image: url("images/notice1.jpg");'>
                    <div class="notice__content ">
                        <h3 class="notice__content-title">반려동물등록제란?</h3>
                        <p class="notice__content-desc">반려견과 견주를 연결하는 사랑의 끈 이라고 하죠. 반려동물에 대한 책임의식을 높여주는 역할을 하기도 합니다! 반려동물과 반려인에 대한 정보를 행정기관에 등록함으로써 반려동물을 잃어버린 경우, 등록정보를 통해 신속하게 반려동물을 찾을 수 있겠죠? 사랑하는 반려동물을 지켜주는 제도이며 반려동물 유기를 방지하기 위한 제도입니다.</p>
    
                    </div>
                </div>
            </div>
        </div>
    </section>
   
   <c:forEach items="${newPetlist}" var="dto">
   		${dto.pet_num}/${dto.pet_name}/${dto.pet_age}/${dto.pet_age}/${dto.pet_status}/${dto.pet_type}/${dto.pet_species}/${dto.pet_admin}/<br>
   </c:forEach>
</body>
</html>