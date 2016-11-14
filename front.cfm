<cfparam name="attributes.title" default="Login" >
<cfif thistag.executionMode EQ 'start'>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="utf-8" />
	<title><cfoutput>#attributes.title#</cfoutput></title>
<link href="core.css" rel="stylesheet" type="text/css" media="screen" />
	<script type="text/javascript" src="lib.js"></script>
	</head>	
	<body>		
	<cfelse>
	</body>
</cfif>
</html>