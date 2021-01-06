const loginFormBtn = document.querySelector('.form__login-button');

const loginFormId = document.querySelector('.form__login-id');
const loginFormPw = document.querySelector('.form__login-pw');

const notMatch = document.querySelector('.input__notMatch');

loginFormBtn.addEventListener('click', e => {
  if (loginFormId.value.length == 0 || loginFormId.value === '') {
    notMatch.innerHTML = '아이디가 잘못됐습니다.';
    e.preventDefault();
    return;
  }
  if (loginFormPw.value.length == 0 || loginFormPw.value === '') {
    notMatch.innerHTML = '비밀번호가 잘못됐습니다.';
    e.preventDefault();
    return;
  }
});
