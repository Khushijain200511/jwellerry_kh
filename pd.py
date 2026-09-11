import pandas as pd

# Create DataFrame
data = {
    "Name": ["Rahul", "Priya", "Aman", "Riya"],
    "City": ["Delhi", "Mumbai", "Jaipur", "New Delhi"]
}

df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)

# 1. Convert names to uppercase
df["Name"] = df["Name"].str.upper()

print("\nAfter str.upper():")
print(df)

# 2. Check if City contains "Delhi"
print("\nUsing str.contains():")
print(df["City"].str.contains("Delhi"))

# 3. Replace Delhi with New Delhi
df["City"] = df["City"].str.replace("Delhi", "New Delhi")

print("\nAfter str.replace():")
print(df)