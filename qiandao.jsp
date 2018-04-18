<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.io.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>签到系统</title>
</head>
<body>
	<form action="qiandao.jsp">
     学号<input type="text" name="number">
     姓名<input type="text" name="name">
     <input type="submit" value="签到">

     <%
      if (application.getAttribute("allUsers")==null) {
      	application.setAttribute("allUsers",new TreeMap<String,String>());
      }

      TreeMap<String,String> allUsers =(TreeMap<String,String>)application.getAttribute("allUsers");
     %>     
    
    所有用户：
     <%
    String name = request.getParameter("name");
    String number = request.getParameter("number");
    if (name!=null && number!=null) {
    	try{
    	name = new String(name.getBytes("ISO-8859-1"),"utf-8");
    	}catch(Exception e){

    	}

    session.setAttribute("name",name);
    session.setAttribute("number",number);

    PrintWriter cout = new PrintWriter(new FileWriter("D:/Tomcat 9.0/webapps/qiandao/userlist.txt",true));
    cout.println(number + " " + name );
    cout.close();

    if(!allUsers.containsKey(number)){
	    allUsers.put(number,name);
    }
    }
     %>

     <p>所有在线用户：</p>
     <%
     for(String c:allUsers.keySet()){
     out.println("<p>"+c+" "+allUsers.get(c));
 }
    out.println("<p>一共有"+allUsers.keySet().size()+"人");
     %>
	</form>
</body>
</html>