<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<!-- 後端網頁的側邊欄  和權限控管的必要片段程式碼 -->
<%@ page import="com.adminis.model.*"%>
<%  
	AdminisService as = new AdminisService();
	AdminisVO adminisVO= (AdminisVO)session.getAttribute("adminisVO");
	
	if(adminisVO==null){
		request.getRequestDispatcher("/backend/index.jsp").forward(request, response);
	}else{
		System.out.println("!!!!!!!!!!!"+adminisVO.getName());
	    session.setAttribute("admins", adminisVO.getName());     
	    session.setAttribute("adminisVO", adminisVO);
	}

	Map<String, String> roStatusMap = new HashMap<String, String>();
	roStatusMap.put("unpaid", "待繳費");
	roStatusMap.put("canceled", "取消");
	roStatusMap.put("unoccupied", "準備交車");
	roStatusMap.put("available", "今日取車");	
	roStatusMap.put("noshow", "逾期未取");	
	roStatusMap.put("noreturn", "待還車");	
	roStatusMap.put("overtime", "逾期未還");	
	roStatusMap.put("abnormalclosed", "異常結案");	
	roStatusMap.put("closed", "正常結案");	
	roStatusMap.put("other", "其他");
	
%>


<!-- 後端網頁的側邊欄  和權限控管的必要片段程式碼 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	

 	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/jquery_ui_1_10_3_theme.css"/>	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.css">        
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/backendHP_css.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/backend/Modified/main.css" >
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/dataTables.min.css">

   <title>租賃單管理-AutoBike</title>
</head>

<style>

	#myDiv {
	  display: none;
	  text-align: center;
	}

	th,td{
		height:20px;
	
	}

/*自定*/
	 th, tr{
		/*不換行*/
		white-space:nowrap;
	} 
	
	#logoutBtn{
		float:right;
		margin-top:7px;
		margin-right:20px;
	}
	
	h1 {
	    text-align: center;
	    font: bold 36px 思源黑體;
	    color: #edd14a;
	}	
	
</style>

<body>


<%--nav start --%>
<c:if test="<%=adminisVO!=null %>">
    <nav class="navbar navbar-default" role="navigation">
        <!-- logo區 -->
        <a class="navbar-brand page-scroll" href="<%=request.getContextPath()%>/backend/index.jsp" id="navA">AUTOBIKE</a>
        <!-- 左選單 -->
        <ul class="nav navbar-nav">
            <li><a href="#" id="navA">後端管理系統</a></li>
            <!-- 時鐘 -->
            <iframe scrolling="no" frameborder="no" clocktype="html5" style="overflow:hidden;border:0;margin:0;margin-top:5px;padding:0;width:120px;height:40px;" src="http://www.clocklink.com/html5embed.php?clock=004&timezone=CCT&color=yellow&size=120&Title=&Message=&Target=&From=2017,1,1,0,0,0&Color=yellow">
            </iframe>
        </ul>
        <!-- 右選單 -->
        
        <ul class="nav navbar-nav navbar-right">
        
			<li><a href="#" id="navA">哈囉! <%= adminisVO.getName() %></a></li>
			<li><a href="<%=request.getContextPath()%>/admin.do?action=logout" id="navA"><i
					class="glyphicon glyphicon-log-out"></i>登出</a></li>
		</ul>
    </nav>
<%--nav end --%>
    
