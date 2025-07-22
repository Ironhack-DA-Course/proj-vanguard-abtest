import pandas as pd
import numpy as np

def map_group_age(age: int):
    if age in range(0,6):
        return "toddler"
    elif age in range(6,19):
        return "teenager"
    elif age in range(19,35):
        return "young"
    elif age in range(36,56):
        return "middle-aged"
    elif age in range(56,80):
        return "old"
    elif age >= 80:
        return "elder" 
    else: return "NA"