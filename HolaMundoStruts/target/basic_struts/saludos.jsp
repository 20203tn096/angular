<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saludos desde Struts 2</title>
    </head>
    <body>
        <h1>Hola</h1>
        <h1><s:property value="curp"></s:property></h1>
    </body>
</html>
