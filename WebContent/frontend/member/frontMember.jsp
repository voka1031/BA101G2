<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>

<%
	MemberVO memVO = (MemberVO) request.getAttribute("memVO");
	String memno = (String)session.getAttribute("memno");
%>
<!DOCTYPE html>
<html>
<style type="text/css">
		/**** BASE ****/
body {
    color: #888;   
}
a {
    color: #03a1d1;
    text-decoration: none!important;
    font-size:18px;
}

/**** LAYOUT ****/
.list-inline>li {
    padding: 0 10px 0 0;
}
.container-pad {
    padding: 30px 15px;
}


/**** MODULE ****/
.bgc-fff {
    background-color: #fff!important;
}
.box-shad {
    -webkit-box-shadow: 1px 1px 0 rgba(0,0,0,.2);
    box-shadow: 1px 1px 0 rgba(0,0,0,.2);
}
.brdr {
    border: 1px solid #ededed;
}

/* Font changes */
.fnt-smaller {
    font-size: .9em;
}
.fnt-lighter {
    color: #bbb;
}

/* Padding - Margins */
.pad-10 {
    padding: 10px!important;
}
.mrg-0 {
    margin: 0!important;
}
.btm-mrg-10 {
    margin-bottom: 10px!important;
}
.btm-mrg-20 {
    margin-bottom: 20px!important;
}

/* Color  */
.clr-535353 {
    color: #535353;
}


/**** TO top MODULE ****/
#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 10px;
}

#myBtn:hover {
  background-color: #555;
}
/****end TO top MODULE ****/


/**** 自已加的  ****/
li{
	margin-top:10px;
	font-size:16px;
}

.btn{
	position:relative;
	margin-top:5%;
}

.text_type{

color: #000;
}


body {
       background: linear-gradient( rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3) ),url(/BA101G2/img/header1.jpg) no-repeat center center fixed; 
	    -webkit-background-size: cover;
	    -moz-background-size: cover;
	    -o-background-size: cover;
	    background-size: cover;
}

.topdiv{

	margin-top:80px;
	color:#eee;

}


#myDiv {
  display: none;
  text-align: center;
}

#mamberDiv{

margin-top:10%;

}

#mamberTable{
	margin:0px;
	background-color: #fff!important;
	font-size:16px!important;
	
}
td,th{
text-align: center!important;
}

td{
	/* line-height:197px!important; */
text-align:center!important;
vertical-align: middle!important;
}


.navTextTag{
	font-size:16px!important;
}

#myBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  border: none;
  outline: none;
  background-color: red;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 10px;
}

#myBtn:hover {
  background-color: #555;
}

.strongTag{
font: bold 20px 思源黑體;
}

/****end 自已加的 ****/
</style>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>會員專區</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/jquery_ui_1_10_3_theme.css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/twitter_bootstrap_3_3_7_min.css">   
	<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/font-awesome/css/font-awesome.min.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/google_family_kaushan_script.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/frontend/rental_form/Modified/agency.min.css"  />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/frontend/rental_form/Modified/agency.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/frontend/rental_form/Modified/other.css" />
    <link rel="Short Icon" href="<%=request.getContextPath()%>/img/smallIcon.ico">
</head>
<title>會員專區</title>

<body>

<%-- Navigation --%>
	<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="<%=request.getContextPath()%>/index.jsp">AutoBike&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;會員專區</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				 <ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll navTextTag" href="<%=request.getContextPath()%>/index.jsp">
						<i class="glyphicon glyphicon-home"></i>
						回首頁</a>
					</li>
					<li>
						<a class="page-scroll navTextTag" href="<%=request.getContextPath()%>/frontend/rental_form/rental_category.jsp">
						<i class="glyphicon glyphicon-heart"></i>
						我要租車</a>
					</li>
					<li>
						<a class="navTextTag" href="<%=request.getContextPath()%>/frontend/second_order/listAllSecond.jsp">
						<i class="fa fa-shopping-cart"></i>
						二手車購買</a>
					</li>
					<c:if test="${not empty memno}">	
						<li>
							<a class="navTextTag" href="<%=request.getContextPath()%>/backend/member/member.do?action=getOne_For_Enter&memid=${memno}">
							會員專區</a>
						</li>
						<li><a class="navTextTag" href="#" class="disabled">歡迎，${(memname == null) ? '會員':memname}</a></li>
						<li>
							<a class="navTextTag" href="<%=request.getContextPath()%>/backend/member/member.do?action=logout" data-toggle="modal"><i class="glyphicon glyphicon-user"></i>
							登出</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
<%--end Navigation --%>
	
	<div id="blocker"></div>


	<!-- 租車主軸Header -->

<%----------------------------------------------------VVVV building area VVVV-----------------------------------------------------------%>
<%
	String addStatus = (String)request.getAttribute("addStatus");
%>

<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>

