using System;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls;

public partial class maintenance_access_role : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["__EVENTARGUMENT"] != null && Request["__EVENTARGUMENT"] == "deleteRole")
        {
            Roles.DeleteRole(roleList.SelectedValue);
        }

        roleList.Attributes.Add("ondblclick", ClientScript.GetPostBackEventReference(roleList, "deleteRole"));
    }

    protected void getAllRoles(Object source, EventArgs eventArgs)
    {
        getAllRoles();
    }

    protected void getAllRoles()
    {
        roleList.Items.Clear();
        String[] roles = Roles.GetAllRoles();
        foreach (String role in roles)
        {
            roleList.Items.Add(role);
        }
    }

    protected void addRole(Object source, CommandEventArgs eventArgs)
    {
        Roles.CreateRole(newRole.Text);
        getAllRoles();
        newRole.Text = "";
    }
}
