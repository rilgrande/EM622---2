# EM622---2

(1) Preparation:

a. Load necessary libraries (e.g., plyr, tidyr). See lines 6-12

b. Download the dataset (timesData.csv) from Canvas, import to R, and save it as a selfdefined dataset/variable. Use your own way to view or summarize the data.
See lines 14-22

c. Check if data are imported as correct forms. If not, convert them. Check the data type of rank and income.
See lines 22-30

d. Identify the factors that were used to calculate rankings (Hint: column names).
Teaching (30 percent of final score), research (30 percent), citations (research impact) (worth 32.5 percent), international mix (5 percent), industry income (2.5 percent)
See lines 36-40 for calculation test

e. Count the number of cells that contain missing values.
See line 43

(2) Manipulation:

a. Create a subset of data with variables world_rank, university_name, country, research,
income, num_students, total_score and year.
See lines 51-53

b. Identify top five universities with largest student population in the United States of America in 2012.
See lines 55-68

c. Use the split-apply-combine strategy to summarize the highest research score of each year.
See lines 71-73

d. Plot a line chart of the ranking as a function of year for Columbia University. Make sure to add meaningful title and axis labels.
Hint: Create a subset for Columbia University.
See lines 76-83

e. Melt or reshape the sub dataset created in (a) into a long format based on university name.
See lines 86-88

(3) Interpretation See Lines 91-147

a. What is and where is the greatest number of students in each year?
See lines 91-147

Load the dataset (rainfall.csv) from Canvas and load necessary libraries. This dataset describes the monthly and total amount of rainfall of each year in California.
See lines 153-155. Libraries loaded on lines 6-12

(1) Use ggplot( ) function to plot a line chart of the total rainfall (Total) as a function of year (WY). Add meaningful title and axis labels.
See lines 157-159

(2) Use ggplot( ) function to plot a histogram of monthly rainfall in 1950. Add meaningful title and axis label, and resize the bandwidth of each bar.
See lines 161-178, Create a subset of data and reshape the subset.


