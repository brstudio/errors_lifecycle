<cfif structkeyExists(session,'stLoggedInuser') EQ false>
	<cflocation url="index.cfm" />
<cfelseif isdefined('url.del') >
		<cfset delUserObj= createobject("component",'errorsService').deleteError(url.del)/>
		<cf_front>
		<h1 class="__h1"> Error deleted</h1>
		<cf_menu>
		</cf_front>	
<cfelse>	
	<cf_front>
		<h1 class="errors__h1">Errors</h1>
		<cf_menu>
		<div>			
			<cfset errorsListObj = createobject("component",'errorsService')/>
			<cfset errorsList = errorsListObj.getErrorsList()/>
			<table class="errors__table">
				<tr class="errors__table-top">
					<td class="errors__table-top">error id</td>
					<td class="errors__table-top">date</td>
					<td class="errors__table-top">short description</td>
					<td class="errors__table-top">full description</td>
					<td class="errors__table-top">userId</td>
					<td class="errors__table-top">status</td>
					<td class="errors__table-top">urgency</td>
					<td class="errors__table-top">criticality</td>
					<td class="user__table-top">edit</td>
					<td class="user__table-top">delete</td>
				</tr>
				<cfoutput query="errorsList">
				<tr class="table__row">
					<td class="table__row">#errorid#</td>
					<td class="table__row">#date#</td>
					<td class="table__row">#short_description#n</td>
					<td class="table__row">#full_description#</td>
					<td class="table__row">#userid#</td>
					<td class="table__row">#statusid#</td>
					<td class="table__row">#urgency#</td>
					<td class="table__row">#critname#</td>
					<td class="table__row"><a href="errorEdit.cfm?edit=#errorid#">edit</a></td>
					<td class="table__row"><a href="errors.cfm?del=#errorid#">delete</a></td>
				</tr> 	      
				</cfoutput> <br>  
			</table>	
				
		</div>
	</cf_front>
</cfif>