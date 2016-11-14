<cfif structkeyexists(url,'logout')>
	<cfset createobject("component" ,'authService').doLogout()>
</cfif>
<cfif structkeyExists(form,'fld_submitLogin')>	
	<cfset authServ = createobject("component",'authService')/>
	<cfset aErrorMessages = authServ.validateUser(form.fld_userid,form.fld_userPasswd)/>
	<cfif arrayisEmpty(aerrorMessages)>
		<cfset isUserLoggedIn = authServ.doLogin(form.fld_userid,form.fld_userPasswd)>
	</cfif>
</cfif>
<cf_front>	
	<cfform id="frmConnexion" preservedata="true" class="form">
		<fieldset>
	    <legend class="form__legend">Login</legend>
	    <!---when exsists errors in userid/pass--->
	    <cfif structkeyexists(variables,'aErrorMessages') AND NOT arrayisempty(aErrorMessages)>
	    	<cfoutput>
	    		<cfloop array="#aErrorMessages#" item="message">
	    			<p>#message#</p>
	    		</cfloop>
	    	</cfoutput>
	    <!---when userid is not found in database--->
	    </cfif>
	    <cfif structkeyexists(variables,'isUserLoggedIn') AND isUserLoggedIn EQ false>
	    	<p>User not found</p>
	    </cfif>
	    <!---if login is succsessful--->
	    <cfif structkeyExists(session,'stLoggedInuser')>
	    	<!--- go to 2nd page ---> 	
	    	<cflocation url="index.cfm" />
	    <cfelse>
			<dl class="form__label">
		    	<dt><label for="fld_userid">user id</label></dt>
		        <dd><cfinput type="text" name="fld_userid" id="fld_userid" required="true" validateAt="onSubmit" message="Please provide a user id"/></dd>
				<dt><label for="fld_userPasswd">password</label></dt>
		        <dd><cfinput type="password" name="fld_userPasswd" id="fld_userPasswd" required="true"  validateAt="onSubmit" message="Please provide a password" /></dd>
		    </dl>
		    <cfinput type="submit" name="fld_submitLogin" id="fld_submitLogin" value="Login" />  
	    </cfif>
	    </fieldset>
	</cfform>
</cf_front>
