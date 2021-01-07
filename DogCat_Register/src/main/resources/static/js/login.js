// login check
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

// sign up form open and close
const signUpFormOpenBtn = document.querySelector('.form__signUp__button');
const signUpFormCloseBtn = document.querySelector('.signUp__button__cancle');
const signUpContainer = document.querySelector('.signUp__container');

// form close -> form clear
function formClear() {
  const signUpFormList = document
    .querySelector('.signUp__form')
    .getElementsByTagName('input');
  Array.prototype.forEach.call(signUpFormList, input => {
    input.value = '';
  });
}
signUpFormOpenBtn.addEventListener('click', () => {
  signUpContainer.classList.add('singUp__showing');
});
signUpFormCloseBtn.addEventListener('click', () => {
  formClear();
  signUpContainer.classList.remove('singUp__showing');
  messageTargetId.innerHTML = '';
  messageTargetPw.innerHTML = '';
});

// id check
const signUpIdCheck = document.querySelector('.signUp__id-check');
const signUpFormId = document.querySelector('.signUp__form-id');
const messageTargetId = document.querySelector('.sign__message-id');
const messageTargetPw = document.querySelector('.sign__message-pw');

// sign id form -> 입력폼에 한글을 찾아줌
const hangulTest = text => {
  const check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
  const regex = RegExp(check);
  return regex.test(text);
};

// 서버에 중복 아이디 체크 요청
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

// 비밀번호 서로 같은지 체크
const signUpformPwMatch = document.querySelector(
  '.sign__password__match-target'
);
const signUpformPw = document.querySelector('.sign__password__match');

signUpformPw.addEventListener('input', () => {
  if (signUpformPwMatch.value !== signUpformPw.value) {
    messageTargetPw.innerHTML = '비밀번호가 서로 다릅니다.';
  } else {
    messageTargetPw.innerHTML = '';
  }
});

// 회원가입
const signUpBtnPOST = document.querySelector('.signUp__button__POST');
const signUpFormNick = document.querySelector('.signUp__form-nickname');
const spinnerBox = document.querySelector('.spinner__box');

// 회원가입이 완료되면 로그인 폼으로
const signUpComplete = () => {
  spinnerBox.classList.remove('spinner__showing');
  formClear();
  signUpContainer.classList.remove('singUp__showing');
  messageTargetId.innerHTML = '';
  spinnerBox.innerHTML = `<div class="spinner"></div>`;
};

// 회원가입 요청
const fetchSignUp = async obj => {
  let response = await fetch('/member/signup', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8',
    },
    body: JSON.stringify(obj),
  });
  let result = await response.json();
  if (result.message == '가입 완료') {
    setTimeout(() => {
      spinnerBox.innerHTML = `
      <h4 class="signUp__complete" onclick="signUpComplete()" >
        가입완료
      </h4>
      `;
    }, 300);
  } else if (result.message == '가입 실패') {
    spinnerBox.classList.remove('spinner__showing');
  }
};

// 입력폼에 지정된 dataSet으로 Obj를 만들어서 가입요청보냄
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
  // 입력폼 최종 확인
  if (
    !messageTargetId.classList.contains('sign__message-ok') ||
    signUpformPwMatch.value.length == 0 ||
    signUpformPw.value.length == 0 ||
    signUpformPwMatch.value !== signUpformPw.value ||
    signUpFormNick.value.length == 0
  ) {
    console.log('가입 실패');
    return;
  }
  spinnerBox.classList.add('spinner__showing');
  formOBJ(postForm);
});
