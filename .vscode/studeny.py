import pandas as pd

# Load CSV file
df = pd.read_csv("student.csv")      # Replace with your CSV file name

# Display first 5 rows
print("First 5 rows:")
print(df.head())

# Display last 5 rows
print("\nLast 5 rows:")
print(df.tail())

# Information about DataFrame
print("\nDataFrame Information:")
print(df.info())

# Statistical Summary
print("\nStatistical Summary:")
print(df.describe())

# Shape of DataFrame
print("\nShape of DataFrame:")
print(df.shape)

# Display column names
print("\nColumns:")
print(df.columns)

# Access a single column
print("\nName Column:")
print(df["Name"])

# Access multiple columns
print("\nName and Marks:")
print(df[["Name", "Marks"]])

# Access rows using iloc
print("\nFirst Row:")
print(df.iloc[0])

print("\nFirst 3 Rows:")
print(df.iloc[0:3])

# Access rows using loc
print("\nRow with index 0:")
print(df.loc[0])

# Add a new column
df["Result"] = "Pass"

# Delete a column
df.drop("Result", axis=1, inplace=True)

# Display updated DataFrame
print("\nUpdated DataFrame:")
print(df.head())