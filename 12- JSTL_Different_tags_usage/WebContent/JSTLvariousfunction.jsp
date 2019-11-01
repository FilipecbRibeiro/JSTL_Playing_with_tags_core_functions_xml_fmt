<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSTL Length Function</title>
</head>
<body>

	<%-- The reason why its called functions tags it's because we deal only with fucntions here --%>
	<%
		String[] names = { "Filipe", "Andre", "Castro" };
	%>
	<c:set var="StringArray" value="<%=names%>"></c:set>
	${fn:length(StringArray)}
	<br> ${fn:trim("      Filipe     Ribeiro          ") }
	<h1>EscapeXML Demo</h1>
	${fn:escapeXml("<h1> EscapeXML Demo </h1>") }
	<!-- This will prevent the tags from occur -->
	<br>
	<c:set var="temp"
		value="https://github.com/FilipecbRibeiro?tab=repositories"></c:set>
	${fn:startsWith(temp,'h')}
	<br> ${fn:endsWith(temp,'es') }
	<br> ${fn:containsIgnoreCase(temp, 'HUB')}
	<br>
	<br>

	<%-- ToLowerCase--%>
	${fn:toLowerCase("FiLIpE")}
	<br>
	<%-- ToUpperCase--%>
	${fn:toUpperCase("filipe")}
	<br>
	<%-- indexOf()--%>
	${fn:indexOf("filipe","lipe")}
	<br>
	<%-- replace()--%>
	${fn:replace("Flipie","lipie","ilipe")}
	<br>
	<%-- substring()--%>
	${fn:substring("Filipe",1,4)}
	<br>
	<%-- substringBefore()--%>
	${fn:substringBefore("FilipeRibeiro","Ribeiro") }
	<br>
	<%-- substringAfter()--%>
	${fn:substringAfter("FilipeRibeiro","Filipe")}
	
	<c:set var="elements" value="${fn:split('Filipe.Andre.Castro','.')}" />


	<c:forEach var="element" items="${elements}">
		${element}
		<br>
	</c:forEach>

	${fn:join(elements,' ')}

	<c:import url="/Users.xml" var="XMLFile"></c:import>
	<%--If we only use this one then it will import all users inside of xml file --%>
	<x:parse xml="${XMLFile}" var="XMLdoc"></x:parse>
	<x:out select="$XMLdoc/users/user[2]" />
	<%--if we dont specify will bring the first one.									also this is Nodes so the first one is 1
	 --%>
	<%--LET'S NOW PERFORM SOME ForEach and if's with XML!!!! --%>
<br>
<br>
	<table border="1">
		<tr>
			<th>Name</th>
			<th>Gender</th>
			<th>Age</th>
		</tr>
		<x:forEach select="$XMLdoc/users/user">

			<tr>
				<x:if select="age>30">
					<%-- only user with age above 30 will be selected  --%>
					<td><i><x:out select="name" /></i></td>
					
					<td><x:out select="gender" /></td>
					
					<td><x:out select="age" /></td>
					
				</x:if>
			</tr>
		</x:forEach>
	</table>
<br>
<p><b>Better way to show info !!!</b></p><br>
	<table border="1">
		<tr>
			<th>Name</th>
			<th>Gender</th>
			<th>Age</th>
		</tr>

		<x:forEach select="$XMLdoc/users/user">
			<x:choose>
				<x:when select="age>30">
					<tr>
						<td><b><i><x:out select="name" /></i></b></td>
						<td><b><i><x:out select="gender" /></i></b></td>
						<td><b><i><x:out select="age" /></i></b></td>
					</tr>
				</x:when>
				<x:otherwise>
						<td><x:out select="name" /></td>
						<td><x:out select="gender" /></td>
						<td><x:out select="age" /></td>
				</x:otherwise>
			</x:choose>
		</x:forEach>
	</table>
<%--VIEW I18N------> (I)nternationalizatio(N) 18 letters  
short explanation, is the possibility to use different type of languages and currencies!

Local id is used to help identify languages and or countries for instance my country (Portugal) will have a Locale ID of-----> pt-PT


--%>


</body>
</html>