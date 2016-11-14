<cfif structKeyExists(form,'fld_editErrorSubmit')>	
	<cfset addUserObj= createobject("component",'errorsService').editError(
		form.fld_errID,form.fld_errorDate,form.fld_short_description,form.fld_full_description,
		form.fld_userid,form.fld_statusX,form.fld_Urgency,form.fld_Crit,#dateFormat(now(), 'dd/mm/yyyy')#,
		form.fld_errorHistComment,#session.stLoggedInUser.userid#)/>
	<cflocation url="errors.cfm" />
</cfif>

<cfif structkeyExists(session,'stLoggedInuser') EQ false>
	<cflocation url="index.cfm" />
<cfelse>
	<!---display form for editing--->
	<cfset selectErrorObj = createobject("component",'errorsService')/>
	<cfset selectedError = selectErrorObj.getErrorByID(url.edit)/>
	<cfset getUrgencyObj= createobject("component",'errorsService').getUrgency()/>
	<cfset getCritObj= createobject("component",'errorsService').getCrit()/>
	<cfset selectErrorHistObj = createobject("component",'errorsService')/>
	<cfset selectedErrorHist = selectErrorHistObj.getErrorHist(url.edit)/>
	<cf_front>		
		<div class="errors-edit">
			<h1 class="errors-edit__h1">Error Edit</h1>			
			<cf_menu>
			<cfform name="frm_editErr" id="frm_editErr" preservedata="true">
					<fieldset>
						<legend class="edit-errors__items">Error edit</legend>				
						<dl>
							<!---Display form fields--->
							<dt><label class="edit-errors__userid">error ID: <cfoutput > #selectedError.errorid# </cfoutput></label></dt>
							<dt><label class="edit-errors__items">date</label></dt>
							<dd><cfinput name="fld_errorDate" id="fld_errorDate" value="#selectedError.date#"   required="true" /></dd>
							<br/><dt><label class="edit-errors__items">short description</label></dt>
							<dd><cfinput name="fld_short_description" value="#selectedError.short_description#" id="fld_short_description"  required="true" /></dd>
							<br/><dt><label class="edit-errors__items">full description</label></dt>
							<br/><dd class="edit-errors__textarea">
								<cftextarea class="edit-errors__textarea"  name="fld_full_description" value="#selectedError.full_description#" id="fld_full_description" richtext="true" required="true" ></cftextarea>
							</dd>
							<br/><dt><label class="edit-errors__items">user id</label></dt>
							<dd><cfinput name="fld_userid" value="#selectedError.userid#" id="fld_userid"  required="true" /></dd>
							<br/><dt><label class="edit-errors__items">status</label></dt>
							<dd><cfinput name="fld_statusX" id="fld_statusX" value="#selectedError.statusid#" /></dd>
							<br/><button type="button" onclick="changeStatus(0)">prev status</button>
							<button type="button"  onclick="changeStatus(1)">next status</button>							
							<br/><br/><dt><label class="edit-errors__items">Urgency</label></dt>
							<dd class="edit-errors__items">
								<cfselect class="edit-errors__items" name="fld_Urgency" id="fld_Urgency" query="variables.getUrgencyObj" selected="#selectedError.urgencyid#" value="urgencyid" display="urgency" queryposition="below" required="true" >
									<option value="0">Please choose the urgency</option>
								</cfselect>
							</dd>
							<br/><dt><label class="edit-errors__items">Criticality</label></dt>
							<dd>
								<cfselect class="edit-errors__items" name="fld_Crit" id="fld_Crit" query="variables.getCritObj" selected="#selectedError.critid#" value="critid" display="critname" queryposition="below" required="true" >
									<option value="0">Please choose the criticality</option>
								</cfselect>
							</dd>	
							<br/><dt><label class="edit-errors__items">Error history</label></dt>	
							<!---display history--->														
							<table class="errors__table">
								<tr class="table__row">
									<td class="errors__table-top">error hist id</td>
									<td class="errors__table-top">error id</td>
									<td class="errors__table-top">date</td>
									<td class="errors__table-top">status</td>
									<td class="errors__table-top">comment</td>
									<td class="errors__table-top">userID</td>									
								</tr>
								<cfoutput query="selectedErrorHist">
								<tr>
									<td class="table__row">#error_histid#</td>
									<td class="table__row">#errorid#</td>
									<td class="table__row">#date#</td>
									<td class="table__row">#actionid#</td>
									<td class="table__row">#comment#</td>
									<td class="table__row">#userid#</td>									
								</tr> 	      
								</cfoutput> <br>  
							</table>	
							<br/><dt><label class="edit-errors__items">Error history comment</label></dt>				
							<br/><br/><dd class="edit-errors__textarea">
								<cftextarea name="fld_errorHistComment" id="fld_errorHistComment" richtext="true" required="true" ></cftextarea>
							</dd>	
						</dl>
						<cfinput type="hidden" name="fld_errID" value="#selectedError.errorid#" />
						<input type="submit" name="fld_editErrorSubmit" id="fld_editErrorSubmit" value="Edit Error" />
					</fieldset>
				</cfform>			
			
			
		</div>
	</cf_front>
	
	<!------>
</cfif>