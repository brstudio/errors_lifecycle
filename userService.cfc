<cfcomponent output="false" displayname="user Service component">
	
	<cffunction name="addUser" access="public" returntype="void" >
		<cfargument name="userid" type="string" required="true" >
		<cfargument name="username" type="string" required="true" >
		<cfargument name="userlastname" type="string" required="true" >
		<cfargument name="userpasswd" type="string" required="true" >
		
		<cfquery >
			INSERT INTO users
			(userid,name,surname,password,roleid)
			VALUES
			(
				<cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.userlastname#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.userpasswd#" cfsqltype="cf_sql_varchar" />,
				1			
			)
		</cfquery>		
	</cffunction>
	
	<cffunction name="ListOfUsers" access="public" returntype="query" >
		<cfset var usersList=''/>
		<cfquery name="usersList" > 
			SELECT userid,name,surname,password 
			FROM users     
		</cfquery> 
		<cfreturn usersList>
	</cffunction>
	
	<cffunction name="selectUser" access="public" returntype="query">
		<cfargument name="argUserid" type="string" required="true" >
		<cfset var user=''/>
		<cfquery name="user" > 
			SELECT userid,name,surname,password 
			FROM users
			WHERE userid='#arguments.argUserid#'			     
		</cfquery> 
		<cfreturn user>
	</cffunction>
	
	<cffunction name="editUser" access="public" returntype="void" >
		<cfargument name="argUserid" type="string" required="true" >
		<cfargument name="username" type="string" required="true" >
		<cfargument name="userlastname" type="string" required="true" >
		<cfargument name="userpasswd" type="string" required="true" >
		<cfquery>
			UPDATE users
			SET			
			name = <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" />,
			surname = <cfqueryparam value="#arguments.userlastname#" cfsqltype="cf_sql_varchar" />,
			password = <cfqueryparam value="#arguments.userpasswd#" cfsqltype="cf_sql_varchar" />,
			roleid = 1
			WHERE userid = <cfqueryparam value="#arguments.argUserid#" cfsqltype="cf_sql_varchar" />
		</cfquery>
	</cffunction>
	
	<cffunction name="deleteUser" access="public" returntype="void" >
		<cfargument name="argUserid" type="string" required="true" >
		<cfquery >
			DELETE FROM users
			WHERE userid = <cfqueryparam value="#arguments.argUserid#" cfsqltype="cf_sql_varchar" />
		</cfquery>
	</cffunction>
	
	
</cfcomponent>