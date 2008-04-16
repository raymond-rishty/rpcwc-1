using System;
using System.Collections;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for CalendarManager
/// </summary>
public class CalendarManager
{
    private CalendarDAO _calendarDAO;

	public CalendarManager()
	{
        calendarDAO = new CalendarDAO();
		//
		// TODO: Add constructor logic here
		//
	}

    public static EventCalendar findEventsByMonth(int year, int month)
    {
        return CalendarDAO.getEvents(year, month);
        //return generateEventsForMonth(year, month);
    }

    public static IList findDatesByMonth(int year, int month)
    {
        return CalendarDAO.findDatesByMonth(year, month);
    }

    public static WebControl findEvent(DateTime date)
    {
        return CalendarDAO.findEvent(date);
    }

    private Event generateEvent(
        DateTime date,
        String description,
        String title
        )
    {
        Event thisEvent = new Event();
        thisEvent.date = date;
        thisEvent.description = description;
        thisEvent.title = title;
        return thisEvent;
    }

    private EventCalendar generateEventsForMonth(int year, int month)
    {
        EventCalendar eventCalendar = new EventCalendar();
        eventCalendar.events = new Hashtable();
        addToDate(eventCalendar,
            new DateTime(year, month, 12),
            generateEvent(new DateTime(year, month, 12),
            "An event on the twelfth",
            "Event on twelfth!"));
        addToDate(eventCalendar,
            new DateTime(year, month, 15),
            generateEvent(new DateTime(year, month, 15),
            "This event is to recognize the Ides of March. As Shakespeare once said \"Beware the Ides!\"",
            "Ides of March"));
        addToDate(eventCalendar,
            new DateTime(year, month, 15),
            generateEvent(new DateTime(year, month, 15, 3, 0, 0),
            "This event is to recognize the third hour of the Ides of March. As Shakespeare once said \"It's three o'clock!\"",
            "Ides of March"));
        return eventCalendar;
    }

    private void addToDate(EventCalendar eventCalendar, DateTime date, Event scheduledEvent)
    {
        if (eventCalendar.events[date] == null)
            eventCalendar.events[date] = new ArrayList();

        ((ArrayList)eventCalendar.events[date]).Add(scheduledEvent);
    }

    public CalendarDAO calendarDAO
    {
        get
        {
            return _calendarDAO;
        }
        set
        {
            _calendarDAO = value;
        }
    }
}
