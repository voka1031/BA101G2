<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>BA101G2 Spots: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>IBM Spot: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for BA101G2 Spots: Home</p>

<h3>資料查詢:</h3>
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

<ul>
  <li><a href='<%=request.getContextPath()%>/frontend/spots/listAllSpot.jsp'>List</a> all Spots. </li> <br><br>
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/spots/spot.do" >
        <b>輸入景點編號 (如SP000001):</b>
        <input type="text" name="spno">
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>

  <jsp:useBean id="spSvc" scope="page" class="com.spots.model.SpotService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/spots/spot.do" >
       <b>選擇景點編號:</b>
       <select size="1" name="spno">
         <c:forEach var="spotVO" items="${spSvc.all}" > 
          <option value="${spotVO.spno}">${spotVO.spno}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/frontend/spots/spot.do" >
       <b>選擇景點名稱:</b>
       <select size="1" name="spno">
         <c:forEach var="spotVO" items="${spSvc.all}" > 
          <option value="${spotVO.spno}">${spotVO.spname}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="getOne_For_Display">
     </FORM>
  </li>
  
  <!-- 這邊到時候加入 其他的table -->
  


<h3>景點管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/frontend/spots/addSpot.jsp'>Add</a> a new Spot.</li>
</ul>



</body>

</html>
