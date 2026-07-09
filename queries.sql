USE HeartDiseaseDB;
GO

/*====================================================================
Query 1
Business Question: How many patients records are available?
======================================================================*/

SELECT COUNT (*) AS total_patients_count
FROM heart_disease;

/* Output 297 */

/*=====================================================================
Query 2
Business Question: What does the dataset look like?
=====================================================================*/

SELECT TOP 10 *
FROM heart_disease;

/* Output - Dataset have 14 columns. 
Insight- sex is shown as (1 = male, 0 = female). cp- 0: typical angina, Value 1: atypical angina, Value 2: non-anginal pain, Value 3: asymptomatic, fbs- >120 = 1 */

/*====================================================================
Query 3
Business Question: Is our dataset balanced between male and female patients?
======================================================================*/

SELECT sex, 
       COUNT (*) AS patients_count
FROM heart_disease
GROUP BY sex;

/* Output - 96 female patients and 201 male patients in this dataset
Insight - The dataset contains more than twice as many male patients as female patients, indicating a sex imbalance that should be considered during analysis.*/

/*===========================================================================
Query 4
Business Question: How many patients have heart disease?
===========================================================================*/

SELECT COUNT (*) AS heart_disease_patients
FROM heart_disease
WHERE condition = 1;

/* Output - 137 
Insight- Out of 297 patients, 137 were diagnosed with heart disease. */

/*===============================================================================
Query 5
Business Problem: What percentage of patients in the dataset have heart disease?
=================================================================================*/

SELECT 
   SUM(CASE
         WHEN condition = 1 THEN 1
         ELSE 0
       END) * 100.0 / COUNT(*) AS patient_percent
FROM heart_disease;

/* Output - 46.13 
Insight - Approximately 46.13% of patients in this dataset were diagnosed with heart disease, indicating that nearly half of the study population has the condition.*/

/*=================================================================================
Query 6
Business Problem: What is the average age of patients in the dataset?
=================================================================================*/

SELECT AVG(age) AS avg_age
FROM heart_disease;

/* Output - 54 */

/*=================================================================================
Query 7
Business Problem: Do patients with heart disease tend to be older?
==================================================================================*/

SELECT condition,
       AVG(age) AS average_age
FROM heart_disease
GROUP BY condition;

/* Output - 52yrs for no condition and 56yrs for confirmed heart condition.
Insight - Patients diagnosed with heart disease are, on average, older than patients without heart disease. Age may therefore be an important factor to investigate further.*/

/*=====================================================================================================
Query 8
Business Problem: Is the average cholesterol different between patients with and without heart disease?
=====================================================================================================*/

SELECT condition,
       AVG(chol) AS avg_chol
FROM heart_disease
GROUP BY condition;

/* Output - Patients with 243 as their avg chol don't have a diagnosed heart condition whereas patients with 251 avg chol have.
Insight - Patients diagnosed with heart disease have a slightly higher average cholesterol level (251 mg/dL) than patients without heart disease (243 mg/dL). Additional analyses would be needed to determine whether this difference is meaningful */

/*=============================================================================================
Query 9
Busines Problem: Do patients with heart disease have a different average resting blood pressure?
===============================================================================================*/

SELECT condition,
       AVG(trestbps) AS avg_resting_bp
FROM heart_disease
GROUP BY condition;

/* Output - For diagnosed heart condition - 134 and for no condition - 129.
Insight - Patients diagnosed with heart condition have a higher average resting blood pressure than patients without heart disease. Additional analyses required.*/

/*===============================================================================================
Query 10
Business Problem: Does maximum heart rate differ between patients with and without heart disease?
================================================================================================*/

SELECT condition,
       AVG(thalach) AS avg_heart_rate
FROM heart_disease
GROUP BY condition;

/* Output - Avg heart rate for patients with heart codition - 139 and for patients with no heart condition - 158.
Insight - Patients with heart condition have significantly lower average heart rate achieved than patients with no heart condition. */

/*=======================================================================================
Query 11
Business Problem: Does exercise-induced ST depression differ between the two groups?
=========================================================================================*/

