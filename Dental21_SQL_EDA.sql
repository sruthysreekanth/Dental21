Select * from daily_appointment;
Select * from revenue_by_appointment;

-- Select the non zero revenue records by joining the 2 tables
select * from daily_appointment d
inner join revenue_by_appointment r on d.appointment_id=r.appointment_id
where r.revenue >0;

-- Exploratory analysis

-- Find revenue per clinic(alternative for pivot table)
select clinic_id,sum(revenue) from daily_appointment d
inner join revenue_by_appointment r on d.appointment_id=r.appointment_id
group by clinic_id;

-- Find revenue per month 2022
select Extract(month from appointment_date),sum(revenue) from daily_appointment d
inner join revenue_by_appointment r on d.appointment_id=r.appointment_id
group by Extract(month from appointment_date)
order by Extract(month from appointment_date) ;

-- Find revenue per clinic per month 2022
select clinic_id,Extract(month from appointment_date),sum(revenue) from daily_appointment d
inner join revenue_by_appointment r on d.appointment_id=r.appointment_id
group by clinic_id,Extract(month from appointment_date)
order by clinic_id,Extract(month from appointment_date);

-- Find revenue per clinic(alternative for pivot table)
select d.practioner_id,sum(revenue) from daily_appointment d
inner join revenue_by_appointment r on d.appointment_id=r.appointment_id
group by practioner_id;

--- Distinct patient count per clinic
select count(distinct(patient_id)),clinic_id from daily_appointment
group by clinic_id;

-- Repeated patient count per month
select count(distinct(patient_id)),Extract(month from appointment_date) from daily_appointment
group by Extract(month from appointment_date);

-- Unique patients per month
select patient_id,count(patient_id) from daily_appointment
group by patient_id;

