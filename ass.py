import matplotlib.pyplot as plt

students = ["Aman", "Riya", "Rahul", "Neha", "Karan"]
marks = [85, 72, 90, 68, 95]

# Bar Chart
plt.figure(figsize=(7,5))
plt.bar(students, marks, color="orange")
plt.title("Bar Chart of Student Marks")
plt.xlabel("Students")
plt.ylabel("Marks")
plt.grid(axis="y")
plt.show()

# Line Chart
plt.figure(figsize=(7,5))
plt.plot(students, marks, marker="o", color="blue", label="Marks")
plt.title("Line Chart of Student Marks")
plt.xlabel("Students")
plt.ylabel("Marks")
plt.legend()
plt.grid(True)
plt.show()

# Scatter Plot
plt.figure(figsize=(7,5))
plt.scatter(students, marks, color="red")
plt.title("Scatter Plot of Student Marks")
plt.xlabel("Students")
plt.ylabel("Marks")
plt.grid(True)
plt.show()

# Histogram
plt.figure(figsize=(7,5))
plt.hist(marks, bins=5)
plt.title("Histogram of Student Marks")
plt.xlabel("Marks")
plt.ylabel("Frequency")
plt.grid(True)
plt.show()