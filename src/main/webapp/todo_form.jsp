<%--
  Created by IntelliJ IDEA.
  User: ichaehun
  Date: 2021/06/12
  Time: 11:15 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>할일 목록 리스트</title>
    <style>
        .container {
            margin : 0;
            padding : 0;
            display : flex;
            flex-direction: column;
            align-items: center;
        }

        .header {
            flex:1 auto;
            background-color: #888;
            width: 700px;
        }
        .body{
            flex:1 auto;
            background-color: skyblue;
            width: 700px;}
        .footer{
            flex:1 auto;
            background-color: darkkhaki;
            width: 700px;}
    </style>
    <script>
        function print(){
            var form = document.getElementById('input_form');
            alert(form.job.value);

            return;
        }
    </script>
</head>
<body>
<div class="container" id="container">
    <div class="header"> <h2> 이채훈의 할일 목록 </h2> </div>
    <div class="body">
        <form id = "input_form" action = todo_save.jsp method = post>
            <span>날짜입력</span>
            <input type="date" placeholder="날짜를 입력하세요" name = "input_date"> <br> <br>
            <label> 2021년 4월 21일 </label>
            <ul>
                <li>할 일 목록 1</li>
                <li>할 일 목록 2</li>
                <li>할 일 목록 3</li>
            </ul> <br>
            <div class = "box">
                <label> 할일 목록 </label> <br> <br>
                <input type="text" placeholder="할일을 입력하세요" name = "work_list"> <br> <br>
                <label> 시작일 </label> <input type="date" name = "start_date">
                <input id = "appt-time" type = "time" name = "start-time" step = "2"> <br> <br>
                <label> 마감일 </label> <input type="date" name = "finish_date">
                <input id = "appt-time" type = "time" name = "finish-time" step = "2"> <br> <br>
                <label> 알림 설정 </label> <br> </div>
                <div class = "box">
                    <lable> <input type = "radio" name = "msg_sns" value = "mes1" checked> 메세지 </lable>
                    <lable> <input type = "radio" name = "msg_sns" value = "SMS1"> SMS </lable>
                </div> <br>
                <lable> <input type = "checkbox" name = "bibration" value = "Y"> 진동 </lable> <br> <br>
                <button type ="summit"> 저장하기 </button>
                <button> 취소하기 </button>
        </form>
    </div>
    <div class = "footer"> 카피라이트 이채훈 꺼. </div>
</div>

</body>
</html>