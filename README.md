# Global Layoffs Analytics

End-to-end workforce analytics project leveraging MySQL and Tableau to uncover global layoff trends across companies, industries, countries, and time periods.

## Dashboard Preview

<img width="1280" height="832" alt="dashboard-1" src="https://github.com/user-attachments/assets/132ff126-4c5c-41f5-8399-48ce62609c25" />



## Key Insights

- Technology companies accounted for the largest share of global layoffs.
- The United States experienced the highest number of workforce reductions among all countries.
- Several startups reported 100% workforce reductions during economic downturns.
- Layoffs peaked during 2022–2023, reflecting broader macroeconomic uncertainty.
- Consumer, retail, and technology sectors were among the most heavily impacted industries.
- A small number of large organizations contributed disproportionately to total layoffs worldwide.

---

## Business Problem

Global workforce reductions have impacted thousands of organizations across industries. This project analyzes layoff patterns to identify which companies, industries, and countries were most affected and how workforce reductions evolved over time.

### Interactive Dashboard 
**View Dashboard Here:** [View Interactive Tableau Dashboard](https://public.tableau.com/views/World_Layoffs_tableau_dashboard/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link)
---

## Dataset

The dataset contains global layoff records, including:

- Company
- Industry
- Country
- Date
- Total Employees Laid Off
- Percentage Laid Off
- Funding Raised
- Company Stage

**Source:** Kaggle World Layoffs Dataset

---

## Analytics Workflow

### Data Cleaning (MySQL)

Performed:

- Duplicate removal using ROW_NUMBER()
- Data standardization
- Missing value treatment
- Date conversion
- Data validation
- Dataset preparation for analysis

### Exploratory Data Analysis

Key questions answered:

- Which companies laid off the most employees?
- Which industries were most affected?
- Which countries experienced the highest layoffs?
- How did layoffs evolve over time?
- Which companies experienced the highest layoffs each year?
- What were the cumulative layoff trends?

### Dashboard Development (Tableau)

Created an interactive dashboard featuring:

- Layoffs by Company
- Layoffs by Industry
- Country-wise Layoff Analysis
- Layoff Trends Over Time
- Top Companies by Layoffs
- Cumulative Layoff Analysis

---

## SQL Concepts Used

- CTEs
- Window Functions
- ROW_NUMBER()
- DENSE_RANK()
- Aggregate Functions
- Date Functions
- Data Cleaning Techniques
- Data Transformation

---

## Tools & Technologies

- MySQL
- SQL
- Tableau

---

## Files Included

- world_layoffs_analysis.sql
- dashboard.png
- README.md

---

## Project Outcome

Built an end-to-end analytics solution that transformed raw layoff records into actionable insights, enabling trend analysis across industries, companies, and geographies through SQL-based exploration and executive dashboarding.

---

## Author

Aryan Soni
