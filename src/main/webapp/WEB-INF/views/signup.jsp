<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title>Login V19</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="/resources/loginResources/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/resources/loginResources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginResources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginResources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginResources/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginResources/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginResources/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginResources/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginResources/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="/resources/loginResources/css/util.css">
 	<link rel="stylesheet" type="text/css" href="/resources/loginResources/css/main.css">

</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form class="login100-form validate-form" method="post">
				
					<span class="login100-form-title p-b-33">
						Create Acount
					</span>

					<div class="wrap-input100 validate-input" data-validate = "아이디를 입력해주세요">
						<input class="input100" type="text" name="mid" placeholder="ID">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>

					<div class="wrap-input100 rs1 validate-input" data-validate="사용하실 비밀번호를 입력해주세요">
						<input id="mpw1" class="input100 mpw" type="password" name="mpw" placeholder="Password">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					
					<div class="wrap-input100 rs1 validate-input" data-validate="비밀번호 확인을 위해 입력해주세요">
						<input id="mpw2" class="input100 mpw2" type="password" name="mpw2"  placeholder="Password">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "이름을 입력해주세요">
						<input class="input100" type="text" name="mname" placeholder="Name">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					
					
					
					<div class="wrap-input100 validate-input" data-validate ="이메일을 ex@abc.xyz 방식으로 입력해주세요">
						<input class="input100" type="text" name="email" placeholder="E-Mail">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					
					

					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn signUP">
							Sign Up
						</button>
					</div>
					

					<div class="text-center">

						<span class="txt1">
							Do yo want Sign In?
						</span>
						
						<a href="login" class="txt2 hov1">
							Sign In
						</a>
					</div>
					
				</form>
			</div>
		</div>
	</div>
<!--===============================================================================================-->
	<script src="resources/loginResources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/loginResources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/loginResources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/loginResources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/loginResources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/loginResources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/loginResources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="resources/loginResources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="resources/loginResources/js/main.js"></script>
	
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<body onload="document.forms[0].reset()">

<script>
$(".signUP").on("click",function(e){

	var mpw1 = document.getElementById("mpw1").value;
	var mpw2 = document.getElementById("mpw2").value;
	console.log(mpw1);
	console.log(mpw2);
	if(mpw1 != mpw2){
		alert("입력한 비밀번호가 서로 다릅니다.")
	}
	
});

</script>
	
	
</body>
</html>