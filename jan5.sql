CREATE TABLE [dbo].[User] (
    UserID INT PRIMARY KEY IDENTITY(1,1),        
    Username VARCHAR(50) NOT NULL UNIQUE,        
    Email VARCHAR(100) NOT NULL UNIQUE,          
    PasswordHash VARBINARY(256) NOT NULL,         
    Gender CHAR(1) CHECK (Gender IN ('M', 'F','O')),  
    DateOfBirth DATE NOT NULL,                    
    IsActive BIT NOT NULL DEFAULT 1              
);

CREATE TABLE [dbo].[Doctor] (
    DoctorID INT PRIMARY KEY IDENTITY(1,1),      
    Name VARCHAR(100) NOT NULL,                 
    Specialization NVARCHAR(100) NOT NULL,       
    Email VARCHAR(100) UNIQUE NOT NULL,        
    PhoneNumber NVARCHAR(20),                    
    ExperienceYears INT CHECK (ExperienceYears >= 0), 
    IsActive BIT NOT NULL DEFAULT 1              
);

CREATE TABLE [dbo].[Appointment] (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1), 
    UserID INT NOT NULL,                          
    DoctorID INT NOT NULL,                        
    AppointmentDate DATETIME NOT NULL,            
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled')), 
    Notes NVARCHAR(MAX),                          
    CONSTRAINT FK_Appointment_User FOREIGN KEY (UserID) REFERENCES [dbo].[User](UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Appointment_Doctor FOREIGN KEY (DoctorID) REFERENCES [dbo].[Doctor](DoctorID) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO [dbo].[User] (Username, Email, PasswordHash, Gender, DateOfBirth, IsActive) VALUES
('AliceJohnson', 'alice.johnson@gmail.com', HASHBYTES('SHA2_256', 'password1'), 'F', '1990-05-15', 1),
('BobSmith', 'bob.smith@gmail.com', HASHBYTES('SHA2_256', 'password2'), 'M', '1985-03-22', 1),
('CharlieBrown', 'charlie.brown@gmail.com', HASHBYTES('SHA2_256', 'password3'), 'M', '1992-07-09', 1),
('DianaPrince', 'diana.prince@gmail.com', HASHBYTES('SHA2_256', 'password4'), 'F', '1988-11-25', 1),
('EthanHunt', 'ethan.hunt@gmail.com', HASHBYTES('SHA2_256', 'password5'), 'M', '1995-01-12', 1),
('FionaClarke', 'fiona.clarke@gmail.com', HASHBYTES('SHA2_256', 'password6'), 'F', '1993-04-18', 1),
('GeorgeMiller', 'george.miller@gmail.com', HASHBYTES('SHA2_256', 'password7'), 'M', '1987-12-05', 1),
('HelenParker', 'helen.parker@gmail.com', HASHBYTES('SHA2_256', 'password8'), 'F', '1991-09-14', 1),
('IanWright', 'ian.wright@gmail.com', HASHBYTES('SHA2_256', 'password9'), 'M', '1984-06-23', 1),
('JessicaTaylor', 'jessica.taylor@gmail.com', HASHBYTES('SHA2_256', 'password10'), 'F', '1996-02-11', 1);


INSERT INTO [dbo].[Doctor] (Name, Specialization, Email, PhoneNumber, ExperienceYears, IsActive) VALUES
('Dr. Sarah Adams', 'General Physician', 'sarah.adams@clinic.com', '9876543210', 10, 1),
('Dr. David Banner', 'Cardiologist', 'david.banner@clinic.com', '9876543211', 12, 1),
('Dr. Emily Stone', 'Dermatologist', 'emily.stone@clinic.com', '9876543212', 8, 1),
('Dr. Michael Gray', 'Orthopedic Surgeon', 'michael.gray@clinic.com', '9876543213', 15, 1),
('Dr. Olivia White', 'Pediatrician', 'olivia.white@clinic.com', '9876543214', 9, 1),
('Dr. Noah Green', 'Neurologist', 'noah.green@clinic.com', '9876543215', 11, 1),
('Dr. Laura Hill', 'Endocrinologist', 'laura.hill@clinic.com', '9876543216', 7, 1),
('Dr. Peter Black', 'Oncologist', 'peter.black@clinic.com', '9876543217', 13, 1),
('Dr. Karen Brown', 'Psychiatrist', 'karen.brown@clinic.com', '9876543218', 6, 1),
('Dr. Steve Carter', 'Surgeon', 'steve.carter@clinic.com', '9876543219', 14, 1);


INSERT INTO [dbo].[Appointment] (UserID, DoctorID, AppointmentDate, Status, Notes) VALUES
(1, 1, '2025-01-01 10:00:00', 'Scheduled', 'Regular check-up'),
(1, 2, '2025-01-05 11:00:00', 'Completed', 'Follow-up for heart health'),
(2, 1, '2025-01-03 14:00:00', 'Scheduled', 'Consultation for flu symptoms'),
(2, 3, '2025-01-10 15:00:00', 'Cancelled', 'Dermatology appointment'),
(3, 2, '2025-01-08 09:00:00', 'Scheduled', 'Cardiology follow-up'),
(4, 4, '2025-01-04 13:00:00', 'Completed', 'Orthopedic consultation'),
(5, 5, '2025-01-02 16:00:00', 'Scheduled', 'Pediatric vaccination'),
(6, 6, '2025-01-06 12:00:00', 'Scheduled', 'Neurology assessment'),
(7, 7, '2025-01-07 10:30:00', 'Completed', 'Endocrinology follow-up'),
(8, 8, '2025-01-09 17:00:00', 'Cancelled', 'Oncology consultation'),
(9, 9, '2025-01-11 18:00:00', 'Scheduled', 'Mental health session'),
(10, 10, '2025-01-12 08:00:00', 'Scheduled', 'Pre-surgery consultation'),
(3, 1, '2025-01-13 11:00:00', 'Completed', 'Routine physical examination'),
(4, 2, '2025-01-14 09:30:00', 'Scheduled', 'Heart health follow-up'),
(5, 3, '2025-01-15 14:00:00', 'Scheduled', 'Skin allergy treatment');
