/**
 * 페이지 로드 시 초기 상태 설정
 * 아이디(메일) 찾기
 * 비밀번호 찾기
 */

/* 전역변수 선언 */
var emailPassed = false;



$(document).ready(()=> {
    toggleForm('id'); // 초기 상태를 '아이디 찾기'로 설정
});

function toggleForm(formType) {
    if (formType === 'id') {
        $('#frm_find_id').show();
        $('.password-form').hide();
        $('#idTitle').css('color', 'rgb(37, 94, 188)');
        $('#passwordTitle').css('color', '');
    } else if (formType === 'password') {
        $('#frm_find_id').hide();
        $('.password-form').show();
        $('#idTitle').css('color', '');
        $('#passwordTitle').css('color', 'rgb(37, 94, 188)');
    }
}



// 아이디 찾기
$(document).ready(() => {
    $("#find_id").click(() => {

        let formData = {
          name: $("#name").val(),
          mobile: $("#mobile").val()
        };

        // 유효성 검사
        if (formData.name.trim() === "") {
            alert("이름을 입력하세요");
            return;
        }

        if (formData.mobile.trim() === "") {
            alert("전화 번호를 입력하세요");
            return;
        }

        $.ajax({
            type: "POST",
            url: "/user/findId.do",
            data: formData,
            success: (resData) => {
                if (resData.email === "") {
                    alert("조회 결과가 없습니다.");
                } else {
                    // 성공 시 화면에 결과를 출력
                    let maskedEmail = maskEmail(resData.email);
                    $("#result_id").html("<span>아이디는 " + maskedEmail + "입니다.</span>");
                }
            },
            error: (xhr) => {
                console.error("Error! Response Data:", xhr.responseText); // 콘솔에 출력
                alert("에러 발생: " + xhr.responseText);
            }
        });
    });
});


// '@' 기준으로 앞의 3글자를 '***'로 처리하는 함수
function maskEmail(email) {
    let atIndex = email.indexOf('@');

    if (atIndex > 0) {
        let username = email.substring(0, Math.max(atIndex - 3, 0)) + '***';
        let domain = email.substring(atIndex);
        return username + domain;
    } else {
        return email;  
    }
}

$(document).ready(() => {
  // 비밀번호 찾기
  $('#btn_getTempPw').click(() => {
    let email = $('#email').val();

    // 유효성 검사
    if (email.trim() === "") {
      alert("이메일을 입력하세요");
      return;
    }

    new Promise((resolve, reject) => {
      // 1. 정규식 검사
      let regEmail = /^[A-Za-z0-9-_]+@[A-Za-z0-9]{2,}([.][A-Za-z]{2,6}){1,2}$/;
      if (!regEmail.test(email)) {
        reject(1);
        return;
      }

      // 2. 이메일 중복 체크
      $.ajax({
        type: 'get',
        url: '/user/checkPwEmail.do',
        data: 'email=' + email,
        dataType: 'json',
        success: (resData) => {
          if (!resData.enableEmail) {          // 회원인 경우
            $('#msg_emailTmpPW').text('');
            resolve();
          } else {                            // 회원이 아닌 경우 
            reject(2);
          }
        }
      });
    }).then(() => {
      // 3. 임시 비번 인증 메일 발송
      $.ajax({
        type: 'post', 
        url: '/user/sendTmpCodes.do',
        contentType: 'application/json', 
        data: JSON.stringify({ email: email }), 
        success: (resData) => {
          console.log('Ajax 요청 성공', resData);
          alert(email + "로 인증코드를 전송했습니다.");
          $('#pwCode').prop('disabled', false);
                    $('#btn_verify_code').prop('disabled', false);
                    $('#btn_verify_code').click(() => {
                        emailPassed = $('#pwCode').val() === resData.pwCode;
                        if (emailPassed) {
                      console.log('Ajax 요청 성공', resData);

                            alert('이메일이 인증되었습니다. 메일함에 임시비밀번호를 확인하세요');
                              // 
                              $.ajax({
                                type:'post',
                                url: '/user/sendTmpPw.do',
                                 contentType: 'application/json', 
                                 data: JSON.stringify({ email: email }), 
                                 success: (resData2) => {
                                   console.log('Ajax 요청 성공', resData2);
                                   alert(email +"로 임시 비밀번호를 전송했습니다.");
                                   $('#btn_verify_code').prop('disabled', true);

                                 }
                              })

                        } else {
                            alert('이메일 인증이 실패했습니다.');
                        }
                    })
        },
      });
    }).catch((state) => {
      // Promise reject 시의 처리
      // console.error('Promise rejected with code:', state);
      emailPassed = false;
      switch (state) {
        case 1:
          $('#msg_emailTmpPW').text('이메일 형식이 올바르지 않습니다.');
          break;
        case 2:
          $('#msg_emailTmpPW').text('회원이 아닙니다.');
          break;
      }
    });
  });
});

