<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource var="datasource" dataSource="jdbc/postgres" />
<sql:query var="results" dataSource="${datasource}">
  SELECT name, setting, unit FROM pg_settings;
</sql:query>

<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <title>print pg_settings</title>
</head>
<body>
  <h1>print pg_settings</h1>
  <table border="">
    <caption>pg_settings</caption>
    <thead>
      <tr><th>name</th><th>setting</th><th>unit</th></tr>
    </thead>
    <tbody>
    <c:forEach var="r" items="${results.rows}">
      <tr><td><c:out value="${r.name}"/></td><td><c:out value="${r.setting}"/></td><td><c:out value="${r.unit}"/></td></tr>
    </c:forEach>
    </tbody>
  </table>
</body>
</html>
