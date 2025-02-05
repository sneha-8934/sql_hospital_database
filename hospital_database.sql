CREATE TABLE Hospital(
Hospital_Name varchar(50),
Location varchar(50),
Department 	varchar(50),
Doctors_Count	int,
Patients_Count	int,
Admission_Date	date,
Discharge_Date date,
Medical_Expenses numeric(10,2)
)


1. Total Number of Patients
o Write an SQL query to find the total number of patients across all hospitals.

SELECT sum(hospital.patients_count) as total_patients
from hospital


2. Average Number of Doctors per Hospital
o Retrieve the average count of doctors available in each hospital.

SELECT hospital_name,avg(hospital.doctors_count) as avg_doctors
from hospital
group by hospital_name


3. Top 3 Departments with the Highest Number of Patients
o Find the top 3 hospital departments that have the highest number of patients.

SELECT hospital.department, sum(hospital.patients_count) as no_of_patients
FROM hospital
group by department
order by sum(hospital.patients_count) desc 
limit 3

4. Hospital with the Maximum Medical Expenses
o Identify the hospital that recorded the highest medical expenses.

SELECT hospital_name, medical_expenses as high_expense
from hospital
order by medical_expenses desc
limit 1


5. Daily Average Medical Expenses
o Calculate the average medical expenses per day for each hospital.

SELECT hospital_name, avg(medical_expenses/(discharge_date-admission_date)) as avg_medical_expenses_per_day
from hospital
group by hospital_name

6. Longest Hospital Stay
o Find the patient with the longest stay by calculating the difference between
Discharge Date and Admission Date.

select *,(hospital.discharge_date-admission_date) as longest_stay from hospital
order by (hospital.discharge_date-admission_date) DESC 
limit 1



7. Total Patients Treated Per City
o Count the total number of patients treated in each city.
SELECT location, sum(patients_count) as tot_patients from hospital
group by location
order by sum(patients_count) desc


8. Average Length of Stay Per Department
o Calculate the average number of days patients spend in each department.

SELECT department, avg(hospital.discharge_date-admission_date) as avg_no_of_days from hospital
group by department
order by avg(hospital.discharge_date-admission_date) desc


9. Identify the Department with the Lowest Number of Patients
o Find the department with the least number of patients.

SELECT hospital.department, sum(hospital.patients_count) as no_of_patients
FROM hospital
group by department
order by sum(hospital.patients_count)  
limit 1


10. Monthly Medical Expenses Report
• Group the data by month and calculate the total medical expenses for each month.


SELECT 
extract(year from admission_date) as year,
extract(month from admission_date)as month,
sum(medical_expenses) as tot_expenses
from hospital
group by year,month
order by year,month




