<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.equipment.model.*"%>
<%@ page import="com.emt_cate.model.*"%>
<%@ page import="com.rent_ord.model.*"%>

<!DOCTYPE html>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<jsp:useBean id="locSvc" scope="page" class="com.location.model.LocationService" />
<jsp:useBean id="ecSvc" scope="page" class="com.emt_cate.model.EmtCateService" />
<jsp:useBean id="emtSvc" scope="page" class="com.equipment.model.EquipmentService" />

<%
    List<EmtCateVO> ecVOinList = ecSvc.getAllByHib();
    pageContext.setAttribute("ecVOinList",ecVOinList);
%>


<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>據點裝備申請 - locEmtDispatchApply.jsp</title>
<meta name="description" content="">
<meta name="keywords" content="">

<!-- CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/backend/emt_dispatch/js/locEmtDispatchApply_css.css">
<link rel="stylesheet"
	href="http://www.jacklmoore.com/colorbox/example1/colorbox.css">
	
<!-- JS -->
<!-- <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<script src="https://code.jquery.com/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/backend/emt_dispatch/js/locEmtDispatchApply_js.js"></script>
<script type="text/javascript" src="http://www.jacklmoore.com/colorbox/jquery.colorbox.js"></script>
</head>

<body>
	<nav class="navbar navbar-default" role="navigation">
		<!-- logo區 -->
		<a class="navbar-brand" href="#" id="navA">AUTOBIKE</a>
		<!-- 左選單 -->
		<ul class="nav navbar-nav">
			<li><a href="#" id="navA">後端管理系統</a></li>
			<!-- 時鐘 -->
			<iframe scrolling="no" frameborder="no" clocktype="html5"
				style="overflow: hidden; border: 0; margin: 0; padding: 0; width: 120px; height: 40px;"
				src="http://www.clocklink.com/html5embed.php?clock=004&timezone=CCT&color=yellow&size=120&Title=&Message=&Target=&From=2017,1,1,0,0,0&Color=yellow">
			</iframe>

		</ul>
		<!-- 右選單 -->
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#" id="navA">HI EMT9413 歡迎回來為公司奉獻</a></li>
			<li><a href="#" id="navA"><i
					class="glyphicon glyphicon-wrench"></i>個人設定</a></li>
			<li><a href="#" id="navA"><i
					class="glyphicon glyphicon-log-out"></i>登出</a></li>
		</ul>
	</nav>
<!-- 	左邊選單表 -->
	<div class="col-xs-12 col-sm-2 leftBar">
		<img id="logo"
			src="${pageContext.request.contextPath}/backend/images/logo.jpg">
		<button class="accordion accordionMenu">總部管理系統</button>
		<div class="btn-group-vertical">
			<a class="btn btn-default"
				href="${pageContext.request.contextPath}/backend/motor/motorMgmtHqSelectPage.jsp"
				role="button">車輛管理</a> <a class="btn btn-default" href="#"
				role="button">車輛調度</a> <a class="btn btn-default" href="#"
				role="button">租賃單管理</a> <a class="btn btn-default"
				href="${pageContext.request.contextPath}/backend/equipment/emtMgmtSelectPage.jsp"
				role="button">裝備管理</a> <a
				class="btn btn-default" href="#" role="button">裝備調度</a> <a
				class="btn btn-default" href="#" role="button">據點管理</a>
		</div>
		<button class="accordion accordionMenu" style="background-color: #ddd;">據點管理系統</button>
		<div class="btn-group-vertical"  style="display: block;">
			<a class="btn btn-default" href="#" role="button">據點車輛管理</a> <a
				class="btn btn-default" href="#" role="button">交車管理</a> <a
				class="btn btn-default" href="#" role="button">還車管理</a> <a
				class="btn btn-default" href="${pageContext.request.contextPath}/backend/loc_motor_dispatch/locMotorDispatchApply.jsp" role="button">車輛調度申請</a> <a
				class="btn btn-default" href="#" role="button">車輛保養/維修管理</a> <a
				class="btn btn-default" href="#" role="button">據點裝備管理</a> <a
				class="btn btn-default" href="${pageContext.request.contextPath}/backend/emt_dispatch/locEmtDispatchApply.jsp" role="button" style="background-color: #ddd;">裝備申請</a>
		</div>
		<button class="accordion accordionMenu">二手車管理系統</button>
		<div class="btn-group-vertical">
			<a class="btn btn-default" href="#" role="button">二手車輛管理</a> <a
				class="btn btn-default" href="#" role="button">二手車訂單管理</a> <a
				class="btn btn-default" href="#" role="button">二手車交易管理</a>
		</div>
		<button class="accordion accordionMenu">會員管理系統</button>
		<div class="btn-group-vertical"></div>
		<button class="accordion accordionMenu">活動企劃管理系統</button>
		<div class="btn-group-vertical">
			<a class="btn btn-default" href="#" role="button">推播管理</a> <a
				class="btn btn-default" href="#" role="button">留言版管理</a> <a
				class="btn btn-default" href="#" role="button">最新消息管理</a>
		</div>
		<button class="accordion accordionMenu">後端管理系統</button>
		<div class="btn-group-vertical">
			<a class="btn btn-default" href="#" role="button">後端權限管理</a> <a
				class="btn btn-default" href="#" role="button">推薦景點管理</a> <a
				class="btn btn-default" href="#" role="button">後端登入管理</a>
		</div>
	</div><!-- 	左邊選單表結束-->
	
