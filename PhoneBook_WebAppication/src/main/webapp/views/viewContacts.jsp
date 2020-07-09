<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
   td,tr {
	        text-align: center;
        }
    
</style>
<meta charset="ISO-8859-1">
<title>My Contact lists</title>
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables.css">
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/css/jquery.dataTables_themeroller.css">
    <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.0/jquery.dataTables.min.js"></script>
   <script type="text/javascript">
      $(document).ready( function () {
                 $('#contactTab').DataTable();
           } );
 </script>
</head>
<body>
    <h2 style="color:orange;text-align: center">My contacts list....</h2>
    <h3 align="center"><a href="home">+Add contact</a></h3>
    <hr size="5px" noshade="noshade">
	<c:choose>
		<c:when test="${!empty contactList }">
		 <table  border="1" id="contactTab" align="center" cellspacing="0">
	    <thead>
		             <tr>
			                                <th>S.NO</th>
			                                <th>CONTACT NAME</th>
			                                <th>EMAIL ID</td>
			                                <th>CONTACT NO</th>
			                                <th>CREATED DATE</th>
			                                <th>UPDATED DATE</th>
			                                <th >ACTIONS</th>
		               </tr>
	    </thead>	
	    <tbody>
            <c:forEach items="${contactList}" var="contact" varStatus="index">
           
                          <tr>
                                          <td>${index.count }</td>
                                          <td>${contact.contactName}</td>
                                          <td>${contact.contactEmail}</td>
                                          <td>${contact.contactNo}</td>
                                          <td>${contact.createdDate}</td>
                                          <td>${contact.updatedDate}</td>
                                          <td>
                                          <a href="${pageContext.request.contextPath}/viewContact/editContact?id=${contact.conatctId }">EDIT</a> &nbsp;&nbsp;&nbsp;
                                          <a href="${pageContext.request.contextPath}/viewContact/deleteContact?id=${contact.conatctId }" onclick="return confirm('Are you sure, You want to delete this contact permanently?')">DELETE</a>
                                          </td>
                          </tr>
           
            </c:forEach>
            </tbody>
         </table>
		</c:when>
		<c:otherwise>
			<h2 style="color: red; text-align: center">
				Your contact list is empty..<br>Click the <a href="${pageContext.request.contextPath}/contactInfo/home">+Add	contact</a> hyperlink to add new contacts..
			</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>