select count(id) as Total_Loan_Applications from bank_loan_data
select count(id) as MTD_Total_Loan_Applications from bank_loan_data where Month(issue_date) = 12 and year(issue_date) = 2021
select count(id) as PMTD_Total_Loan_Applications from bank_loan_data where Month(issue_date) = 11 and year(issue_date) = 2021
select sum(loan_amount) as Total_Funded_Amount from bank_loan_data
select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data where Month(issue_date) = 12 and year(issue_date) = 2021
select sum(loan_amount) as PMTD_Total_Funded_Amount from bank_loan_data where Month(issue_date) = 11 and year(issue_date) = 2021
select sum(total_payment) as Total_Amount_Received from bank_loan_data
select sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data select avg(int_rate) as Avg_Interest_Rate from bank_loan_data
select sum(total_payment) as PMTD_Total_Amount_Received from bank_loan_data where Month(issue_date) = 11 and year(issue_date) = 2021
select round(avg(int_rate)*100,4) as Avg_Interest_Rate from bank_loan_data
select round(avg(int_rate)*100,4) as MTD_Avg_Interest_Rate from bank_loan_data where Month(issue_date) = 12 and year(issue_date) = 2021
select round(avg(int_rate)*100,4) as PMTD_Avg_Interest_Rate from bank_loan_data where Month(issue_date) = 11 and year(issue_date) = 2021
select round(avg(dti)*100,4) as Avg_DTI from bank_loan_data
select round(avg(dti)*100,4) as MTD_Avg_DTI from bank_loan_data where Month(issue_date) = 12 and year(issue_date) = 2021
select round(avg(dti)*100,4) as PMTD_Avg_DTI from bank_loan_data where Month(issue_date) = 11 and year(issue_date) = 2021
select (count(case when loan_status='Fully Paid' or loan_status = 'Current' Then id end)*100)/ count(id) as Good_loan_percentage from bank_loan_data
select count(id) as Good_Loan_Applications from bank_loan_data where loan_status = 'Fully Paid' or loan_status = 'Current'
select sum(loan_amount) as Good_Loan_Funded_Amount from bank_loan_data where loan_status = 'Fully Paid' or loan_status = 'Current'
select sum(total_payment) as Good_Loan_Received_Amount from bank_loan_data where loan_status = 'Fully Paid' or loan_status = 'Current'
select (count(case when loan_status='Charged Off' Then id end)*100)/ count(id) as Bad_loan_percentage from bank_loan_data
select count(id) as Bad_Loan_Applications from bank_loan_data where loan_status = 'Charged Off'
select sum(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_data where loan_status = 'Charged Off'
select sum(total_payment) as Bad_Loan_Received_Amount from bank_loan_data where loan_status = 'Charged Off'
SELECT loan_status, COUNT(id) AS Total_Loan_applications, SUM(total_payment) AS Total_Amount_Received, SUM(loan_amount) AS Total_Funded_Amount, AVG(int_rate * 100) AS Interest_Rate, AVG(dti * 100) AS DTI FROM bank_loan_data GROUP BY loan_status
SELECT loan_status, SUM(total_payment) AS MTD_Total_Amount_Received, SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan_data WHERE MONTH(issue_date) = 12 GROUP BY loan_status
select month(issue_date) as Month_Number, datename(month, issue_date) as Month_Name, count(id) as Total_Loan_Applications, sum(loan_amount) as Total_Funded_Amount, sum(total_payment) as Total_Received_Payment from bank_loan_data group by DATENAME(month, issue_date), month(issue_date) order by month(issue_date)
select address_state, count(id) as Total_Loan_Applications, sum(loan_amount) as Total_Funded_Amount, sum(total_payment) as Total_Received_Payment from bank_loan_data group by address_state order by sum(loan_amount) desc
select term, count(id) as Total_Loan_Applications, sum(loan_amount) as Total_Funded_Amount, sum(total_payment) as Total_Received_Payment from bank_loan_data group by term order by term
select emp_length, count(id) as Total_Loan_Applications, sum(loan_amount) as Total_Funded_Amount, sum(total_payment) as Total_Received_Payment from bank_loan_data group by emp_length order by emp_length
select purpose, count(id) as Total_Loan_Applications, sum(loan_amount) as Total_Funded_Amount, sum(total_payment) as Total_Received_Payment from bank_loan_data group by purpose order by count(id) desc
select home_ownership, count(id) as Total_Loan_Applications, sum(loan_amount) as Total_Funded_Amount, sum(total_payment) as Total_Received_Payment from bank_loan_data group by home_ownership order by count(id) desc
select home_ownership, count(id) as Total_Loan_Applications, sum(loan_amount) as Total_Funded_Amount, sum(total_payment) as Total_Received_Payment from bank_loan_data where grade ='A' group by home_ownership order by count(id) desc
select home_ownership, count(id) as Total_Loan_Applications, sum(loan_amount) as Total_Funded_Amount, sum(total_payment) as Total_Received_Payment from bank_loan_data where grade ='A' and address_state='CA' group by home_ownership order by count(id) desc