<div class="col-xs-12 col-sm-12" id="mamberDiv">
		<c:if test="${memVO.status=='unconfirmed'||memVO.status=='uncompleted'}">
			<div class="alert alert-warning">
			  <strong class="strongTag">為了維護您的權益，請盡速填寫完整的會員資料並進行認證</strong>
			</div>
		</c:if>
		<c:if test="${memVO.status=='verifing'}">
			<div class="alert alert-warning">
			  <strong class="strongTag">目前正在認證中，請稍後</strong>
			</div>
		</c:if>		
		
		
    <table id="mamberTable" border="1" class="table table-striped table-inverse">
        <tr>
			<th>會員編號</th>
			<th>會員名稱</th>
			<th>性別 </th>
			<th>生日</th>
			<th>Mail</th>
			<th>電話</th>
			<th>地址</th>
			<th>帳號</th>
			<th>身分證正面</th>
			<th>身分證反面</th>
			<th>駕照</th>
			<th>認證狀態</th>
			<th>編輯</th>
		</tr>
            <tr>
			<td>${memVO.memno}</td>
			<td>${memVO.memname}</td>
			<td>${memVO.sex}</td>
			<td><fmt:formatDate pattern = "yyyy/MM/dd" value = "${memVO.birth}" /></td>
			<td>${memVO.mail}</td>
			<td>${memVO.phone}</td>	
			<td>${memVO.addr}</td>	
			<td>${memVO.acc}</td>
			<td>
				<c:if test="${memVO.idcard1!=null}">
				<img src='<%=request.getContextPath()%>
				/backend/member/memReader.do?memno=${memVO.memno}&card=idcard1' width='200' height='200'>
				</c:if><c:if test="${memVO.idcard1==null}">沒有圖片</c:if>
			</td>	
			<td>
				<c:if test="${memVO.idcard2!=null}">
				<img src='<%=request.getContextPath()%>
				/backend/member/memReader.do?memno=${memVO.memno}&card=idcard2'  width='200' height='200'>
				</c:if><c:if test="${memVO.idcard2==null}">沒有圖片</c:if>
			</td>				
			<td>
				<c:if test="${memVO.idcard2!=null}">
				<img src='<%=request.getContextPath()%>
				/backend/member/memReader.do?memno=${memVO.memno}&card=license' width='200' height='200'>
				</c:if><c:if test="${memVO.license==null}">沒有圖片</c:if>
			</td>
			<c:if test="${memVO.status=='uncompleted'}"><td><font color=red><b>簡易註冊</b></font></td></c:if>					
			<c:if test="${memVO.status=='confirmed'}"><td><font color=red><b>完整認證</b></font></td></c:if>
			<c:if test="${memVO.status=='unconfirmed'}"><td><font color=red><b>一般認證</b></font></td></c:if>
			<c:if test="${memVO.status=='verifing'}"><td><font color=red><b>認證中</b></font></td></c:if>
			<td class="text-center"><a class='btn btn-info btn-md' 
			href="<%=request.getContextPath()%>/backend/member/member.do?addAction=frontMember&action=getOne_For_Update&memno=${memno}">
			<span class="glyphicon glyphicon-edit"></span> Edit</a></td>

		</tr>
    </table>
		<form METHOD="post" ACTION="<%=request.getContextPath()%>/backend/member/member.do">
			<input type="hidden" name="addaction" value="frontend">
			<input type="hidden" name="action" value="getAllRentOrder">
			<input type="hidden" name="memno" value="${memno}">
			<div style="vertical-align:text-top;">
				<p class="text-center" id="p_tag">
					<button type="button" onclick="loadDoc()" class="btn btn-info btn-lg">二手車訂單查詢</button>
					<button type="submit" class="btn btn-success btn-lg">
						租賃單查詢
					</button>
					<a href="<%=request.getContextPath()%>/index.jsp" class="btn btn-danger btn-lg">
						<i class="glyphicon glyphicon-arrow-up"></i>返回上頁
					</a>
				</p>
			</div>
		</form>    
   </div>
   <div id="demo"></div>
	<BR/>


		<%----------------------------------------------------^^^^ building area ^^^^-----------------------------------------------------------%>		

	<script src="<%=request.getContextPath()%>/backend/Modified/jquery_1_10_1_min.js"></script>
	<script src="<%=request.getContextPath()%>/backend/Modified/jquery_ui_1_10_3.js"></script>
	<script src="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.js"></script>
	<script src="<%=request.getContextPath()%>/js/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/daterangepicker.js"></script>
	<script type="text/javascript">
		 function loadDoc() {
		    var xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
			     document.getElementById("demo").innerHTML=this.responseText;
			    }
			 };
			  xhttp.open("GET","<%=request.getContextPath()%>/backend/member/member.do?addaction=frontend&action=get_second_ord_per_member&memno=${memno}", true);
			  xhttp.send();
			}
		 
		 window.onscroll = function() {scrollFunction()};

		 function scrollFunction() {
		     if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		         document.getElementById("myBtn").style.display = "block";
		     } else {
		         document.getElementById("myBtn").style.display = "none";
		     }
		 }

		 // When the user clicks on the button, scroll to the top of the document
		 function topFunction() {
		     document.body.scrollTop = 0;
		     document.documentElement.scrollTop = 0;
		 }
	 </script>


</body>
</html>
