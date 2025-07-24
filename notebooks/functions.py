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

def calculate_error_rate(group):
    step_order = ['start', 'step_1', 'step_2', 'step_3', 'complete']
    step_index = {step: idx for idx, step in enumerate(step_order)}
    

    steps = group['process_step'].values
    backward_steps = 0
    for i in range(1, len(steps)):
        current_step_idx = step_index.get(steps[i], float('inf'))
        prev_step_idx = step_index.get(steps[i-1], float('inf'))
        if current_step_idx < prev_step_idx:
            backward_steps += 1
    total_steps = len(steps)
    error_rate = (backward_steps / total_steps * 100) if total_steps > 0 else 0
    return pd.Series({
        'treatment_group': group['treatment_group'].iloc[0],
        'total_steps': total_steps,
        'backward_steps': backward_steps,
        'error_rate': error_rate
    })

def has_all_steps(group: pd.Grouper):
    steps = {'start', 'step_1', 'step_2', 'step_3', 'confirm'}
    return steps.issubset(set(group['process_step']))

def has_all_treatment_groups(group: pd.Grouper):
    steps = {"Test","Control"}
    return steps.issubset(set(group["treatment_group"]))