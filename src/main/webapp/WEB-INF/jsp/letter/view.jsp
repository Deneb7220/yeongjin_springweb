<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>letter</title>
<script type="text/javascript">
	function confirmDelete() {
		if (confirm("Do you want to delete this letter ?"))
			return true;
		else
			return false;
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<h2>view letter</h2>
	<p>
			<a href="./app/letter/delete?letterId=${letter.letterId}&mode=${param.mode}"onclick="return confirmDelete();">delete letter</a>
	</p>
	<hr/>
	<p>
		<span style="font-weight: bold;">letter title : ${letter.title } </span>
	</p>
	<hr/>
	<p>
        	 <span>sender : ${letter.senderName }(${letter.senderId })</span> || <span>receiver : ${letter.receiverName }(${letter.receiverId })</span>
	<hr/>
	<p>
		<span>content : ${letter.content }</span>
	</p>
	<hr/>
	<p>
		<span>date : ${letter.cdate }</span>
		</p>
		<p>
		<span>letter number : ${letter.letterId }</span>
	</p>
</body>
</html>