<!-- 	右邊HTML區塊 -->
	<div class="col-xs-12 col-sm-10 rightHTML" >
		<div class="topTitle">
			<h1>據點車輛調度申請</h1>
		</div>
		<div class="container">
			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font color='red'>請修正以下錯誤:
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li>${message}</li>
						</c:forEach>
					</ul>
				</font>
			</c:if>
			<!--搜尋列 -->
			<div class="searchBar">
				<table>
					<tr>
						<td>
							<FORM METHOD="post" style="display: inline;"
								ACTION="${pageContext.request.contextPath}/backend/emt_dispatch/ed.do">
								<div class="form-group" style="display: inline;">
									<div class="col-sm-4">
										<label class="control-label" for="locno">選取所在據點：</label>
									</div>
									<div class="col-sm-7">
										<select class="form-control" name="locno" id="locSelect"
											style="display: inline;">
											<c:forEach var="locVO" items="${locSvc.getAll()}">
												<option value="${locVO.locno}"
													${(locVO.locno==param.locno)?'selected':'' }>${locVO.locno}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-1">
										<input type="submit" class="btn btn-default" value="確認">
										<input type="hidden" name="action" value="chooseLoc">
										<input type="hidden" name="locno" value="${locVO.locno}">
										<input type="hidden" name="requestURL"
											value="<%=request.getParameter("requestURL")%>">
									</div>
								</div>
							</form>

							<FORM METHOD="post" style="display: inline;"
								ACTION="${pageContext.request.contextPath}/backend/emt_dispatch/ed.do">
								<div class="form-group" style="display: inline;">
									<div class="col-sm-4">
										<label class="control-label" for="locno">查詢所在據點申請單據：</label>
									</div>
									<div class="col-sm-7">
										<select class="form-control" name="locno"
											id="locEmtDispListSelect" style="display: inline;">
											<c:forEach var="locVO" items="${locSvc.getAll()}">
												<option value="${locVO.locno}"
													${(locVO.locno==param.locno)?'selected':'' }>${locVO.locno}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-1">
										<input type="submit" class="btn btn-default" value="查詢">
										<input type="hidden" name="action" value="chooseLocForList">
										<input type="hidden" name="locno" value="${locVO.locno}">
										<input type="hidden" name="requestURL"
											value="<%=request.getParameter("requestURL")%>">
									</div>
								</div>
							</form>
						</td>
					</tr>
				</table>
			</div>
			<!--搜尋列結束 -->
			
			<div id="outer-wrapper">
				<div id="header-wrapper">
					<ul class="switch-button">
    					<li id="sw_01" title="圖文顯示" style="background-image: url(${pageContext.request.contextPath}/backend/loc_motor_dispatch/images/style-button.gif);"><span>圖文顯示</span></li>
    					<li id="sw_02" title="圖片顯示" style="background-image: url(${pageContext.request.contextPath}/backend/loc_motor_dispatch/images/style-button.gif);"><span>圖片顯示</span></li>
    					<li id="sw_03" title="文字顯示" style="background-image: url(${pageContext.request.contextPath}/backend/loc_motor_dispatch/images/style-button.gif);"><span>文字顯示</span></li>
					</ul>
				</div>

	<c:forEach var="ecno" items="${ecnoList}">
				<div class="content-wrapper" >
					<dl class="vw_01">
					<dd>
						<img class="emtImg"
							src="<%=request.getContextPath()%>/backend/emt_cate/ecReader.do?ecno=${ecno}">
						<div class="main">
							<table class="ecTable">
               				<tr class="ecList">
               					<td class="ecno">
               					<c:forEach var="ecVO" items="${ecVOinList}">
               						<c:if test="${ecVO.ecno == ecno }">
               							${ecVO.ecno}
                   					</c:if>
                   				</c:forEach>
               					</td>
               				<td>
               				<c:forEach var="ecVO" items="${ecVOinList}">
               					<c:if test="${ecVO.ecno == ecno}">
               							${ecVO.type}
                   				</c:if>
                   			</c:forEach>
               				</td>
               				<td>
               				<c:forEach var="ecVO" items="${ecVOinList}">
               					<c:if test="${ecVO.ecno == ecno}">
               							${ecVO.price}
                   				</c:if>
                   			</c:forEach>
               				</td>
               			</tr>
						<tr class="emtAmount">
								
									<c:forEach var="dispAbleEmts" items="${dispatchableEmts}">
	                    				<%! int count=0;%>
	                   					<c:if test="${dispAbleEmts.emtCateVO.ecno == ecno}">
		                    				<% count++;%>
	                   					</c:if>
	                				</c:forEach>
								
                				<td>
                					<label for="aa" class="control-label col-sm-3">選擇數量</label>
                				</td>
                				<td>
                					<input type="number" class="count form-control" name="" min="0" max="<%= count %>" style="display: inline;">
                					<c:forEach var="dispAbleEmts" items="${dispatchableEmts}">
                					<c:if test="${dispAbleEmts.emtCateVO.ecno == ecno}">
		                    				<input type="hidden" class="emtno" value="${dispAbleEmts.emtno}">
	                   				</c:if>
	                   				</c:forEach>
                				</td>
                				<td>
                				/<%= count %>
                				</td>
                				<td> 
                					<input type="button" name="addButton" class="addButton btn btn-default" value="加入調度單">
                				</td>
               					<%  count=0;%>
               					</tr>
               				</table>
						</div>
					</dd>
					</dl>
				</div>
				<div class="clear"></div>
	</c:forEach>

