"""
🍕 Create sample CSV data for Food Delivery Orders Analysis project.
Saves files to ../data/ :
 - customers.csv
 - restaurants.csv
 - orders.csv
"""

import pandas as pd
import os

def main():
    customers = pd.DataFrame({
        'customer_id': [1,2,3,4],
        'customer_name': ['Anu','Bala','Chitra','Deepak']
    })

    restaurants = pd.DataFrame({
        'restaurant_id': ['R10','R20','R30'],
        'restaurant_name': ['Pizza Palace','Burger Street','Curry Corner'],
        'city': ['Chennai','Chennai','Chennai']
    })

    orders = pd.DataFrame({
        'order_id': [1001,1002,1003,1004,1005,1006],
        'order_date': ['2025-07-01','2025-07-01','2025-07-02','2025-07-02','2025-07-03','2025-07-03'],
        'customer_id': [1,2,1,3,4,1],
        'restaurant_id': ['R10','R20','R30','R10','R20','R10'],
        'amount': [400,250,600,350,300,450]
    })

    try:
        script_dir = os.path.dirname(__file__)
    except NameError:
        script_dir = os.getcwd()

    data_folder = os.path.join(script_dir, '..', 'data')
    os.makedirs(data_folder, exist_ok=True)

    customers.to_csv(os.path.join(data_folder, 'customers.csv'), index=False, encoding='utf-8-sig')
    restaurants.to_csv(os.path.join(data_folder, 'restaurants.csv'), index=False, encoding='utf-8-sig')
    orders.to_csv(os.path.join(data_folder, 'orders.csv'), index=False, encoding='utf-8-sig')

    print(f"✅ CSV files saved in: {data_folder}")

if __name__ == "__main__":
    main()
