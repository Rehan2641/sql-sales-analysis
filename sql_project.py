import os
import random
from datetime import date
import pandas as pd
from faker import Faker

fake = Faker("en_IN")
random.seed(42)

# data folder banao
os.makedirs("data", exist_ok=True)

# 1. CUSTOMERS (100 rows) 
cities = ["Delhi", "Mumbai", "Bengaluru", "Hyderabad", "Chennai",
          "Kolkata", "Pune", "Jaipur", "Lucknow", "Faridabad"]

customers = pd.DataFrame({
    "customer_id": range(1, 101),
    "name": [fake.name() for _ in range(100)],
    "city": [random.choice(cities) for _ in range(100)],
})

# 2. PRODUCTS (20 rows) 
products = pd.DataFrame({
    "product_id": range(1, 21),
    "product_name": [
        "Laptop", "Smartphone", "Headphones", "Smart Watch", "Tablet",
        "T-Shirt", "Jeans", "Jacket", "Sneakers", "Backpack",
        "Rice 5kg", "Cooking Oil", "Tea Pack", "Biscuits Box", "Snacks Pack",
        "Notebook Set", "Pen Box", "Office Chair", "Study Table", "Desk Lamp",
    ],
    "category": ["Electronics"] * 5 + ["Clothing"] * 5
                + ["Grocery"] * 5 + ["Home & Office"] * 5,
    "price": [55000, 20000, 2500, 4500, 18000,
              499, 1499, 2999, 2499, 1299,
              450, 180, 250, 120, 99,
              199, 150, 4500, 6500, 799],
})

# 3. ORDERS (1000 rows)
orders = pd.DataFrame({
    "order_id": range(1, 1001),
    "customer_id": [random.randint(1, 100) for _ in range(1000)],
    "product_id": [random.randint(1, 20) for _ in range(1000)],
    "quantity": [random.randint(1, 5) for _ in range(1000)],
    "order_date": [fake.date_between(start_date=date(2025, 1, 1), end_date=date(2025, 12, 31))
                   for _ in range(1000)],
})

customers.to_csv("data/customers.csv", index=False)
products.to_csv("data/products.csv", index=False)
orders.to_csv("data/orders.csv", index=False)

print("Done! 3 CSV files data/ folder me ban gayi.")
print(customers.head(), "\n")
print(products.head(), "\n")
print(orders.head())