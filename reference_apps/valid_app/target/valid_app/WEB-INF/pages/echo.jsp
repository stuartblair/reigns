<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:directive.page contentType="text/plain"/>

method=<c:out value="${pageContext.request.method}"/>
requestURI=<c:out value="${pageContext.request.requestURI}"/>

param:
<c:forEach items="${param}" var="entry">
 <c:out value="${entry.key}"/>=<c:out value="${entry.value}"/>
</c:forEach>

requestScope:
<c:forEach items="${requestScope}" var="entry">
 <c:out value="${entry.key}"/>=<c:out value="${entry.value}"/>
</c:forEach>

header:
<c:forEach items="${header}" var="entry">
 <c:out value="${entry.key}"/>=<c:out value="${entry.value}"/>
</c:forEach>

cookie:
<c:forEach items="${cookie}" var="entry">
 <c:out value="${entry.key}"/>=<c:out value="${entry.value}"/>
</c:forEach>

sessionScope:
<c:forEach items="${sessionScope}" var="entry">
 <c:out value="${entry.key}"/>=<c:out value="${entry.value}"/>
</c:forEach>

applicationScope:
<c:forEach items="${applicationScope}" var="entry">
 <c:out value="${entry.key}"/>=<c:out value="${entry.value}"/>
</c:forEach>

initParam:
<c:forEach items="${initParam}" var="entry">
 <c:out value="${entry.key}"/>=<c:out value="${entry.value}"/>
</c:forEach>

