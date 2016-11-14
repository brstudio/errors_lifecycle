<!---verify each page--->
<cfif structkeyExists(session,'stLoggedInuser') EQ false>
	<cfinclude template="loginform.cfm" >
<cfelse>
	<cf_front>
	<p class="__username"><cfoutput >Welcome #session.stLoggedInuser.userName# #session.stLoggedInuser.userSurname#</cfoutput></p>
	<h1 class="__h1">Get started</h1>
	<cf_menu>		
	</cf_front>
</cfif>