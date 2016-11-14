<cfif structKeyExists(form,'fld_newUserSubmit')>	
	<cfset addUserObj= createobject("component",'userService').addUser(form.fld_userid,form.fld_username,form.fld_usersurname,form.fld_userPassword)/>
	<cflocation url="users.cfm?add=true" />
</cfif>

<cfif structKeyExists(form,'fld_editUserSubmit')>	
	<cfset addUserObj= createobject("component",'userService').editUser(form.uID,form.fld_Eusername,form.fld_Eusersurname,form.fld_EuserPassword)/>
	<cflocation url="users.cfm?ed=true" />
</cfif>


<cfif structkeyExists(session,'stLoggedInuser') EQ false>
	<cflocation url="index.cfm" />
<cfelse>
	<cf_front>
	<cfif isDefined('url.newUser')>
			<!---creating a new user--->
			<div class="new-user">
				<h1 class="new-user__h1">newuser</h1>			
				<cf_menu>
				<cfform name="frm_addUser" id="frm_addUser" preservedata="true">
					<fieldset class="new-user__fieldset">
						<legend class="new-user__item">Add a user</legend>				
						<dl>
							<!---Display form fields--->
							<dt><label class="new-user__item">user id</label></dt>
							<dd><cfinput name="fld_userid" id="fld_userid" required="true" message="Please provide a first name" validateAt="onSubmit" /></dd>
							<dt><label class="new-user__item">name</label></dt>
							<dd><cfinput name="fld_username" id="fld_username" required="true" message="Please, provide a name" validateAt="onSubmit" /></dd>
							<dt><label class="new-user__item">surname</label></dt>
							<dd><cfinput name="fld_usersurname" id="fld_usersurname" required="true" message="Please, provide a surname" validateAt="onSubmit" /></dd>
							<dt><label class="new-user__item">Password</label></dt>
							<dd><cfinput type="password" name="fld_userPassword" id="fld_userPassword" required="true" message="Please, provide a password" validateAt="onSubmit" /></dd>
						</dl>
						<input type="submit" name="fld_newUserSubmit" id="fld_newUserSubmit" value="Add User" />
					</fieldset>
				</cfform>			
			</div>
	<cfelseif isDefined('url.add')>
		<h1 class="__h1">user added</h1>
		<cf_menu>
	<cfelseif isDefined('url.ed')>
		<h1 class="__h1">user edited</h1>
		<cf_menu>
	<cfelseif isdefined('url.del') >
		<cfset delUserObj= createobject("component",'userService').deleteUser(url.del)/>
		<h1 class="__h1"> user deleted</h1>
		<cf_menu>
			
	<cfelseif isDefined('url.edit')>
		<cfset selectUserObj = createobject("component",'userService')/>
		<cfset selectedUser = selectUserObj.selectUser(url.edit)/>
		<div>
			<h1 class="edit-user__h1">edit user</h1>		
			<cf_menu>	
			<cfform id="frm_editUser" preservedata="true">
				<fieldset>
					<legend class="edit-user__items">Edit a user</legend>				
					<dl>
						<!---Display form fields--->
						<dt><label class="edit-user__items edit-user__userid">user id: <cfoutput> #selectedUser.userid# </cfoutput></label></dt>
						<dt><label class="edit-user__items">name</label></dt>
						<dd><cfinput name="fld_Eusername" value="#selectedUser.name#" id="fld_Eusername" required="true" message="Please, provide a name" validateAt="onSubmit" /></dd>
						<dt><label class="edit-user__items">surname</label></dt>
						<dd><cfinput name="fld_Eusersurname" value="#selectedUser.surname#" id="fld_Eusersurname" required="true" message="Please, provide a surname" validateAt="onSubmit" /></dd>
						<dt><label class="edit-user__items">Password</label></dt>
						<dd><cfinput type="password" name="fld_EuserPassword" value="#selectedUser.password#" id="fld_EuserPassword" required="true" message="Please, provide a password" validateAt="onSubmit" /></dd>
					</dl>
					<cfinput name="uID" value="#selectedUser.userid#" type="hidden" />
					<input type="submit" name="fld_editUserSubmit" id="fld_editUserSubmit" value="Edit User" />
				</fieldset>
			</cfform>			
		</div>

	<cfelse>
		<div class="users">
			<h1 class="users__h1">users</h1>
			<cf_menu>
			<cfset usersListObj = createobject("component",'userService')/>
			<cfset usersList = usersListObj.ListOfUsers()/>
			<table class="users__table">
				<tr class="table__row">
					<td class="user__table-top">user id</td>
					<td class="user__table-top">user name</td>
					<td class="user__table-top">user surname</td>
					<td class="user__table-top">password</td>
					<td class="user__table-top">edit</td>
					<td class="user__table-top">delete</td>
				</tr>
				<cfoutput query="usersList">
				<tr class="table__row">
					<td class="table__row"> #userid#</td>
					<td class="table__row">#name#</td>
					<td class="table__row">#surname#</td>
					<td class="table__row">#password#</td>
					<td class="table__row"><a href="users.cfm?edit=#userid#">edit</a></td>
					<td class="table__row"><a href="users.cfm?del=#userid#">delete</a></td>
				</tr> 	      
				</cfoutput> <br>  
			</table>
		
		</div>	
	</cfif>
	</cf_front>
</cfif>