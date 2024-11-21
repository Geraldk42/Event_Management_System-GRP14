GROUP 14 - LIST OF STORED PROCEDURES, TRIGGURES, ADVANVED QUEROES used in the project
1. The trigures
a). To get all bookings f=or a pecific date

USE Event;

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

DELIMITER ;

example: 

DELIMITER //
BEGIN
    INSERT INTO tblbooking (BookingID, ServiceID, Name, MobileNumber, Email, EventDate, EventStartingtime, EventEndingtime, EventType)
    VALUES 
    (123456789, 1, 'Test User 1', 1234567890, 'test1@example.com', '2024-12-25', '10:00 AM', '2:00 PM', 'Wedding'),
    (123456790, 2, 'Test User 2', 1234567891, 'test2@example.com', '2024-12-25', '3:00 PM', '7:00 PM', 'Birthday Party');

    CALL GetBookingsByDate('2024-12-25');
END //
DELIMITER ;


b). The procedure for adding a new admin

DELIMITER //
CREATE PROCEDURE AddNewAdmin(
    IN p_Staffid VARCHAR(255),
    IN p_AdminName VARCHAR(120),
    IN p_UserName VARCHAR(120),
    IN p_FirstName VARCHAR(255),
    IN p_LastName VARCHAR(255),
    IN p_MobileNumber BIGINT,
    IN p_Email VARCHAR(200),
    IN p_Password VARCHAR(120)
)
BEGIN
    INSERT INTO tbladmin (
        Staffid, AdminName, UserName, FirstName, LastName, 
        MobileNumber, Email, Password
    ) VALUES (
        p_Staffid, p_AdminName, p_UserName, p_FirstName, p_LastName,
        p_MobileNumber, p_Email, p_Password
    );
END //
DELIMITER ;

example usege: 
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


2) Triggures used
a) To Log out booking status 

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

example usage: 

UPDATE tblbooking 
SET Status = 'Approved' 
WHERE BookingID = 123456789;

SELECT * FROM booking_status_logs 
WHERE booking_id = 123456789;


b) Trigure for validating event time i.e end time should not be less than start time

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

example usage: 
INSERT INTO tblbooking (
    BookingID, ServiceID, Name, EventDate, 
    EventStartingtime, EventEndingtime
) VALUES (
    999999999, 1, 'Error Test', '2024-12-26', 
    '3:00 PM', '2:00 PM'  -- bad time so it shoud fail
);


3. Advanved Queries
i) Get revenue statistics by event type

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



ii) Get busy time slots analysis

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


4. Views Used
i) View For all active bookings

CREATE VIEW vw_active_bookings AS
SELECT 
    b.BookingID,
    b.Name,
    b.EventDate,
    b.EventStartingtime,
    b.EventEndingtime,
    b.EventType,
    s.ServiceName,
    s.ServicePrice,
    b.Status
FROM tblbooking b
LEFT JOIN tblservice s ON b.ServiceID = s.ID
WHERE b.Status IS NULL OR b.Status != 'Cancelled';


ii) View for admin activity view

CREATE VIEW vw_admin_activity AS
SELECT 
    a.Staffid,
    CONCAT(a.FirstName, ' ', a.LastName) as full_name,
    a.Email,
    COUNT(b.ID) as total_bookings_handled,
    MAX(b.BookingDate) as last_booking_handled
FROM tbladmin a
LEFT JOIN tblbooking b ON a.Email = b.Email
GROUP BY a.Staffid, full_name, a.Email;

5. REPORTS USED
i) Reports for booking per month
SELECT 
    DATE_FORMAT(STR_TO_DATE(EventDate, '%Y-%m-%d'), '%Y-%m') as month,
    COUNT(*) as total_bookings,
    COUNT(DISTINCT EventType) as unique_event_types,
    SUM(CAST(s.ServicePrice AS DECIMAL(10,2))) as total_revenue
FROM tblbooking b
LEFT JOIN tblservice s ON b.ServiceID = s.ID
GROUP BY month
ORDER BY month DESC;


ii) Reports for how popular a service is

SELECT 
    s.ServiceName,
    COUNT(b.ID) as times_booked,
    ROUND(COUNT(b.ID) * 100.0 / (SELECT COUNT(*) FROM tblbooking), 2) as booking_percentage,
    SUM(CAST(s.ServicePrice AS DECIMAL(10,2))) as total_revenue
FROM tblservice s
LEFT JOIN tblbooking b ON s.ID = b.ServiceID
GROUP BY s.ID, s.ServiceName
ORDER BY times_booked DESC;

iii) Get montly booking report
SELECT 
    DATE_FORMAT(STR_TO_DATE(EventDate, '%Y-%m-%d'), '%Y-%m') as month,
    COUNT(*) as total_bookings,
    COUNT(DISTINCT EventType) as unique_event_types,
    SUM(CAST(s.ServicePrice AS DECIMAL(10,2))) as total_revenue
FROM tblbooking b
LEFT JOIN tblservice s ON b.ServiceID = s.ID
GROUP BY month
ORDER BY month DESC;


6. DEMONSTRATION OF CRUD OPERATIONS
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

SELECT 
    b.*,
    s.ServiceName,
    s.ServicePrice
FROM tblbooking b
LEFT JOIN tblservice s ON b.ServiceID = s.ID
WHERE b.BookingID = 954554731;

UPDATE tblbooking
SET Status = 'Approved',
    Remark = 'Confirmed by manager'
WHERE BookingID = 954554731;


UPDATE tblbooking
SET Status = 'Cancelled'
WHERE BookingID = 954554731;
