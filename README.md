# Vanguard project (name pending)

## Introduction

In this project we are analyzing the data of Vanguard, a well-known investment management company that offers a wide range of services to investors, including mutual funds, ETFs, brokerage services, and financial advice.

We will be acting as a data analyst in the Customer Experience (CX) team. Previously the team launched an exciting digital experiment, and now, they're eagerly waiting to uncover the results of it. They have created what they considered to be a more intuitive and modern User Interface (UI) and expect that this change could make the online process smoother for clients.
They came to us with the question: Would these changes encourage more clients to complete the process?


- 🛠 GitHub Repository: [proj-vanguard-abtest](https://github.com/Ironhack-DA-Course/proj-vanguard-abtest)
- 📋 Trello Board: [Project Tasks & Timeline](https://trello.com/invite/b/68751183d6cf473274092116/ATTIb3df2659c78efc7dad8a19f1e4f4fd93F9481019/vanguard) 
- 🖼 Dashboard: `visuals/visuals_experiment_evaluation.twb`
- Presentation: [Air Canada Loyalty](https://docs.google.com/presentation/d/1Hqo7kqqzuMMcIIki_kKuiHLjNlK-uO-ejXNlIs0ey2Q/edit?usp=sharing) 

## Datasets Used

We have received 4 files with raw data.

**Client Profiles (df_final_demo):** Demographics like age, gender, and account details of Vanguard's clients.
**Digital Footprints (df_final_web_data):** A detailed trace of client interactions online, divided into two parts: pt_1 and pt_2.
**Experiment Roster (df_final_experiment_clients):** A list revealing which clients were part of the grand experiment.

At the same time, we were provided with a Metadata(dictionary) to help us understand the content of the columns in each file and guide us through the analysis

**client_id:** Every client's unique ID.
**variation:** Indicates if a client was part of the experiment.
**visitor_id:** A unique ID for each client-device combination.
**visit_id:** A unique ID for each web visit/session.
**process_step:** Marks each step in the digital process.
**date_time:** Timestamp of each web activity.
**clnt_tenure_yr:** Represents how long the client has been with Vanguard, measured in years.
**clnt_tenure_mnth:** Further breaks down the client's tenure with Vanguard in months.
**clnt_age:** Indicates the age of the client.
**gendr:** Specifies the client's gender.
**num_accts:** Denotes the number of accounts the client holds with Vanguard.
**bal:** Gives the total balance spread across all accounts for a particular client.
**calls_6_mnth:** Records the number of times the client reached out over a call in the past six months.
**logons_6_mnth:** Reflects the frequency with which the client logged onto Vanguard's platform over the last six months.

**Comments on the Data:**

* **Main Challenges:** The data presented minor issues related to our hypotesis. The gender column was not standard and had missing values. clnt_age, clnt_tenure_mnth and clnt_tenure_yr tenure were expressed in boolean. The column clnt_age had NaN values but did not affect our annalysis as after filtering the data to obtain the desired one, we were only left with one client with no age.
* **Strengths:** The data was well organized, easy to read and very consistent in terms of unique values per column.
* **Weaknesses:** The columns visitor_id and visit_id contains ids that are hard to read, compare and contrast.

##  Business Problem & Hypothesis
How can Vanguard improve the performance and the adoption of new UX/UI?

### Completion of Test vs Control group
* **Question:** The complettion rate of client with new UX/UI vs old one?
* **Conclusion:** They are almost the same

### Time spent on each step
* **Question:** How fast can clients go through workflow with new UX/UI vs old one?
* **Conclusion:** Control group are slightly faster than Test groups because of unknown routine, elements

### Error rate of Test vs Control group
* **Question:** The error rate of client by testing with new UX/UI vs old one?
* **Conclusion:** The error rate of testing with new UX/UI is higher than old one

### Reducing speed in the website process

* **Question:** How fast can clients under 35 years of age go through the new process vs the group of client over 55 years of age?
* **Conclusion:**  Young clients (< 35 yeas old) are faster than Old clients (> 55 yeas old) due to the knowledge of tech-savy

_*Business recommendation*_: train the Old client group with new UX/UI , adoption of new UX/UI not based on completion rate 

## Methodology

Our methodology involved several key steps, focusing on filtering, data cleaning, analytical visualization and :

1.  **Data Acquisition:** Datasets were downloaded from Github.
2.  **Data Merging:** As recommended we merged the two files df_final_web_data_pt_1 and df_final_web_data_pt_2. We also merged the final df_final_web_data with the file df_final_experiment_clients and the file df_final_demo with df_final_experiment_clients. They idea behind this was that since we will not be using SQL for the annalysis and all will eb done in Python we decided to have all data in fewer files.
3. **Data Cleaning:**  
* Duplicates
* Customers not participating in the experiment
* Standardization of the columns name
* Altering data types
* Standardization of gender
* Fill nun client age with median

4. **Data Transformation:** 
* Filtering the large datasets to create a relevant sub-dataset containing only clients that were part of the experiment, with a defined age and .
* Transforming datasets to some suitable datasets for evaluation the KPIs 
* Creatiing new columns like: time_diff and time_diff_relative.

5.  **Analysis Techniques:**
* Generic EDA using EDA Univariate
* Insight EDA for evaluatin the KPIS, Hypothesis
* Verification results by using different Python vs SQL
* Hypothesis Testing

6.  **Data visualization:**
* Importing data into Tableau to create some interactive charts
* Buiding the dashboard and story

  **Data Analysis Tools and Libraries:**
    * **Python:** The primary programming language for data manipulation and analysis.
    * **Pandas:** Essential for data loading, cleaning, and transformation.
    * **Matplotlib / Seaborn:** Used for creating various visualizations (bar charts, line graphs).
    * **unidecode & unicodedata:** Python libraries crucial for handling and normalizing special characters.
    * **SQL Workbench:** Used for initial data exploration and potential querying.

##  Repository Structure

```
proj-vanguard-abtest/
├── data/                        # Raw and cleaned CSV files
├── figures/                     # Sketching of structure in dataset
├── notebooks/                   # Python notebooks with analysis
├── sql_scripts/                 # SQL analysis
├── README.md                    # This file
├── visuals_tableau              # Tableau workbooks
└── slides                       # Url of presentation
```
## 👥 Team Members
__*Robert, Miguel, Jesus*__