</div>
		</div><!--container結束-->
	</div><!--右邊HTML區塊結束 -->
	
	
	<footer id="footer">	
	<div id="cartDiv">
	<div id="newEmt">
		<img src="" id="cartImage" style="margin-left:150px;">
		<span id="spanName"></span>
		<span id="emtAmt"></span>
<!--     		<img src="imgs/formosa.jpg" id="cartImage"> -->
<!-- 			<span>Formosa</span>  -->
<!--  			<span>5000</span>	 -->
    </div>
    <span class="checkout">check out</span>
   	<div id="dispatchListContent">
   	<FORM METHOD="post" ACTION="${pageContext.request.contextPath}/backend/emt_dispatch/ed.do" name="formDispatch" id="formDispatch" class="form-horizontal">
    	<table id="dispatchListTable">
<!--     		<tr class="contentTr"> -->
<!--     			<td class = "contentTd"> -->
<!--     				<div class="form-group"> -->
<!-- 						<label class="contentName control-label col-sm-3" for="modtype">MM101</label> -->
<!-- 						<input type="hidden" name="modtype" value="MM101"> -->
<!-- 						<div class="col-sm-9"> -->
<!-- 							<input type="text" class="contentCount form-control" id="modtype" name="modtype" value="1" /> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!--     			</td> -->
<!--     		</tr> -->
			<tr><td>
			<input type="hidden" name="action" value="insert"> 
			<input type="hidden" name="locno" value="${param.locno}">
			<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>">
			<input type="submit" class="btn btn-default" value="確認提出">
			</td></tr>
    	</table>
    </form>
    </div>
    <div id="dispatchListButton">
    	<span class="contentTotal"></span>
    </div>
    <div style="clear:both;"></div>
    </div>
</footer>

<script type="text/javascript">
(function(){
	$('.checkout').on('click', function(){
		$.colorbox({
			html : $("#dispatchListContent").html(),	//在燈箱中要顯示的html字段
			width : 700,	//燈箱中間區塊的寬度
			height : 600,	//燈箱中間區塊的高度
			onClosed : function(){	//當燈箱關閉時的callback funtion
			}
		});
	});
})();
</script>

</body>

</html>