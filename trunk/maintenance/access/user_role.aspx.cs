using System;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls;

public partial class maintenance_access_userrole : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["__EVENTARGUMENT"] != null && Request["__EVENTARGUMENT"] == "addUserToRole")
        {
            addUserToRole(UserList.SelectedItem.Text, RoleNotList.SelectedValue);
        }
        if (Request["__EVENTARGUMENT"] != null && Request["__EVENTARGUMENT"] == "dropUserFromRole")
        {
            dropUserFromRole(UserList.SelectedItem.Text, RoleList.SelectedValue);
        }
        RoleNotList.Attributes.Add("ondblclick", ClientScript.GetPostBackEventReference(RoleNotList, "addUserToRole"));
        RoleList.Attributes.Add("ondblclick", ClientScript.GetPostBackEventReference(RoleList, "dropUserFromRole"));
    }

    protected void initUserList(object sender, EventArgs e)
    {
        MembershipUserCollection users = Membership.GetAllUsers();
        foreach (MembershipUser user in users)
        {
            UserList.Items.Add(user.UserName);
        }

    }

    protected ArrayList getRolesNotUser(String username)
    {
        String[] allRoles = Roles.GetAllRoles();
        String[] userRoles = Roles.GetRolesForUser(username);
        ArrayList rolesNot = new ArrayList(allRoles.Length);

        foreach (String role in allRoles)
        {
            bool doesUserHaveRole = false;
            foreach (String userRole in userRoles)
            {
                if (userRole.Equals(role))
                {
                    doesUserHaveRole = true;
                    break;
                }
            }

            if (!doesUserHaveRole)
                rolesNot.Add(role);
        }

        return rolesNot;
    }

    protected void updateAddRoleNotList(Object Source, EventArgs e)
    {
        updateAddRoleNotList(((ListBox)Source).SelectedValue);
    }

    protected void updateAddRoleNotList(String username)
    {
        RoleNotList.Items.Clear();
        ArrayList rolesNot = getRolesNotUser(username);

        foreach (String role in rolesNot)
        {
            RoleNotList.Items.Add(role);
        }
    }

    protected void updateAddRoleList(Object Source, EventArgs e)
    {
        updateAddRoleList(((ListBox)Source).SelectedValue);
    }

    protected void updateAddRoleList(String username)
    {
        RoleList.Items.Clear();
        String[] roles = Roles.GetRolesForUser(username); ;

        foreach (String role in roles)
        {
            RoleList.Items.Add(role);
        }
    }

    protected void updateRoleLists(Object Source, EventArgs e)
    {
        updateAddRoleList(((ListBox)Source).SelectedValue);
        updateAddRoleNotList(((ListBox)Source).SelectedValue);
    }

    protected static string[] listItemCollectionToStringArray(ListItemCollection items)
    {
        ArrayList arrayList = new ArrayList(items.Count);

        foreach (ListItem listItem in items)
        {
            if (listItem.Selected == true)
                arrayList.Add(listItem.Text);
        }

        arrayList.TrimToSize();

        return (string[])arrayList.ToArray(typeof(string));
    }

    protected void addUserToRole(String username, String role)
    {
        Roles.AddUserToRole(username, role);
        updateAddRoleNotList(UserList.SelectedValue);
        updateAddRoleList(UserList.SelectedValue);
    }

    protected void dropUserFromRole(String username, String role)
    {
        Roles.RemoveUserFromRole(username, role);
        updateAddRoleNotList(UserList.SelectedValue);
        updateAddRoleList(UserList.SelectedValue);
    }

    protected void assignRole(Object Source, CommandEventArgs e)
    {
        Roles.AddUserToRoles(UserList.SelectedItem.Text, listItemCollectionToStringArray(RoleNotList.Items));
        updateAddRoleNotList(UserList.SelectedValue);
    }
}
