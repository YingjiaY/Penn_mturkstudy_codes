#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov 20 12:36:02 2023

@author: beauchamplab
"""

import os
import csv
import pandas as pd
directory = "/Users/beauchamplab/Desktop/test"
filename_prescreen = "/Users/beauchamplab/Desktop/test/prescreen"

def update_csv(setup_csv_path, prescreen_csv_path, output_csv_path):
    # Read the setup CSV into a DataFrame
    setup_df = pd.read_csv("/Users/beauchamplab/Desktop/test")

    # Read the prescreen CSV into a DataFrame
    prescreen_df = pd.read_csv(prescreen_csv_path)

    # Merge the two DataFrames based on the "workerID" column
    merged_df = pd.merge(setup_df, prescreen_df, on='workerID', how='inner')

    # Write the merged DataFrame to the updates CSV
    merged_df.to_csv(output_csv_path, index=False)

# Replace 'setup.csv', 'prescreen.csv', and 'updates.csv' with your actual file paths
update_csv('setup.csv', 'prescreen.csv', 'updates.csv')
