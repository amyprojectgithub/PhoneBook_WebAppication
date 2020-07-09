<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</head>
<body>
	<h2 style="color: orange; text-align: center">:::::::::Contact	Info:::::::</h2>
	<h2 style="color: green; text-align: center">  ${succMsg}  </h2>
	<h2 style="color: red; text-align: center">  ${errorMsg}  </h2>
	<form:form action="${pageContext.request.contextPath}/contactInfo/saveContact" method="POST" modelAttribute="contact">
		<table align="center">
		<tr> <td><form:hidden path="conatctId"/></td></tr>
			<tr>
				<td>Contact Name</td>
				<td><form:input path="contactName"/></td>
				<td><span id="nameError"></span></td>
			</tr>
			<tr>
				<td>EmailId</td>
				<td><form:input path="contactEmail"/></td>
				<td><span id="emailError"></span></td>
			</tr>
			<tr>
				<td>Contact No</td>
				<td><form:input path="contactNo"/></td>
				 <td><span id="contactError"></span></td> 
			</tr>
			<tr>
				<td><input type="submit"  value="SAVE CONTACT" id="saveMe"></td>
				<td><input type="reset" value="CLEAR"  ></td>
			</tr>
		</table>
	</form:form>
	<h3 style="text-align: center"><a href="${pageContext.request.contextPath}/contactInfo/viewAll">VIEW ALL CONTACTS</a></h3>
</body>
 <script>
   $(document).ready(function(){
	   //hide the error section
    $("#nameError").hide();
    $("#emailError").hide();
    $("#contactError").hide();
     //define the error variable
     var nameError=false;
     var emailError=false;
     var contactError=false;
     //validate function definition
     function validate_name(){
       //read the value
       var val=$("#contactName").val();
       //validate name
       if(val==''){
        $("#nameError").show();
        $("#nameError").html("<b style='font-size:13px'>Contact Name  is required.</b>");
        $("#nameError").css("color","red");
        nameError=false;
       }else{
        $("#nameError").hide();
        nameError=true;
       }
       return nameError;
     }

     function validate_email(){
         //read the value
         var val=$("#contactEmail").val();
         var exp=/^[A_Za-z0-9-_]+\@[A-za-z]{2,6}\.[a-z]{2,4}$/;
         if(val==''){
        	 $("#emailError").show();
        	 $("#emailError").html("<b style='font-size:13px'>EmailId  is required.</b>");
        	 $("#emailError").css("color","red");
        	 emailError=false;
             }else if(! exp.test(val)){
            	 $("#emailError").show();
            	 $("#emailError").html("<b style='font-size:13px'>Not a valid email address.</b>");
            	 $("#emailError").css("color","red");
            	 emailError=false;
                 }

         else{
            	 $("#emailError").hide();
            	  emailError=true;
                 }
          return emailError;
         }

     function validate_contactNum(){
         var val=$("#contactNo").val();
         var exp=/^[6-9][0-9]{9}$/;
         if(val==''){
        	 $("#contactError").show();
        	 $("#contactError").html("<b style='font-size:13px'>Contact No  is required.</b>");
        	 $("#contactError").css("color","red");
        	 contactError=false;
             }else if(! exp.test(val)){
            	 $("#contactError").show();
            	 $("#contactError").html("<b style='font-size:13px'>Not a valid contact number.</b>");
            	 $("#contactError").css("color","red");
            	 contactError=false;
                 }
             else  {
            	 $("#contactError").hide();
            	 contactError=true;
                 }
         return contactError;
         }
     
    //link action event
    $("#contactName").blur(function(){
      validate_name();
    });

    $("#contactEmail").blur(function(){
    	validate_email();
      });

    $("#contactNo").blur(function(){
    	validate_contactNum();
      });

    //linking submit button 
    $("#saveMe").click(function(){
    	nameError=false;
        emailError=false;
        contactError=false;
        //invoke validate methods
        validate_name();
        validate_email();
        validate_contactNum();
        if(nameError && emailError && contactError)
            return true;
        else
            return false;
        });
    
   });

  </script>

</html>