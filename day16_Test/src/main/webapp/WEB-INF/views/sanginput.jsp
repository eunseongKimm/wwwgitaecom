<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(function() {
        $("#datepicker").datepicker({
            dateFormat: 'yy년 mm월 dd일', // 원하는 날짜 형식으로 변경
            minDate: new Date(2023, 0, 1), // 최소 날짜 설정 (예: 2023년 1월 1일)
            maxDate: new Date(2023, 11, 31) // 최대 날짜 설정 (예: 2023년 12월 31일)
        });
    });
    
    function check1() {
        var f = document.form1;

        // 상품번호 인증절차
        var cnum = f.spnum.value;
        var vnum = /^[0-9]+$/; // 숫자만 가능하게 함 (1개 이상)
        if (!vnum.test(cnum)) {
            alert("숫자만 가능합니다");
            f.spnum.select();
            return false;
        }
        // 상품명 인증절차
        var cspname = f.spname.value;
        var vspname = /^[가-힣]+$/; // 한글만 가능하게 함 (1개 이상)
        if (!vspname.test(cspname)) {
            alert("상품명은 한글만 가능합니다");
            f.spname.select();
            return false;
        }
        // 상호명 인증절차
        var csangho = f.sangho.value;
        var vsangho = /^[가-힣]+$/; // 한글만 가능하게 함 (1개 이상)
        if (!vsangho.test(csangho)) {
            alert("상호명은 한글만 가능합니다");
            f.sangho.select();
            return false;
        }
        // 모든 인증 절차가 통과되면 폼을 제출합니다.
        f.submit();

        return true;
    }
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="sangsave" method="post" enctype="multipart/form-data" name="form1">
  <table border="1" width="300px" align="center">
  <caption><h2>상품정보 입력</h2></caption>
    <tr>
      <th>상품번호</th>
      <td>
      <input type="number" name="spnum">
      </td>
    </tr>
    <tr>
      <th>상품명</th>
      <td><input type="text" name="spname"></td>
    </tr>
    <tr>
      <th>상호명</th>
      <td><input type="text" name="sangho"></td>
    </tr>
    <tr>
      <th>판매일자</th>
      <td><input type="text" name="spdate" id="datepicker"></td>
    </tr>
    <tr>
      <th>상품특징</th>
      <td>
      <textarea rows="5" cols="30" name="scontent"></textarea>
      </td>
    </tr>
    <tr>
      <th>가격</th>
      <td><input type="number" name="sprice"></td>
    </tr>
    <tr>
      <th>상품이미지</th>
      <td><input type="file" name="spimage"></td>
    </tr>
    <tr>
      <td colspan="2">
      <input type="submit" value="전송" onclick="check1()">
      </td>
    </tr>
  </table>
</form>
</body>
</html>