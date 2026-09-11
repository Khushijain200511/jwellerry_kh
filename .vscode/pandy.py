import pandas as pd

# Create a messy student dataset
data = {
    "name": ["Rahul", "Priya", "Aman", "Rahul", None],
    "age": [20, 21, None, 20, 22],
    "marks": [85, 92, 78, 85, None],
    "city": ["Delhi", "Mumbai", "Jaipur", "Delhi", "Pune"]
}

df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)

# ------------------------------
# 1. Check Missing Values
# ------------------------------
print("\nMissing Values:")
print(df.isnull())

# Fill missing values
df["age"] = df["age"].fillna(df["age"].mean())
df["marks"] = df["marks"].fillna(df["marks"].mean())
df["name"] = df["name"].fillna("Unknown")

print("\nAfter fillna():")
print(df)

# Remove rows with missing values (if any)
df = df.dropna()

print("\nAfter dropna():")
print(df)

# ------------------------------
# 2. Remove Duplicate Rows
# ------------------------------
print("\nDuplicate Rows:")
print(df.duplicated())

df = df.drop_duplicates()

print("\nAfter drop_duplicates():")
print(df)

# ------------------------------
# 3. Rename Columns
# ------------------------------
df = df.rename(columns={
    "name": "Name",
    "age": "Age",
    "marks": "Marks",
    "city": "City"
})

print("\nAfter rename():")
print(df)

# ------------------------------
# 4. Change Data Types
# ------------------------------
df["Age"] = df["Age"].astype(int)
df["Marks"] = df["Marks"].astype(float)

print("\nData Types:")
print(df.dtypes)

# ------------------------------
# 5. String Operations
# ------------------------------

# Convert names to uppercase
df["Name"] = df["Name"].str.upper()

# Replace city name
df["City"] = df["City"].str.replace("Delhi", "New Delhi")

# Check if city contains "Mumbai"
print("\nCity contains 'Mumbai':")
print(df["City"].str.contains("Mumbai"))

print("\nFinal Cleaned DataFrame:")
print(df)