SELECT condition,
       AVG(oldpeak) AS avg_STdepression
FROM heart_disease
GROUP BY condition;

/* Output - Avg ST dpression is 0.599 and 1.589 for patients with no heart condition and heart condition, repectively.*/

/*======================================================================================================================
Query 12
Business Problem: Is the average number of major vessels (ca) different between patients with and without heart disease?
=======================================================================================================================*/

SELECT condition, 
       AVG(ca) AS Avg_major_blood_vessels
FROM heart_disease
GROUP BY condition;

/* Output - Average major arteries involved in patients with heart condition is 1 whereas it is 0 for patients with no heart condition 
Insight - Involvement of major blood vessels appears to show one of the largest differences in this dataset. futher investigation is required. */

/*==================================================================================================
Query 13
Business Problem: Which chest pain type is most common among patients with and without heart disease?
====================================================================================================*/

SELECT condition,
       cp,
       COUNT(*)
FROM heart_disease
GROUP BY condition, cp;

/* Output - for values (0,1,2,3) number of patients with heart disease are (7,9,18,103) and the number of patients with no heart condition are (16,40,65,39) repectively.
Insight - Among patients diagnosed with heart disease, asymptomatic chest pain (cp = 3) was the most common chest pain category. This suggests that the absence of typical chest pain does not necessarily indicate the absence of heart disease within this dataset. */

/*====================================================================================================
Query 14
Business Problem: How many patients with and without heart disease experienced exercise-induced angina?
=====================================================================================================*/

SELECT condition,
      COUNT(*) AS patients_exp_exang
FROM heart_disease
WHERE exang = 1
GROUP BY condition;

/* Output - 23 patients without heart condition experienced excercise induced angina as compared to 74 patients with heart condition. */

/*========================================================================================================
Query 15
Business problem: What is the distribution of ECG findings among patients with and without heart disease?
==========================================================================================================*/

SELECT condition,
       restecg,
       COUNT (*)
FROM heart_disease
GROUP BY condition, restecg;

/* Output - For values (0,1,2) number of patients with no heart condition is (92,1,67) and number of patients with heart condition is (55,3,79) repectively. */

/*=============================================================================================================
Query 16
Business Problem: How are thalassemia test results distributed between patients with and without heart disease?
==============================================================================================================*/

SELECT condition,
       thal,
       COUNT(*) AS patients_with_thal
FROM heart_disease
GROUP BY condition, thal;

/* Output - for values (0,1,2) number of patients with heart condition is (37,12,88) whereas number of patients without heart disease is (127,6,27). */

/*============================================================================
Query 17
Business Problem: How many female patients are included in the dataset?
==============================================================================*/

SELECT COUNT(sex) AS total_female_patients
FROM heart_disease
WHERE sex = 0;

/* Output - 96 */

/*============================================================================
Query 18
Business Problem - How many female patients have heart disease?
=============================================================================*/

SELECT COUNT (*) AS female_pat_with_heart_dis
FROM heart_disease
WHERE condition = 1 AND sex = 0;

/* Output - 25 */

/*=================================================================================================================
Query 19
Business Problem: Among female patients, is the average age different between those with and without heart disease?
=================================================================================================================*/

SELECT condition,
       AVG(age) AS avg_age_female_pat
FROM heart_disease
WHERE sex = 0
GROUP BY condition;

/* Output - Average age of female patients with heart condition is 59 and that with no heart condition is 54. */

/*====================================================================================================================
Query 20:
Business Problem: Among female patients, is average cholesterol different between those with and without heart disease?
=====================================================================================================================*/

SELECT condition,
       AVG(chol) AS avg_chol_female_pat
FROM heart_disease
WHERE sex = 0
GROUP BY condition;

/* Output - Average chol of female patients with heart disease is 276 compared to 257 of patients with no heart condition. */

/* Among female patients with heart disease, which chest pain type (cp) is most common? */

SELECT cp,
       COUNT (*) AS female_pat_with_cp
FROM heart_disease
WHERE condition = 1 AND sex = 0
GROUP BY cp;

/* Output - for values (1,2,3) number of female patients are (2,1,22). */