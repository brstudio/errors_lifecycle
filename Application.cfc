<cfcomponent output="false">
	<cfset this.name = 'errors'/>
	<cfset this.applicationTimeout = createtimespan(0,2,0,0)/>
	<cfset this.datasource="errorsdb" />
	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeout = createtimespan(0,0,30,0) />
	
	<cffunction name="onApplicationStart" returntype="boolean" >
		<cfset application.userService = createobject("component",'userService')/>
		<cfreturn true/>
	</cffunction>	
	<cffunction name="onRequestStart" returntype="boolean" >
		<cfargument name="targetPage" type="string" required="true" />
		<cfif isdefined('url.restartApp')>
			<cfset this.onApplicationStart() />
		</cfif>
		
		<cfreturn true/>
	</cffunction>
	
</cfcomponent>