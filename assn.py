import matplotlib.pyplot as plt

# Student Data
students = ["Aman", "Riya", "Rahul", "Neha", "Karan"]
marks = [85, 72, 90, 68, 95]
attendance = [90, 85, 95, 80, 92]

# Create Dashboard (2 rows × 2 columns)
fig, axs = plt.subplots(2, 2, figsize=(12, 8))

# -------------------------------
# 1. Line Chart
# -------------------------------
axs[0, 0].plot(
    students,
    marks,
    color="blue",
    marker="o",
    linestyle="-",
    linewidth=2
)
axs[0, 0].set_title("Student Marks (Line Chart)")
axs[0, 0].set_xlabel("Students")
axs[0, 0].set_ylabel("Marks")
axs[0, 0].grid(True)

# -------------------------------
# 2. Bar Chart
# -------------------------------
axs[0, 1].bar(
    students,
    marks,
    color="green"
)
axs[0, 1].set_title("Student Marks (Bar Chart)")
axs[0, 1].set_xlabel("Students")
axs[0, 1].set_ylabel("Marks")

# -------------------------------
# 3. Pie Chart
# -------------------------------
axs[1, 0].pie(
    attendance,
    labels=students,
    autopct="%1.1f%%",
    startangle=90
)
axs[1, 0].set_title("Attendance Distribution")

# -------------------------------
# 4. Scatter Plot
# -------------------------------
axs[1, 1].scatter(
    marks,
    attendance,
    color="red",
    marker="*",
    s=120
)
axs[1, 1].set_title("Marks vs Attendance")
axs[1, 1].set_xlabel("Marks")
axs[1, 1].set_ylabel("Attendance")
axs[1, 1].grid(True)

# Adjust Layout
plt.tight_layout()

# Save Figure
plt.savefig("student_dashboard.png")

# Show Dashboard
plt.show()