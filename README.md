# Pewlett-Hackard-Analysis

The task at hand was to:

1.  Determine number of employee {titles] retiring, showing the the number of employees with each title and a list of current employees born between Jan 1, 1952 and Dec 31, 1955.  This was accomplished using pgAdmin 4 and exported to .csv files which are found in the /Data folder.  The file "retiring_titles.csv" shows the count of each title held by the retirement eligible.  The file "unique_titles.csv" shows individual current employees the with the desired birth dates. 

2.  Given the impending turnover, the next task was to identify employees eligible for membership.  These employees were identified as current employees (to_dates for employment of Jan 1, 9999) with birth dates between Jan 1, 1965 and Dec 31, 1965.  These were found using queries in pgAdmin 4 and exported to the /Data folder in the file, 'mentorship.csv."

