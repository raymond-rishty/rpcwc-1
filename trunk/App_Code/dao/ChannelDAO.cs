using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ChannelDAO
/// </summary>
public class ChannelDAO
{
    private static SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["RPC"].ConnectionString);
    private static String basefindSql = "SELECT TITLE, LINK, DESCRIPTION, LANGUAGE, COPYRIGHT, PUBDATE FROM channel ";
    private static String wherePKSql = "WHERE channel_id = @channelId ";

    public Channel findChannel(int channelId)
    {
        connection.Open();
        //commandString
        SqlCommand channelCommand = new SqlCommand(basefindSql + wherePKSql, connection);
        channelCommand.Parameters.AddWithValue("channelId", channelId);

        SqlDataReader dataReader = channelCommand.ExecuteReader();
        Channel channel = new Channel();
        if (dataReader.Read())
        {
            //channel.author = 
            channel.title = getString(dataReader, 0);
            channel.link = getString(dataReader, 1);
            channel.summary = getString(dataReader, 2);
            channel.language = getString(dataReader, 3);
            channel.copyright = getString(dataReader, 4);
        }

        dataReader.Close();
        
        connection.Close();
        return channel;
    }

    private string getString(SqlDataReader dataReader, int column)
    {
        if (!dataReader.IsDBNull(column))
            return dataReader.GetString(column);

        return null;
    }

	public ChannelDAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}
