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
using System.Collections;

/// <summary>
/// Summary description for DirectoryDAO
/// </summary>
public class DirectoryDAO
{
    private static string directoryCommandString = "findDirectory";
    private static string emailForDirCommandString = "findEmailForDir";
    private static string phonesForDirCommandString = "findPhoneForDir";
    private static string personCommandString = "findPersonForDir";
    private static string emailForPersonCommandString = "findEmailForPerson";
    private static string phonesForPersonCommandString = "findPhoneForPerson";
    private static SqlConnection directoryConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["RPC"].ConnectionString);
    private static SqlConnection emailForDirConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["RPC"].ConnectionString);
    private static SqlConnection phonesForDirConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["RPC"].ConnectionString);
    private static SqlConnection personConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["RPC"].ConnectionString);
    private static SqlConnection emailForPersonConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["RPC"].ConnectionString);
    private static SqlConnection phonesForPersonConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["RPC"].ConnectionString);

    public static IList getDirectory()
    {
        IList directoryEntries = new ArrayList();

        directoryConnection.Open();

        SqlCommand directoryCommand = new SqlCommand(directoryCommandString, directoryConnection);
        directoryCommand.CommandType = CommandType.StoredProcedure;

        SqlDataReader dataReader = directoryCommand.ExecuteReader();

        while (dataReader.Read())
        {
            Directory directory = new Directory();

            directory.lastName = getString(dataReader, 0);
            directory.address1 = getString(dataReader, 1);
            directory.address2 = getString(dataReader, 2);
            directory.city = getString(dataReader, 3);
            directory.state = getString(dataReader, 4);
            directory.zip = getString(dataReader, 5);
            directory.id = getByte(dataReader, 6);

            directory.emails = getEmails(directory);
            directory.phones = getPhones(directory);
            directory.persons = getPersons(directory);
            directoryEntries.Add(directory);
        }

        dataReader.Close();
        directoryConnection.Close();

        return directoryEntries;
    }

    public static IList getPersons(Directory directory)
    {
        IList persons = new ArrayList();
        personConnection.Open();

        SqlCommand personCommand = new SqlCommand(personCommandString, personConnection);
        personCommand.Parameters.AddWithValue("entryId", directory.id);
        personCommand.CommandType = CommandType.StoredProcedure;

        SqlDataReader dataReader = personCommand.ExecuteReader();

        while (dataReader.Read())
        {
            Person person = new Person();
            person.id = getInt16(dataReader, 0);
            person.firstName = getString(dataReader,2);
            person.lastName = getString(dataReader, 3);
            person.birthDate = getDateTime(dataReader, 4);
            person.isMember = getBoolean(dataReader, 5);
            person.emails = getEmails(person);
            person.phones = getPhones(person);
            persons.Add(person);
        }

        dataReader.Close();
        personConnection.Close();

        return persons;
    }

    public static IList getEmails(Directory directory)
    {
        IList emails = new ArrayList();

        emailForDirConnection.Open();

        SqlCommand emailForDirCommand = new SqlCommand(emailForDirCommandString, emailForDirConnection);
        emailForDirCommand.Parameters.AddWithValue("entryId", directory.id);
        emailForDirCommand.CommandType = CommandType.StoredProcedure;

        SqlDataReader dataReader = emailForDirCommand.ExecuteReader();

        while (dataReader.Read())
        {
            Email email = new Email();
            email.emailAddress = getString(dataReader, 0);
            email.emailType = getString(dataReader, 1);
            email.id = getByte(dataReader, 2);
            emails.Add(email);
        }

        dataReader.Close();
        emailForDirConnection.Close();

        return emails;
    }

    public static IList getPhones(Directory directory)
    {
        IList phones = new ArrayList();

        personConnection.Open();

        SqlCommand phonesForDirCommand = new SqlCommand(phonesForDirCommandString, personConnection);
        phonesForDirCommand.Parameters.AddWithValue("entryId", directory.id);
        phonesForDirCommand.CommandType = CommandType.StoredProcedure;

        SqlDataReader dataReader = phonesForDirCommand.ExecuteReader();

        while (dataReader.Read())
        {
            Phone phone = new Phone();
            phone.phoneNumber = getString(dataReader, 0);
            phone.phoneType = getString(dataReader, 1);
            phone.id = getByte(dataReader, 2);
            phones.Add(phone);
        }

        dataReader.Close();
        personConnection.Close();

        return phones;
    }

    public static IList getEmails(Person person)
    {
        IList emails = new ArrayList();

        emailForPersonConnection.Open();

        SqlCommand emailForPersonCommand = new SqlCommand(emailForPersonCommandString, emailForPersonConnection);
        emailForPersonCommand.Parameters.AddWithValue("personEntryId", person.id);
        emailForPersonCommand.CommandType = CommandType.StoredProcedure;

        SqlDataReader dataReader = emailForPersonCommand.ExecuteReader();

        while (dataReader.Read())
        {
            Email email = new Email();
            email.emailAddress = getString(dataReader, 0);
            email.emailType = getString(dataReader, 1);
            email.id = getByte(dataReader, 2);
            emails.Add(email);
        }

        dataReader.Close();
        emailForPersonConnection.Close();

        return emails;
    }

    public static IList getPhones(Person person)
    {
        IList phones = new ArrayList();

        phonesForPersonConnection.Open();

        SqlCommand phonesForPersonCommand = new SqlCommand(phonesForPersonCommandString, phonesForPersonConnection);
        phonesForPersonCommand.Parameters.AddWithValue("personEntryId", person.id);
        phonesForPersonCommand.CommandType = CommandType.StoredProcedure;

        SqlDataReader dataReader = phonesForPersonCommand.ExecuteReader();

        while (dataReader.Read())
        {
            Phone phone = new Phone();
            phone.phoneNumber = getString(dataReader, 0);
            phone.phoneType = getString(dataReader, 1);
            phone.id = getByte(dataReader, 2);
            phones.Add(phone);
        }

        dataReader.Close();
        phonesForPersonConnection.Close();

        return phones;
    }

    private static string getString(SqlDataReader dataReader, int column)
    {
        if (!dataReader.IsDBNull(column))
            return dataReader.GetString(column);

        return null;
    }

    private static DateTime getDateTime(SqlDataReader dataReader, int column)
    {
        if (!dataReader.IsDBNull(column))
            return dataReader.GetDateTime(column);

        return new DateTime();
    }

    private static bool getBoolean(SqlDataReader dataReader, int column)
    {
        if (!dataReader.IsDBNull(column))
            return dataReader.GetBoolean(column);

        return false;
    }

    private static int getInt16(SqlDataReader dataReader, int column)
    {
        if (!dataReader.IsDBNull(column))
            return dataReader.GetInt16(column);

        return 0;
    }

    private static int getByte(SqlDataReader dataReader, int column)
    {
        if (!dataReader.IsDBNull(column))
            return (int) dataReader.GetByte(column);

        return 0;
    }
}
