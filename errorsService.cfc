<cfcomponent>
	
	<cffunction name="getUrgency" access="public" output="false" returntype="query">
		<cfset var rsUrgency = '' />
		<cfquery  name="rsUrgency">
			SELECT urgencyid,urgency
			FROM urgency
			ORDER BY urgencyid ASC
		</cfquery>
		<cfreturn rsUrgency />
	</cffunction>
	
	<cffunction name="getCrit" access="public" output="false" returntype="query">
		<cfset var rsCrit = '' />
		<cfquery  name="rsCrit">
			SELECT critid,critname
			FROM crit
			ORDER BY critid ASC
		</cfquery>
		<cfreturn rsCrit />
	</cffunction>
	
	<cffunction name="addError" access="public" returntype="void" >
		<cfargument name="errorDate" type="string" required="true" >
		<cfargument name="errorShortDescription" type="string" required="true" >
		<cfargument name="errorFullDescription" type="string" required="true" >
		<cfargument name="errorUserId" type="string" required="true" >
		<cfargument name="errorStatus" type="string" required="true" >
		<cfargument name="errorUrgencyId" type="numeric" required="true" />
		<cfargument name="errorCritId" type="numeric" required="true" />	
		<cfquery >
			INSERT INTO errors
			(date,short_description,full_description,userid,statusid,urgencyid,critid)
			VALUES
			(
				<cfqueryparam value="#arguments.errorDate#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.errorShortDescription#" cfsqltype="cf_sql_varchar" />,			
				<cfqueryparam value="#arguments.errorFullDescription#" cfsqltype="cf_sql_longvarchar" />,
				<cfqueryparam value="#arguments.errorUserId#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.errorStatus#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.errorUrgencyId#" cfsqltype="cf_sql_integer" />,
				<cfqueryparam value="#arguments.errorCritId#" cfsqltype="cf_sql_integer" />			
			)
		</cfquery>		
	</cffunction>
	
	<cffunction name="getErrorsList" access="public" output="false" returntype="query">
		<cfset var rsErrorsList = '' />
		<cfquery  name="rsErrorsList">
			SELECT errors.errorid,errors.date,errors.short_description,errors.full_description,errors.userid,errors.statusid,errors.urgencyid,errors.critid,urgency.urgency,crit.critname
			FROM errors INNER JOIN urgency ON errors.urgencyid = urgency.urgencyid INNER JOIN crit ON errors.critid = crit.critid
			ORDER BY date DESC 
		</cfquery>
		<cfreturn rsErrorsList />
	</cffunction>
	
	<!---add delete from hist table--->
	<cffunction name="deleteError" access="public" returntype="void" >
		<cfargument name="argErrorId" type="numeric" required="true" >
		<cfquery >
			DELETE FROM errors
			WHERE errorid = <cfqueryparam value="#arguments.argErrorId#" cfsqltype="cf_sql_integer" />
		</cfquery>
		<cfquery >
			DELETE FROM error_hist
			WHERE errorid = <cfqueryparam value="#arguments.argErrorId#" cfsqltype="cf_sql_integer" />
		</cfquery>
	</cffunction>
	
	<cffunction name="getErrorByID" access="public" output="false" returntype="query">
	<cfargument name="argErrorID" type="string" required="true" >
	<cfset var rsError = '' />
	<cfquery name="rsError">
		SELECT *
		FROM errors
		WHERE errorid = '#arguments.argErrorID#'
	</cfquery>
	<cfreturn rsError />
	</cffunction>
	
	<cffunction name="getErrorHist" access="public" output="false" returntype="query">
	<cfargument name="argErrorID" type="string" required="true" >
	<cfset var rsError = '' />
	<cfquery name="rsError">
		SELECT *
		FROM error_hist
		WHERE errorid = '#arguments.argErrorID#'
	</cfquery>
	<cfreturn rsError />
	</cffunction>
	
	<cffunction name="editError" access="public" returntype="void" >
		<cfargument name="argErrorID" type="string" required="true" >
		<cfargument name="errorDate" type="string" required="true" >
		<cfargument name="errorShortDescription" type="string" required="true" >
		<cfargument name="errorFullDescription" type="string" required="true" >
		<cfargument name="errorUserId" type="string" required="true" >
		<cfargument name="errorStatus" type="string" required="true" >
		<cfargument name="errorUrgencyId" type="numeric" required="true" />
		<cfargument name="errorCritId" type="numeric" required="true" />
		
		<cfargument name="errorHistDate" type="string" required="true" >
		<cfargument name="errorHistComment" type="string" required="true" >
		<cfargument name="currUserID" type="string" required="true" >		
		
		<cfquery>
			UPDATE errors
			SET			
			date=<cfqueryparam value="#arguments.errorDate#" cfsqltype="cf_sql_varchar" />,
			short_description=<cfqueryparam value="#arguments.errorShortDescription#" cfsqltype="cf_sql_varchar" />,			
			full_description=<cfqueryparam value="#arguments.errorFullDescription#" cfsqltype="cf_sql_longvarchar" />,
			userid=<cfqueryparam value="#arguments.errorUserId#" cfsqltype="cf_sql_varchar" />,
			statusid=<cfqueryparam value="#arguments.errorStatus#" cfsqltype="cf_sql_varchar" />,
			urgencyid=<cfqueryparam value="#arguments.errorUrgencyId#" cfsqltype="cf_sql_integer" />,
			critid=<cfqueryparam value="#arguments.errorCritId#" cfsqltype="cf_sql_integer" />		
			WHERE errorid = <cfqueryparam value="#arguments.argErrorID#" cfsqltype="cf_sql_varchar" />
		</cfquery>
		<cfquery >
			INSERT INTO error_hist
			(errorid,date,actionid,comment,userid)
			VALUES
			(
				<cfqueryparam value="#arguments.argErrorID#" cfsqltype="cf_sql_integer" />,	
				<cfqueryparam value="#arguments.errorHistDate#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.errorStatus#" cfsqltype="cf_sql_varchar" />,
				<cfqueryparam value="#arguments.errorHistComment#" cfsqltype="cf_sql_longvarchar" />,
				<cfqueryparam value="#arguments.currUserID#" cfsqltype="cf_sql_varchar" />
			)
			
		</cfquery>
	</cffunction>
	
	
</cfcomponent>