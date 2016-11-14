<cfif structKeyExists(form,'fld_newErrorSubmit')>	
	<cfset addUserObj= createobject("component",'errorsService').addError(
		form.fld_errorDate,form.fld_short_description,form.fld_full_description,form.fld_userid,
		form.fld_status,form.fld_Urgency,form.fld_Crit)/>
	<cflocation url="errors.cfm" />
</cfif>

<cfif structkeyExists(session,'stLoggedInuser') EQ false>
	<cflocation url="index.cfm" />
<cfelse>
	<cfset getUrgencyObj= createobject("component",'errorsService').getUrgency()/>
	<cfset getCritObj= createobject("component",'errorsService').getCrit()/>
	<cf_front>
		<div>	
			<div class="new-error">
				<h1 class="new-error__h1">New Error</h1>			
				<cf_menu>
				<cfform name="frm_addErr" id="frm_addErr" preservedata="true">
					<fieldset>
						<legend class="new-errors__items">Add an error</legend>				
						<dl>
							<!---Display form fields--->
							<dt><label class="new-errors__items">date</label></dt>
							<dd><cfinput name="fld_errorDate" id="fld_errorDate" value="#dateFormat(now(), 'dd/mm/yyyy')#"   required="true" /></dd>
							<br/><dt><label class="new-errors__items">short description</label></dt>
							<dd><cfinput name="fld_short_description" id="fld_short_description"  required="true" /></dd>
							<br/><dt><label class="new-errors__items">full description</label></dt>
							<dd class="new-errors__textarea">
								<cftextarea name="fld_full_description" id="fld_full_description" richtext="true" required="true" ></cftextarea>
							</dd>
							<br/><dt class="new-errors__userid"><label>user id</label></dt>
							<dd><cfinput name="fld_userid" id="fld_userid" value="#session.stLoggedInUser.userid#" required="true" /></dd>
							<br/><dt><label class="new-errors__items">status</label></dt>
							<dd><cfinput name="fld_status" id="fld_status" value="new" /></dd>
							<br/><dt><label class="new-errors__items">Urgency</label></dt>
							<dd>
								<cfselect class="new-errors__items" name="fld_Urgency" id="fld_Urgency" query="variables.getUrgencyObj" value="urgencyid" display="urgency" queryposition="below" required="true" >
									<option value="0">Please choose the urgency</option>
								</cfselect>
							</dd>
							<br/><dt><label class="new-errors__items">Urgency</label></dt>
							<dd>
								<cfselect class="new-errors__items" name="fld_Crit" id="fld_Crit" query="variables.getCritObj" value="critid" display="critname" queryposition="below" required="true" >
									<option value="0">Please choose the criticality</option>
								</cfselect>
							</dd>
							
						</dl>
						<input type="submit" name="fld_newErrorSubmit" id="fld_newErrorSubmit" value="Add Error" />
					</fieldset>
				</cfform>			
			</div>
			
		</div>
	</cf_front>
</cfif>