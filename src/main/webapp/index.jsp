<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE HTML>
<html>
<head>
  <meta charset="UTF-8">
  <title>print pg_settings</title>
</head>
<body>
  <h1>print pg_settings</h1>

  <c:catch var="exception">
    <sql:setDataSource var="datasource" dataSource="jdbc/postgres" />
    <sql:query var="results" dataSource="${datasource}">
      SELECT name, setting, unit FROM pg_settings;
    </sql:query>
  </c:catch>

  <c:if test="${not empty exception}">
  <pre><code><c:out value="${exception.message}" /></code></pre>
  </c:if>

  <c:if test="${not empty results}">
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
  </c:if>
</body>
</html>
