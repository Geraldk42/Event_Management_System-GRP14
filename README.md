# Event_Management_System-GRP14
cmt 302 database projectc
This guide outlines the SQL schema, example data, CRUD operations, advanced SQL queries, stored procedures, triggers, and security measures implemented for an Event Management System.
download the zip file from github from the 'code' button and extract the files, the main file is the Events.sql which is the database
Open  the workbench and navigate to the database tab and open the events.sql file to import the database.run the database to view the tables.
the data base is already populated so to test out the system's functionality run the following queries.
To add a new booking perform :
INSERT INTO tblbooking ( 
 BookingID, ServiceID, Name, MobileNumber, Email, 
 EventDate, EventStartingtime, EventEndingtime, 
 VenueAddress, EventType, AdditionalInformation 
) VALUES ( 
 FLOOR(RAND() * (999999999 - 100000000) + 100000000), 
 1, 'John Doe', 1234567890, 'john@example.com', 
 '2024-12-25', '10:00 AM', '2:00 PM', 
 '123 Main St, City', 'Wedding', 'Special decoration needed' 
);

To retrive a booking :
SELECT 
 b.*, 
 s.ServiceName, 
 s.ServicePrice 
FROM tblbooking b 
LEFT JOIN tblservice s ON b.ServiceID = s.ID 
WHERE b.BookingID = 954554731;

To modify a booking status:
UPDATE tblbooking 
SET Status = 'Approved', 
 Remark = 'Confirmed by manager' 
WHERE BookingID = 954554731;

To cancel or delete a booking :
UPDATE tblbooking 
SET Status = 'Cancelled' 
WHERE BookingID = 954554731;

The above showcase the CRUD capability of the system!!!

The system is capable of Advanced SQL queries
The system can generate revenue statistics by event type. To perform such a query:
SELECT 
 et.EventType, 
 COUNT(b.ID) as total_events, 
 SUM(CAST(s.ServicePrice AS DECIMAL(10,2))) as total_revenue, 
 AVG(CAST(s.ServicePrice AS DECIMAL(10,2))) as avg_revenue_per_event 
FROM tbleventtype et 
LEFT JOIN tblbooking b ON et.EventType = b.EventType 
LEFT JOIN tblservice s ON b.ServiceID = s.ID 
GROUP BY et.EventType 
HAVING total_events > 0 
ORDER BY total_revenue DESC;

The system can also do Busy Time Slot Analysis: Lists dates with most activity, the services linked to them, and 
the event types linked to those dates. 
SELECT 
 EventDate, 
 COUNT(*) as event_count, 
 GROUP_CONCAT(DISTINCT EventType) as event_types, 
 GROUP_CONCAT(DISTINCT ServiceName) as services_used 
FROM tblbooking b 
LEFT JOIN tblservice s ON b.ServiceID = s.ID 
GROUP BY EventDate 
HAVING event_count > 1 
ORDER BY event_count DESC;

The system also does  Stored Procedures and Triggers
Stored Procedure to Retrieve Bookings by Date: Returns bookings on a specific date 
and event information. 
DELIMITER // 
CREATE PROCEDURE GetBookingsByDate(IN eventDate VARCHAR(200)) 
BEGIN 
 SELECT 
 b.BookingID, 
 b.Name, 
 b.EventDate, 
 b.EventStartingtime, 
 b.EventEndingtime, 
 s.ServiceName, 
 s.ServicePrice 
 FROM tblbooking b 
 LEFT JOIN tblservice s ON b.ServiceID = s.ID 
 WHERE b.EventDate = eventDate; 
END // 
DELIMITER;

Trigger to Log Booking Status Changes: Registers booking status changes by 
generating a log entry. 
CREATE TABLE booking_status_logs ( 
 id INT AUTO_INCREMENT PRIMARY KEY, 
 booking_id INT, 
 old_status VARCHAR(200), 
 new_status VARCHAR(200), 
 changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);
DELIMITER // 
CREATE TRIGGER booking_status_change 
AFTER UPDATE ON tblbooking 
FOR EACH ROW 
BEGIN 
 IF OLD.Status != NEW.Status THEN 
 INSERT INTO booking_status_logs (booking_id, old_status, new_status) 
 VALUES (NEW.BookingID, OLD.Status, NEW.Status); 
 END IF; 
END // 
DELIMITER ;

Security measures were also implemented to ensure data integrity and control access. this was achieved in the permissiones table. to modify this .
INSERT INTO permissions (id, permission, createuser, deleteuser, createbid, updatebid) 
VALUES 
(1, 'Superuser', '1', '1', '1', '1'), 
(2, 'Admin', '1', NULL, '1', '1'), 
(3, 'User', NULL, NULL, '1', NULL);

Data Validation via Triggers: We prevented input errors by not accepting requests that 
began with an ending time before the start time. 
DELIMITER // 
CREATE TRIGGER validate_event_times 
BEFORE INSERT ON tblbooking 
FOR EACH ROW 
BEGIN 
 IF NEW.EventStartingtime >= NEW.EventEndingtime THEN 
 SIGNAL SQLSTATE '45000' 
 SET MESSAGE_TEXT = 'Event ending time must be after starting time'; 
 END IF; 
END // 
DELIMITER ;

. Encryption: Admin passwords were stored as MD5() to ensure that anyone who stole the 
data could not access it easily from the database. 
CALL AddNewAdmin( 
 'U003', 
 'TestAdmin', 
 'testadmin', 
 'Test', 
 'Admin', 
 9876543210, 
 'testadmin@example.com', 
 MD5('password123') 
);

with those queries in mind its easy to navigate the system!!!
THANK YOU FOR GETTING THIS FAR!!!

