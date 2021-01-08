<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootStrab -->

<!-- css -->
<link rel="stylesheet" href="css/navbar.css">
<link rel="stylesheet" href="css/regist.css">
<!-- google font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/66d103909a.js" crossorigin="anonymous"></script>
<script defer src="js/navbar.js"></script>
<script defer src="js/regist.js"></script>


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
    
   <section class="container">
       <ul class="tab__box">
            <li class="tab tab__active">동물 등록하기</li>
            <li class="tab">동물 관리하기</li>
       </ul>
       <section class="regist__form" data-tab="동물 등록하기">
            <div class="img__box">
                <img class="regist__img" src="../images/default/regist__default.jpg" alt="regist__default">
                <label for="file__form">
                    <i class="file__icon far fa-arrow-alt-circle-up"></i>
                </label>
                <input id="file__form" class="file__form upload__photo" type="file" name="filename" accept=".jpg,.jpeg,.png" >
            </div>
            
            <form class="upload__form" action="uploadOk" method="post">
                <input type="text" name="pet_admin" value="${user.user_Num}" class="user_Num" >
                <input class="pet__name" type="text" name="pet_name" placeholder="*동물 이름">
                <input type="text" name="pet_age"placeholder="동물 나이">
                <div class="radio__box">
                    <label><input checked="checked" type="radio" name="pet_type" value="강아지">강아지</label>
                    <label><input type="radio" name="pet_type" value="고양이">고양이</label>
                </div>
                <input type="text" name="pet_species" placeholder="품종">
                <input class="pet__photo" type="text" name="pet_photo">
                <input class="pet__location" type="text" name="pet_location"placeholder="*거주 지역 ex)서울/중구">
                
            </form>
            <p class="need__form">*은 필수 입력 항목입니다.</p>
            <button class="form__submit">등록</button>
       </section>
       <section class="pet__management" data-tab="동물 관리하기">
            <!-- Table -->
            <table class="pet__table">
                <thead class="pet__list">
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">이름</th>
                    <th scope="col">나이</th>
                    <th scope="col">종류</th>
                    <th scope="col">품종</th>
                    <th scope="col">상태</th>
                    <th scope="col">지역</th>
                  </tr>
                </thead>
              </table>
          </div>
       </section>
   </section>
   <div class="hover__img">
       <img src="/upload/images/dmani.jpg" alt="hover__img">
   </div>
   <!-- <section class="ad__box">
       
   </section> -->
</body>
</html>