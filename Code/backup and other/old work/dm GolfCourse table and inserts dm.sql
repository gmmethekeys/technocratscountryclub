CREATE TABLE Golfcourse (
	courseid INT PRIMARY KEY, 
	coursename VARCHAR(255) NOT NULL,
	courseaddress VARCHAR(255) NOT NULL,
	coursestate VARCHAR(2) NOT NULL,
	coursephone VARCHAR(50) NOT NULL,
	courseemail VARCHAR(255) NOT NULL,
	coursemanager VARCHAR(255) NOT NULL);
	
INSERT INTO Golfcourse (courseid, coursename, courseaddress, coursestate, coursephone, courseemail, coursemanager)
	VALUES
		(001, 'Technocrats Country Club', '5668 E. Orange Blossom Ln', 'AZ', '480-889-1505', 'technoCC@technocc.com', 'Mord Fairburn');