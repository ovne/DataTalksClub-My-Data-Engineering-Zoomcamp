import sys
import pandas as pd
from faker import Faker

# Generate fake data
fake = Faker()
data = []
nrows = sys.argv[1] if len(sys.argv) > 1 else 100
for _ in range(int(nrows)):
    name = fake.name()
    email = fake.email()
    age = fake.random_int(min=18, max=65)
    data.append((name, email, age))

# Create a DataFrame from the fake data
df = pd.DataFrame(data, columns=['Name', 'Email', 'Age'])

# Perform some data transformations
df['Age Group'] = pd.cut(df['Age'], bins=[18, 30, 40, 50, 65], labels=['18-30', '31-40', '41-50', '51-65'])

# Save the transformed data to a CSV file
#df.to_csv('transformed_data.csv', index=False)

# let just print some info of the DataFrame
print("Dataframe generated:")
print(df.head(10))
print("Number of records: " + str(len(df)))