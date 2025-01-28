import pandas as pd

# Load the Excel file
def revStoppage(df, output_file_path):
    # df = pd.read_excel(input_file_path)

    # Reverse the DataFrame
    df_reversed = df.iloc[::-1].reset_index(drop=True)

    # Calculate the new distances from Sabarmati
    df_reversed['distance'] = df_reversed['distance'].max() - df_reversed['distance']

    totalTime = df_reversed['Arrival'].max() - df_reversed['Departure'].min()

    dfNew = df_reversed.copy()
    dfNew['Arrival'][0] = 0
    dfNew['Departure'][0] = 0

    for i in range(1, len(df_reversed)):
        timeFromPrevToCurrStation = df_reversed.loc[i-1, 'Arrival'] - df_reversed.loc[i, 'Departure'] 
        haltTimeAtCurrStation = df_reversed.loc[i, 'Departure'] - df_reversed.loc[i, 'Arrival']
        dfNew.loc[i, 'Arrival'] = dfNew.loc[i-1, 'Departure'] + timeFromPrevToCurrStation
        dfNew.loc[i, 'Departure'] = dfNew.loc[i, 'Arrival'] + haltTimeAtCurrStation

    dfNew.to_excel(output_file_path, index=False)
