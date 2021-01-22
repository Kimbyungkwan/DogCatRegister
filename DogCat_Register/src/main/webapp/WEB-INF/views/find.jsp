<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- css -->
<link rel="stylesheet" href="/static/css/navbar.css">
<link rel="stylesheet" href="/static/css/find.css">
<!-- google font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/66d103909a.js" crossorigin="anonymous"></script>
<script defer src="/static/js/navbar.js"></script>
<script defer src="/static/js/find.js"></script>
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
                            <a href="/member/logout">
                                로그아웃
                            </a> 
                        </li>
                    </c:when>
                    <c:otherwise>  
                        <li class="navbar__menu__item login">
                            <a href="/member/login">
                                로그인
                            </a> 
                        </li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
        <i class="fas fa-bars menu__toggle"></i>
    </nav>

    <section class="find__hero">
        <h4 class="find__hero__title">
            잃어버린 동물을 같이 찾아주세요.<br>
            <img class="find__hero__title-img" src="/static/images/find/find__hero.png"/>
        </h4>
        <p class="find__hero__regist">찾아주세요</p>
    </section>
   
    <section class="findAnimal">
        <ul class="findAnimal__list">
        	<c:forEach items="${newLostPetList}" var="dto">
	            <li class="findAnimal__list__item" data-lost-pet-num="${dto.lost_pet_num}">
	                <div class="image-area">
	                    <img src="/static/${dto.lost_pet_photo}" alt="${dto.lost_pet_admin}_${dto.lost_pet_name}">
	                </div>
	                <div class="findAnimal__content">
                        <dl class="content-top">
                            <dt>이름</dt>   
                            <dd class="lost__pet__name">${dto.lost_pet_name}</dd>
                            <dt>나이</dt>
                            <dd class="lost__pet__age">${dto.lost_pet_age}</dd>
                            <dt>품종</dt>
                            <dd class="lost__pet__species">${dto.lost_pet_species}</dd>
                            <dt>거주지</dt>
                            <dd class="lost__pet__location">${dto.lost_pet_location}</dd>
                            <dt>잃어버린 날</dt>
                            <dd class="lost__pet__date">${dto.lost_pet_date}</dd>

                            <dd class="lost__pet__content">
                                
                                <c:choose>
                                    <c:when  test="${fn:length(dto.lost_pet_content) gt 50}">  
                                        ${fn:substring(dto.lost_pet_content,0,50) }...
                                    </c:when>         
                                    <c:otherwise>
                                        ${dto.lost_pet_content}
                                    </c:otherwise>
                                </c:choose>
                            </dd>
                        </dl>
	                    
	                </div>
	            </li>
		   </c:forEach>
        </ul>
        <div id="page">
		    <c:forEach 	var="pgn" items="${pageList}">
			    <c:choose>
			        <c:when test="${pgn.curPage}">  
						<p  class="now__page" href="/find/${pgn.pageNo}">${pgn.display}</p>
			        </c:when>         
			        <c:otherwise>
		    			<a class="num__box" href="/find/${pgn.pageNo}">${pgn.display}</a>
			         </c:otherwise>
			    </c:choose>
		    </c:forEach>
        </div>
    </section>
    <section class="lost__pet__detail__container">
        <div class="lost__pet__detail">
        
        </div>
        <i class="far fa-times-circle detail__close-btn"></i>
    </section>
    <section class="lost__pet__regist__container">
        <c:if test="${empty sessionScope.user}">
            <div class="user__empty__modal">
                <p> 로그인이 필요합니다.</p>
                  <h4 class="signUp__complete" onclick="signUpComplete()" >
                    닫기
                  </h4>
            </div>
        </c:if>
        <div class="img__box">
            <img class="regist__img" src="/static/images/default/regist__default.jpg" alt="regist__default">
            <label for="file__form">
                <i class="file__icon far fa-arrow-alt-circle-up"></i>
            </label>
            <input id="file__form" class="file__form form__upload__photo" type="file" name="filename" accept=".jpg,.jpeg,.png" >
        </div>
        <div class="upload__form__container">
            <div class="upload__form">
                <div class="form__slide-left">
                    <input type="text" name="lost_pet_admin" value="${user.user_Num}" class="form__user_Num" >
                    <input class="form__pet__name harf__form" type="text" name="lost_pet_name" placeholder="*동물 이름" maxlength="20" >
                    <input class=" harf__form" type="text" name="lost_pet_age"placeholder="동물 나이">
                    <input type="text" name="lost_pet_species" placeholder="품종" maxlength="20" >
                    <input class="form__pet__photo" type="text" name="lost_pet_photo">
                    <input class="form__pet__location" type="text" name="lost_pet_location" placeholder="*잃어버린 곳 ex)서울/중구" maxlength="20">
                    <input type="text" name="lost_pet_date" placeholder="잃어버린 날짜" maxlength="20" >
                </div>
                <div class="form__slide-right">
                    <p>내용</p>
                    <textarea class="form__pet__content" name="lost_pet_content" maxlength="500" cols="30" rows="10"></textarea>
                </div>
            </div>
            
            <div class="button__box">
                <div class="empty__message">
                    비어있는 칸이 존재합니다
                </div>
                <i class="fas fa-arrow-circle-right form__move__button"></i>
                <i class="fas fa-times-circle form__close-btn"></i>
                <i class="far fa-paper-plane form__send__button"></i>
            </div>
        </div>
    </section>
</body>
</html>
