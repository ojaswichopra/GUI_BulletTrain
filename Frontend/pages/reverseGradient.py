import pandas as pd

def revGrad(data, dist, output_path):
    """
    Function to create a new spreadsheet with distances from station B and reversed gradients,
    ensuring the rows are sorted in ascending order of the new start distance.

    Parameters:
    - file_path: str, path to the input spreadsheet.
    - dist: float, total distance between stations A and B.
    - output_path: str, path to save the output spreadsheet.

    Returns:
    - None, saves the new spreadsheet to output_path.
    """
    # # Load the input spreadsheet
    # data = pd.read_excel(file_path)

    # Create new columns for start and end distances from station B
    data['start_distance_from_B'] = dist - data['end_distance']
    data['end_distance_from_B'] = dist - data['start_distance']

    # Reverse the gradient valuepppips
    data['reversed_gradient'] = -data['gradient']

    # Select and rename columns for the new spreadsheet
    new_data = data[['start_distance_from_B', 'end_distance_from_B', 'reversed_gradient']]
    new_data.columns = ['start_distance', 'end_distance', 'gradient']

    # Sort the data by start_distance in ascending order
    new_data = new_data.sort_values(by='start_distance').reset_index(drop=True)

    # Save the new data to the specified output path
    new_data.to_csv(output_path, index=False)

# # Example usage
# file_path = 'gradient_data.xlsx'  # Path to the input file
# dist = 505.75  # Replace with the actual total distance
# output_path = 'new_gradient_data.xlsx'  # Path to save the new file

# create_new_gradient_data(file_path, dist, output_path)
# print(f"New data saved to {output_path}")
