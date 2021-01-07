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

function formClear() {
  const signUpFormList = document
    .querySelector('.signUp__form')
    .getElementsByTagName('input');
  Array.prototype.forEach.call(signUpFormList, input => {
    input.value = '';
  });
}
signUpFormBtn.addEventListener('click', () => {
  signUpContainer.classList.add('singUp__showing');
});
signUpFormCloseBtn.addEventListener('click', () => {
  formClear();
  signUpContainer.classList.remove('singUp__showing');
  messageTargetId.innerHTML = '';
});

// id check
const signUpIdCheck = document.querySelector('.signUp__id-check');
const signUpFormId = document.querySelector('.signUp__form-id');
const messageTargetId = document.querySelector('.sign__message-id');

const hangulTest = text => {
  const check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
  const regex = RegExp(check);
  return regex.test(text);
};

const fetchId = async formValue => {
  let response = await fetch('/member/signup/idcheck', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8',
    },
    body: formValue,
  });
  let result = await response.json();

  if (result.overlap) {
    messageTargetId.innerHTML = result.overlap;
    if (messageTargetId.classList.contains('sign__message-ok')) {
      messageTargetId.classList.remove('sign__message-ok');
    }
    return;
  }

  messageTargetId.classList.add('sign__message-ok');
  messageTargetId.innerHTML = result.message;
};

signUpIdCheck.addEventListener('click', e => {
  if (!signUpFormId.value) {
    messageTargetId.innerHTML = '입력창이 비어있습니다.';
    if (messageTargetId.classList.contains('sign__message-ok')) {
      messageTargetId.classList.remove('sign__message-ok');
    }
    return;
  }
  if (parseInt(signUpFormId.value[0])) {
    messageTargetId.innerHTML = '첫 글자가 숫자입니다.';
    if (messageTargetId.classList.contains('sign__message-ok')) {
      messageTargetId.classList.remove('sign__message-ok');
    }
    return;
  }
  if (hangulTest(signUpFormId.value)) {
    messageTargetId.innerHTML = '아이디는 영문과 숫자로만 이루어져야합니다.';
    if (messageTargetId.classList.contains('sign__message-ok')) {
      messageTargetId.classList.remove('sign__message-ok');
    }
    return;
  }
  fetchId(signUpFormId.value);
});

// pw check
const signUpformPwMatch = document.querySelector(
  '.sign__password__match-target'
);
const signUpformPw = document.querySelector('.sign__password__match');
const messageTargetPw = document.querySelector('.sign__message-pw');

signUpformPw.addEventListener('input', () => {
  if (signUpformPwMatch.value !== signUpformPw.value) {
    messageTargetPw.innerHTML = '비밀번호가 서로 다릅니다.';
  } else {
    messageTargetPw.innerHTML = '';
  }
});

// sign up

const signUpBtnPOST = document.querySelector('.signUp__button__POST');

const fetchSignUp = async obj => {
  let response = await fetch('/member/signup', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8',
    },
    body: JSON.stringify(obj),
  });
  let result = await response.json();

  console.log(result);
};
const formOBJ = postObj => {
  const signUpFormList = document
    .querySelector('.signUp__form')
    .getElementsByTagName('input');
  Array.prototype.forEach.call(signUpFormList, input => {
    if (input.dataset.sqlCol) {
      postObj[input.dataset.sqlCol] = input.value;
    }
  });
  fetchSignUp(postObj);
};

signUpBtnPOST.addEventListener('click', () => {
  const postForm = {};
  formOBJ(postForm);
  console.log(postForm);
});
