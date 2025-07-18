"""
🎓 Create sample CSV data for Student Scores & Subject Analysis project.
Saves files to ../data/ :
 - students.csv
 - subjects.csv
 - marks.csv
"""

import pandas as pd
import os

def main():
    students = pd.DataFrame({
        'student_id': [1,2,3,4,5],
        'student_name': ['Arun','Divya','Farhan','Geetha','Hari'],
        'class': [10,10,10,10,10]
    })

    subjects = pd.DataFrame({
        'subject_id': ['M1','E1','S1'],
        'subject_name': ['Math','English','Science']
    })

    marks = pd.DataFrame({
        'student_id': [1,1,1,2,2,2,3,3,3,4,4,4,5,5,5],
        'subject_id': ['M1','E1','S1']*5,
        'exam_date': ['2025-07-01']*15,
        'score': [95,88,92,55,60,58,75,80,78,40,45,50,85,90,88]
    })

    try:
        script_dir = os.path.dirname(__file__)
    except NameError:
        script_dir = os.getcwd()

    data_folder = os.path.join(script_dir, '..', 'data')
    os.makedirs(data_folder, exist_ok=True)

    students.to_csv(os.path.join(data_folder, 'students.csv'), index=False, encoding='utf-8-sig')
    subjects.to_csv(os.path.join(data_folder, 'subjects.csv'), index=False, encoding='utf-8-sig')
    marks.to_csv(os.path.join(data_folder, 'marks.csv'), index=False, encoding='utf-8-sig')

    print(f"✅ CSV files saved in: {data_folder}")

if __name__ == "__main__":
    main()
