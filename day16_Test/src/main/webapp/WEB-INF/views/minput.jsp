<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#button1").click(function(){
		var id=$("#id").val();
		$.ajax({
			type:"post",
			async:true,
			url:"idcheck",
			data:{"id":id},
			success:function(result){
				if(result=="ok")
					{
					alert("사용가능 id");
					}
				else
					{
					alert("사용중 id");
					}
			},
			error:function(result){
				alert("에러");
			}
		});
	});

});

function check()
{
var f=document.form1;
		var cpw=f.pw.value;
		var vpw=/^[\d]/;
		if(cpw==" " || cpw=="")
		{
		alert("패스워드가 공백이면 안됩니다!!");
		f.pw.select();
		return false;
		}
		if(!vpw.test(cpw))
		{
		alert("패스워드는 숫자 외에는 안되요");
		f.pw.select();
		return false;
		}
		var cname=f.mname.value;
		var vname=/^[가-힣]/;
		if(cname==" " || cname=="")
			{
			alert("이름이 공백이면 안됩니다!!");
			f.mname.select();
			return false;
			}
		if(!vname.test(cname))
			{
			alert("이름은 한글 외에는 안되요");
			f.mname.select();
			return false;
			}
		var chome=f.home.value;
		var vhome=/^[가-힣]/;
		if(chome==" " || chome=="")
			{
			alert("거주지가 공백이면 안됩니다!!");
			f.home.select();
			return false;
			}
		if(!vhome.test(chome))
			{
			alert("거주지는 한글 외에는 안되요");
			f.home.select();
			return false;
			}
    var arrSelect = document.getElementsByName("a");
    var count = 0;

    for (var i = 0; i < arrSelect.length; i++) {
        if (arrSelect[i].checked == true) {
            count += 1;
        }
    }
    
    if (count < 2) {
        alert("취미를 2개 이상 선택하세요.");
        return false;
    }

    f.submit();
}
</script>
<body>
<form action="msave" method="post" name="form1">
<table border="1" width="300px" align="center">
<caption>회원가입</caption>
<tr>
<th>아이디</th>
<td><input type="text" name="id" id="id"><button type="button" id="button1">id중복검사</button></td>
</tr>
<tr>
<th>패스워드</th>
<td><input type="text" name="pw"></td>
</tr>
<tr>
<th>이름</th>
<td><input type="text" name="mname"></td>
</tr>
<tr>
<th>전화번호</th>
<td><input type="text" name="tel"></td>
</tr>
<tr>
<th>성별</th>
<td><input type="text" name="sb"></td>
</tr>
<tr>
<th>거주지</th>
<td><input type="text" name="home"></td>
</tr>
<tr>
<th>취미</th>
<td><input type="checkbox" name="a" value="승마">승마
<input type="checkbox" name="a" value="체스">체스
<input type="checkbox" name="a" value="독서">독서
<input type="checkbox" name="a" value="서예">서예
<input type="checkbox" name="a" value="명상">명상</td>
</tr>
<tr>
<th>인사말</th>
<td>
<textarea rows="5" cols="30" name="content"></textarea>
</td>
</tr>
<tr>
<td colspan="2">
      <input type="button" value="전송" onclick="check()">
      <input type="reset" value="취소"></td>
</tr>
</table>
</form>
</body>
</html>