<!------------------------------- 後端網頁的側邊欄  和權限控管的必要片段程式碼 -->
    <div class="col-xs-12 col-sm-2 leftBar">
     	<img id="menuLogo" src="<%=request.getContextPath()%>/backend/images/android_logo2.jpg">
       		<%if(adminisVO.getAuthno().equals("AC01") || adminisVO.getAuthno().equals("AC07")){%>     
        <button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color: #ddd;">總部管理系統</button> 
        <div class="btn-group-vertical" style="display: block;">
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/motor/motorMgmtHqSelectPage.jsp"  role="button">車輛管理</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/loc_motor_dispatch/motorDispatchMgmtHq.jsp"  role="button">車輛調度管理</a>           
			<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/backendRentOrd.jsp" role="button" style="background-color: #ddd;">租賃單管理</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/equipment/emtMgmtSelectPage.jsp" role="button">裝備管理</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/location/listAllLocation.jsp" role="button">據點管理</a>
        </div>
       		<%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">總部管理系統</button>		
        </div>
       		<%} %>
       		
     	<%if(adminisVO.getAuthno().equals("AC02") || adminisVO.getAuthno().equals("AC07")){%> 
        <button class="accordion accordionMenu">據點管理系統</button>
        <div class="btn-group-vertical">
        	<a class="btn btn-default" href="${pageContext.request.contextPath}/backend/motor/locListMotors.jsp" role="button">據點車輛管理</a>
        	<a class="btn btn-default" href="${pageContext.request.contextPath}/backend/equipment/locEmtMgmtSelectPage.jsp" role="button">據點裝備管理</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/lease.jsp"  role="button">交車管理</a>
          	<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/rent_ord/return.jsp"  role="button">還車管理</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/loc_motor_dispatch/locMotorDispatchApply.jsp" role="button">車輛調度申請</a>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/backend/emt_dispatch/locEmtDispatchApply.jsp" role="button">裝備申請</a>
         </div>
         <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">據點管理系統</button>		
        </div>
       		<%} %>
       		
       		 <%if(adminisVO.getAuthno().equals("AC05") || adminisVO.getAuthno().equals("AC07")){%>
        <button class="accordion accordionMenu">二手車管理系統</button>
        <div class="btn-group-vertical">
       		<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/SaleOnOff.jsp?who=${admins}" role="button">二手車輛管理</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/listAllSecOrd.jsp" role="button">二手交易管理</a>
<%--             <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/second_order/SaleOnOff.jsp" role="button">二手車交易管理</a> --%>
        </div>
         <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">二手車管理系統</button>		
        </div>
       		<%} %>
       		
       		 <%if(adminisVO.getAuthno().equals("AC03") || adminisVO.getAuthno().equals("AC07")){%>
       <button class="accordion accordionMenu">會員管理系統</button>
        <div class="btn-group-vertical">
       		<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/member/backendMember.jsp" role="button">會員管理</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/member/addMember.jsp" role="button">新增會員</a>
         </div>
        <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">會員管理系統</button>		
        </div>
       		<%} %>
       		
       		<%if(adminisVO.getAuthno().equals("AC06") || adminisVO.getAuthno().equals("AC07")){%>
        <button class="accordion accordionMenu">活動企劃管理系統</button>
        <div class="btn-group-vertical">
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/mes_board/listAllMesBoard.jsp" role="button">留言版管理</a>
            <a class="btn btn-default" href="<%=request.getContextPath()%>/backend/news/listAllNews.jsp" role="button">最新消息管理</a>
        </div>
        <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">活動企劃管理系統</button>		
        </div>
       		<%} %>
       		
         <%if(adminisVO.getAuthno().equals("AC04") || adminisVO.getAuthno().equals("AC07")){%>
        <button class="accordion accordionMenu">後端管理系統</button>
        <div class="btn-group-vertical">
       		<a class="btn btn-default" href="<%=request.getContextPath()%>/backend/adminis/listAllAdminis.jsp" role="button">後端權限管理</a>
<!--             <a class="btn btn-default" href="#" role="button">推薦景點管理</a> -->
        </div>
         <%} %><%else {%>
        <div>
        	<button class="accordion accordionMenu accordion accordionMenuMenu" style="background-color:pink;">後端管理系統</button>		
        </div>
       		<%} %>
        <div class="btn-group-vertical"></div>
    </div>
</c:if> 
<!----------------------------------------------- 後端網頁的側邊欄  和權限控管的必要片段程式碼 -->
    
    
    
    
    <div class="col-xs-12 col-sm-10 rightHTML" id="demo">

		<div class="topTitle">
            <h1>租賃單管理系統</h1>
        </div>
         		<div class="container-fluid">       
