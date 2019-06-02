<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>listReceived</title>
<style type="text/css">
table {
	margin-top: 10px;
	border-collapse: collapse;
	border-top: 1px solid blue;
	border-bottom: 1px solid blue;
	width: 100%;
}
th, td {
	padding: 5px 0;
}
th {
	border-bottom: 1px solid gray;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<h2>list of Received letter</h2>
	<table>
		<thead>
			<tr>
				<th>letter number</th>
				<th>letter title</th>
				<th>sender</th>
				<th>date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="letter" items="${letters}">
				<tr>
					<th><a href="./app/letter/view?letterId=${letter.letterId }">${letter.letterId }</a></th>
					<th><a href="./app/letter/view?letterId=${letter.letterId }">${letter.title }</a></th>
					<th>${letter.senderName }(${letter.senderId })</th>
					<th>${letter.cdate }</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</head>
</html>