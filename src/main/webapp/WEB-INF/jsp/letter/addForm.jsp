<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>send letter</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<h2>send letter</h2>
	<form action="./app/letter/add" method="post">
	
	
		<p>title :</p>
		<p>
			<input type="text" name="title" maxlength="100" style="width: 100%;" required>
		</p>
		<p>content :</p>
		<p>
			<textarea name="content" style="width: 100%; height: 200px;" required></textarea>
		</p>
			<input type="hidden" name="receiverId" value="${param.receiverId}" required>
			<input type="hidden" name="receiverName" value="${param.receiverName}" required>
		<p>
			<button type="submit">send</button>
		</p>
	</form>
</body>
</html>