<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>listsend</title>
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
	<h2>list of send letter</h2>
	<table>
		<thead>
			<tr>
				<th>letter number</th>
				<th>letter title</th>
				<th>receiver</th>
				<th>date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="letter" items="${letters}">
				<tr>
					<th><a href="./app/letter/view?letterId=${letter.letterId }&mode=SENT">${letter.letterId }</a></th>
					<th><a href="./app/letter/view?letterId=${letter.letterId }&mode=SENT">${letter.title }</a></th>
					<th>${letter.receiverName }(${letter.receiverId })</th>
					<th>${letter.cdate }</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</head>
</html>