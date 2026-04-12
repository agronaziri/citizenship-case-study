import pandas as pd

df = pd.read_excel("citizenship.xlsx")

print("First rows:")
print(df.head())

print("\nInfo:")
print(df.info())

print("\nMissing values:")
print(df.isnull().sum())

print("\nSummary stats:")
print(df.describe())

df.columns = [
    "step_id",
    "phase",
    "category",
    "step_description",
    "time_days",
    "cost_eur",
    "difficulty",
    "notes"
]

df["time_days"] = pd.to_numeric(df["time_days"], errors="coerce")
df["cost_eur"] = pd.to_numeric(df["cost_eur"], errors="coerce")
df["difficulty"] = pd.to_numeric(df["difficulty"], errors="coerce")

time_by_category = df.groupby("category")["time_days"].sum().reset_index()
cost_by_category = df.groupby("category")["cost_eur"].sum().reset_index()
difficulty_by_category = df.groupby("category")["difficulty"].mean().reset_index()

print("\nTime by category:")
print(time_by_category)

print("\nCost by category:")
print(cost_by_category)

print("\nDifficulty by category:")
print(difficulty_by_category)

time_by_category.to_csv("time_by_category.csv", index=False)
cost_by_category.to_csv("cost_by_category.csv", index=False)
difficulty_by_category.to_csv("difficulty_by_category.csv", index=False)

print("\nDone! Files saved.")