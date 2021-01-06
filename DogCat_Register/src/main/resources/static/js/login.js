// login

const loginFormBtn = document.querySelector('.form__login-button');

const loginFormId = document.querySelector('.form__login-id');
const loginFormPw = document.querySelector('.form__login-pw');

const notMatch = document.querySelector('.input__notMatch');

loginFormBtn.addEventListener('click', e => {
  if (loginFormId.value.length == 0 || loginFormId.value === '') {
    notMatch.innerHTML = '아이디가 비어있습니다.';
    e.preventDefault();
    return;
  }
  if (loginFormPw.value.length == 0 || loginFormPw.value === '') {
    notMatch.innerHTML = '비밀번호가 비어있습니다.';
    e.preventDefault();
    return;
  }
});

// sign up form
const signUpFormBtn = document.querySelector('.form__signUp__button');
const signUpFormCloseBtn = document.querySelector('.signUp__button__cancle');
const signUpContainer = document.querySelector('.signUp__container');

signUpFormBtn.addEventListener('click', () => {
  signUpContainer.classList.add('singUp__showing');
});
signUpFormCloseBtn.addEventListener('click', () => {
  const signUpForm = document.querySelector('.signUp__form');
  const signUpFormList = signUpForm.getElementsByTagName('input');
  Array.prototype.forEach.call(signUpFormList, input => {
    input.value = '';
  });
  signUpContainer.classList.remove('singUp__showing');
});

// id check
const signUpIdCheck = document.querySelector('.signUp__id-check');
const signUpFormId = document.querySelector('.signUp__form-id');
const messageTarget = document.querySelector('.sign__message-id');

const testFetch = async formValue => {
  let response = await fetch('/member/signup/idcheck', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8',
    },
    body: formValue,
  });
  let result = await response.json();
  console.log(result.message);

  messageTarget.classList.add('sign__message-ok');
  messageTarget.innerHTML = result.message;
};

signUpIdCheck.addEventListener('click', e => {
  if (!signUpFormId.value) {
    messageTarget.innerHTML = '입력창이 비어있습니다.';
    if (messageTarget.classList.contains('sign__message-ok')) {
      messageTarget.classList.remove('sign__message-ok');
    }
    return;
  }
  if (parseInt(signUpFormId.value[0])) {
    messageTarget.innerHTML = '첫 글자가 숫자입니다.';
    if (messageTarget.classList.contains('sign__message-ok')) {
      messageTarget.classList.remove('sign__message-ok');
    }
    return;
  }
  testFetch(signUpFormId.value);
});

// sign up

const signUpBtn = document.querySelector('.signup__button');
