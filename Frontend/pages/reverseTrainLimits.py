import pandas as pd

def revTrainLimits(data, output_file_path, track_length):
    adjusted_data = []
    
    for _, row in data.iterrows():
        new_start = max(0, track_length - row['limit_end'])
        new_end = max(0, track_length - row['limit_start'])
        
        # Adjust rows exceeding track length
        if new_start == 0 and new_end == 0:
            continue
        if new_end > track_length:
            new_end = track_length
        
        adjusted_data.append({
            'limit_start_from_B': new_start,
            'limit_end_from_B': new_end,
            'limit_speed': row['limit_speed']
        })

    adjusted_df = pd.DataFrame(adjusted_data)
    dataToSave = adjusted_df.sort_values(by='limit_start_from_B').reset_index(drop=True)

    # Corrected variable name
    dataToSave.to_csv(output_file_path, index=False)
    
    print(f"Processed file saved to {output_file_path}")
    
