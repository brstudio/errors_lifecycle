<cfcomponent output="false">

	<cffunction name="validateUser" access="public" output="false" returntype="array">
		<cfargument name="userid" type="string" required="true" />
		<cfargument name="userPasswd" type="string" required="true" />
		<cfset var a_error_messages = arraynew(1)/>
		<cfif arguments.userid EQ ''>
			<cfset arrayappend(a_error_messages,'please, provide a user id')>
		</cfif>
		<cfif arguments.userPasswd EQ ''>
			<cfset arrayappend(a_error_messages,'please, provide a user password')>
		</cfif>
		<cfreturn a_error_messages />
	</cffunction>
	
	<cffunction name="doLogin" access="public" output="false" returntype="boolean">
		<cfargument name="userid" type="string" required="true" />
		<cfargument name="userPasswd" type="string" required="true" />
		<cfset var is_user_loggedin = false/>
		<cfquery name = "qLoginUser">
			SELECT users.userid,users.name,users.surname,users.password,access_roles.role
			FROM users INNER JOIN access_roles ON users.roleid = access_roles.roleid
			WHERE userid = '#arguments.userid#' AND password = '#arguments.userPasswd#'
		</cfquery>
		<cfif qLoginUser.recordCount EQ 1>
			<cflogin >
				<cfloginuser name="#qLoginUser.name# #qLoginUser.surname#" password="#qLoginUser.password#" roles="#qLoginUser.role#">
			</cflogin>
			<cfset session.stLoggedInuser = {'userName' = qLoginUser.name, 'userSurname' = qLoginUser.surname, 'userid' = qLoginUser.userid}/>
			<cfset var is_user_loggedin = true/>
		</cfif>
		<cfreturn is_user_loggedin />
	</cffunction>
	
	<cffunction name="doLogout" access="public" output="false" returntype="void">
		<cfset structdelete(session,'stLoggedInuser')/>
		<cflogout />
	</cffunction>


</cfcomponent>