<jsp:useBean id="roSvc" scope="page" class="com.rent_ord.model.RentOrdService"/>
<jsp:useBean id="locSvc" scope="page" class="com.location.model.LocationService"/>
<jsp:useBean id="motorSvc" scope="page" class="com.motor.model.MotorService"/>
						<div style="padding:5px; padding-left:0px">
							<b>Show / Hide Columns: </b>
							<a class="showHideColumn" data-columnindex="0">租賃單號</a> -
							<a class="showHideColumn" data-columnindex="1">會員編號</a> -
							<a class="showHideColumn" data-columnindex="2">車輛編號</a> -
							<a class="showHideColumn" data-columnindex="3">交車據點</a> -
							<a class="showHideColumn" data-columnindex="4">還車據點</a> -
							<a class="showHideColumn" data-columnindex="5">填表日</a> -
							<a class="showHideColumn" data-columnindex="6">起始日</a> -
							<a class="showHideColumn" data-columnindex="7">結束日</a> -
							<a class="showHideColumn" data-columnindex="8">還車日</a> -
							<a class="showHideColumn" data-columnindex="9">罰金</a> -
							<a class="showHideColumn" data-columnindex="10">總金額</a> -
							<a class="showHideColumn" data-columnindex="11">評價</a> -
							<a class="showHideColumn" data-columnindex="12">狀態</a> -
						</div>	
						<table id="dataTable" class="stripe hover" width="80%" cellspacing="0">
							  <thead>	
									<tr class="QueryTable_TR">
										<th>租賃單號</th>
										<th>會員編號</th>		
										<th>車輛編號</th>
										<th>交車據點</th>				
										<th>還車據點</th>
										<th>填表日</th>				
										<th>起始日</th>
										<th>結束日</th>
										<th>還車日</th>
										<th>罰金</th>				
										<th>總金額</th>
										<th>評價</th>
										<th>狀態</th>	
										<th>修改</th>	
										<th>刪除</th>	
										<!--
										<th>里程數起始</th>
										<th>里程數結束</th> 
										<th>備註</th> 
										-->	
									</tr>
							  </thead>
							  <tbody>				  		
						 		<c:forEach var="roVO" items="${roSvc.all}">
									<tr class="QueryTable_TR">
										<td>${roVO.rentno}</td>
										<td>${roVO.memno}</td>
										<td>${roVO.motorVO.motno}</td>	
										<td>${locSvc.getOneLocation(roVO.slocno).locname}</td>
										<td>${locSvc.getOneLocation(roVO.rlocno).locname}</td>
										<td><fmt:formatDate pattern = "yy/MM/dd" value = "${roVO.filldate}" /></td>
										<td><fmt:formatDate pattern = "yy/MM/dd" value = "${roVO.startdate}" /></td>									
										<td><fmt:formatDate pattern = "yy/MM/dd" value = "${roVO.enddate}" /></td>
										<td><fmt:formatDate pattern = "yy/MM/dd" value = "${roVO.returndate}" /></td>
										<td>${roVO.fine}</td>
										<td>${roVO.total}</td>
										<td>${roVO.rank}</td>
										
										<%-- show readable-status with map --%>
										<c:set scope="page" var="temp"><c:out value="${roVO.status}"/></c:set>
										<% String key = String.valueOf(pageContext.getAttribute("temp")); %>
										<td><%=roStatusMap.get(key)%></td>
										
										<td>
											<form method="POST" target="print_popup" 
					      				  		  action="<%=request.getContextPath()%>/backend/rent_ord/rentOrd.do" 
					       						  onsubmit="window.open('about:blank','print_popup','width=1000,height=900');">
												<input type="hidden" name="rentno" value="${roVO.rentno}">
												<input type="hidden" name="action" value="query_for_update">
												<input type="submit" class="btn btn-default" value="修改">
											</form>	
										</td>
										<!-- 
										<td>${roVO.milstart}</td>
										<td>${roVO.milend}</td>
										<td>${roVO.note}</td>-->	
										<td>
											<form method="POST" action="<%=request.getContextPath()%>/backend/rent_ord/rentOrd.do">
												<input type="hidden" name="action" value="delete">
												<input type="hidden" name="rentno" value="${roVO.rentno}">
												<input type="submit" value="刪除" class="btn btn-danger" disabled/>
											</form> 
										</td> 
									</tr>
								</c:forEach>							
						  </tbody>	 	  								
						</table>
					</div>
<!--end: block3 --> 	
<!--container--></div>	

	<script src="<%=request.getContextPath()%>/backend/Modified/jquery_1_10_1_min.js"></script>
	<script src="<%=request.getContextPath()%>/backend/Modified/jquery_ui_1_10_3.js"></script>
	<script src="<%=request.getContextPath()%>/backend/Modified/twitter_bootstrap_3_3_7_min.js"></script>
	<script src="<%=request.getContextPath()%>/js/dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/backend/rent_ord/Modified/rentOrdNew.js"></script>
    <script src="<%=request.getContextPath()%>/backend/rent_ord/Modified/motorKanli_for_ro.js"></script>
    <script src="<%=request.getContextPath()%>/backend/rent_ord/Modified/datepicker_for_ro.js"></script>
    
<script>
//table
$(document).ready(function(){
	var datatableInstance = $('#dataTable').DataTable({
		
	});
	

	$('.showHideColumn').on('click',function(){
		var tableColumn = datatableInstance.column($(this).attr('data-columnindex'));
		tableColumn.visible(!tableColumn.visible());
	})
});

</script>  

</body>
</html>


