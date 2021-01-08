// tab  view
const tabBox = document.querySelector('.tab__box');

tabBox.addEventListener('click', e => {
  Array.prototype.forEach.call(tabBox.children, li => {
    console.log(li.innerHTML === e.target.innerHTML);
    if (li.innerHTML === e.target.innerHTML) {
      li.classList.add('tab__active');
    } else {
      li.classList.remove('tab__active');
    }
  });
});

// image upload
const fileForm = document.querySelector('.file__form');
const petPhoto = document.querySelector('.pet__photo');
const registImg = document.querySelector('.regist__img');

fileForm.addEventListener('change', e => {
  console.log(e.target.files[0]);
  fetchImg(e.target.files[0]);
});

// img fetch post
const fetchImg = async img => {
  const formData = new FormData();
  formData.append('imageFile', img);

  let response = await fetch('regist/fileUpload', {
    method: 'POST',
    body: formData,
  });
  let result = await response.json();
  console.log(result);
  petPhoto.value = result.src;
  registImg.src = result.src;
  fileForm.value = '';
};

// const imgObserver = new MutationObserver(e => {
//   console.log(registImg.width);
//   console.log(registImg.height);
// });
// const option = {
//   attributes: true,
//   characterData: true,
//   childList: true,
//   subtree: true,
//   attributeOldValue: true,
//   characterDataOldValue: true,
// };

// imgObserver.observe(registImg, option);
