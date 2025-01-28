import csv
import streamlit as st
from streamlit_extras.add_vertical_space import add_vertical_space
from streamlit_option_menu import option_menu

# Define the path to your system data file
file_path = "system_data.csv"

# Function to write the updated data back to the CSV file
def write_data(file_path, data):
    with open(file_path, mode='w', newline='') as file:
        writer = csv.writer(file)
        # Write the header
        writer.writerow(["Name", "Value"])  # Header row with columns: Name, Value
        # Write each key-value pair in the same row
        for key, value in data.items():
            if isinstance(value, (list, tuple)):
                value = " ".join(map(str, value))  # Join elements with a space or comma
            writer.writerow([key, value])  # Write key and value in the same row

def main():
    # Default values for placeholders
    default_values = {
        "Number of TSS:": 11,
        "Distance (in km) of all the TSSs measured from the starting point:": "5 55 105 155 205 255 305 355 405 455 505",
        "Number of AT:": 52,
        "Distance (in km) of all the ATs measured from the starting point:": "3 13 23 33 43 53 63 73 83 93 103 113 123 133 143 153 163 173 183 193 203 213 223 233 243 253 263 273 283 293 303 313 323 333 343 353 363 373 383 393 403 413 423 433 443 453 463 473 483 493 503 513",
        "TSS primary voltage (Kv):": 132,
        "TSS secondary voltage (Kv):": 27.5,
        "Primary side resistance (ohm):": 0.1,
        "Primary side reactance (ohm):": 0.05,
        "Secondary side resistance (ohm):": 0.05,
        "Secondary side reactance (ohm):": 0.1,
        "Rail Grounding impedance (ohm):": 1,
        "TSS (source side) short circuit MVA:": 5000,
        "AT leakage resistance (ohm):": 0.1564,
        "AT leakage reactance (ohm):": 0.0997,
        "AT magnetising resistance (ohm):": 101400,
        "AT magnetising reactance (ohm):": 279100,
        "Homogenous earth conducting resistivity:": 100,
        "Frequency (Hz):": 50,
        "Number of conductors (contact, rail, feeder, messenger, earth):": 5,
        "Contact wire height (m) measured from rail:": 5,
        "Messenger wire height (m) measured from rail:": 6.5,
        "Feeder wire height (m) measured from rail:": 8.7,
        "Feeder wire distance (m) measured from centre (rail):": 3.9175,
        "Earth (ground) wire height (m) measured from rail:": 6,
        "Earth (ground) wire distance (m) measured from centre (rail):": 3.2675,
        "Diameter (mm) of contact wire:": 15.49,
        "Resistance (ohm/km) of contact wire:": 0.1451,
        "Diameter (mm) of messenger wire:": 17.5,
        "Resistance (ohm/km) of messenger wire:": 0.794,
        "Diameter (mm) of earth(ground) wire:": 16.3,
        "Resistance (ohm/km) of earth(ground) wire:": 0.2143,
        "Diameter (mm) of feeder wire:": 23.4,
        "Resistance (ohm/km) of feeder wire:": 0.056,
        "Diameter (mm) of rail:": 146,
        "Resistance (ohm/km) of rail:": 0.024,
    }

    st.markdown(
        """
    <style>
        [data-testid="collapsedControl"] {
            display: none
        }
        .title {
            text-align: center;
        }
        .custom-button {
                display: inline-block;
                text-decoration: none;
                padding: 4px 16px;
                font-size: 20px;
                color: #007BFF;
                border: 2px solid #007BFF; /* Adding a white border */
                border-radius: 8px;
                transition: background-color 0.3s ease;
                text-align: center;
                margin: 10px 0;
            }
    </style>
    """,
        unsafe_allow_html=True,
    )

    st.markdown("<h1 class='title'>Make System Data</h1>", unsafe_allow_html=True)
    add_vertical_space(1)
    # --- NAVIGATION MENU ---
    selected = option_menu(
        menu_title=None,
        options=["Prepare Fresh Data", "Edit Existing Data"],
        icons=["file-spreadsheet-fill", "pencil-square"],  # https://icons.getbootstrap.com/
        orientation="horizontal",
        styles={    
        "nav-link": {"font-size": "20px", "text-align": "center", "margin":"0px", "--hover-color": "#ffffff"},
        "nav-link-selected": {"background-color": "#007BFF"},
        }   
    )

    if selected == "Prepare Fresh Data":
        if 'edited_content' not in st.session_state:
            st.session_state.edited_content = ""
        with st.form("prepare_fresh_data_form"):
            st.write("Enter fresh values for system data:")
            num_tss = st.text_input("Number of TSS:", placeholder=str(default_values["Number of TSS:"]))
            distance_tss = st.text_input("Distance (in km) of all the TSSs measured from the starting point:", placeholder=default_values["Distance (in km) of all the TSSs measured from the starting point:"])
            num_at = st.text_input("Number of AT:", placeholder=str(default_values["Number of AT:"]))
            distance_at = st.text_input("Distance (in km) of all the ATs measured from the starting point:", placeholder=default_values["Distance (in km) of all the ATs measured from the starting point:"])
            primary_voltage = st.text_input("TSS primary voltage (Kv):", placeholder=str(default_values["TSS primary voltage (Kv):"]))
            secondary_voltage = st.text_input("TSS secondary voltage (Kv):", placeholder=str(default_values["TSS secondary voltage (Kv):"]))
            primary_resistance = st.text_input("Primary side resistance (ohm):", placeholder=str(default_values["Primary side resistance (ohm):"]))
            primary_reactance = st.text_input("Primary side reactance (ohm):", placeholder=str(default_values["Primary side reactance (ohm):"]))
            secondary_resistance = st.text_input("Secondary side resistance (ohm):", placeholder=str(default_values["Secondary side resistance (ohm):"]))
            secondary_reactance = st.text_input("Secondary side reactance (ohm):", placeholder=str(default_values["Secondary side reactance (ohm):"]))
            rail_ground_impedance = st.text_input("Rail Grounding impedance (ohm):", placeholder=str(default_values["Rail Grounding impedance (ohm):"]))
            short_circuit_mva = st.text_input("TSS (source side) short circuit MVA:", placeholder=str(default_values["TSS (source side) short circuit MVA:"]))
            at_leakage_resistance = st.text_input("AT leakage resistance (ohm):", placeholder=str(default_values["AT leakage resistance (ohm):"]))
            at_leakage_reactance = st.text_input("AT leakage reactance (ohm):", placeholder=str(default_values["AT leakage reactance (ohm):"]))
            at_magnetising_resistance = st.text_input("AT magnetising resistance (ohm):", placeholder=str(default_values["AT magnetising resistance (ohm):"]))
            at_magnetising_reactance = st.text_input("AT magnetising reactance (ohm):", placeholder=str(default_values["AT magnetising reactance (ohm):"]))
            earth_conducting_resistivity = st.text_input("Homogenous earth conducting resistivity:", placeholder=str(default_values["Homogenous earth conducting resistivity:"]))
            frequency = st.text_input("Frequency (Hz):", placeholder=str(default_values["Frequency (Hz):"]))
            num_conductors = st.text_input("Number of conductors (contact, rail, feeder, messenger, earth):", placeholder=str(default_values["Number of conductors (contact, rail, feeder, messenger, earth):"]))
            contact_wire_height = st.text_input("Contact wire height (m) measured from rail:", placeholder=str(default_values["Contact wire height (m) measured from rail:"]))
            messenger_wire_height = st.text_input("Messenger wire height (m) measured from rail:", placeholder=str(default_values["Messenger wire height (m) measured from rail:"]))
            feeder_wire_height = st.text_input("Feeder wire height (m) measured from rail:", placeholder=str(default_values["Feeder wire height (m) measured from rail:"]))
            feeder_wire_distance = st.text_input("Feeder wire distance (m) measured from centre (rail):", placeholder=str(default_values["Feeder wire distance (m) measured from centre (rail):"]))
            earth_wire_height = st.text_input("Earth (ground) wire height (m) measured from rail:", placeholder=str(default_values["Earth (ground) wire height (m) measured from rail:"]))
            earth_wire_distance = st.text_input("Earth (ground) wire distance (m) measured from centre (rail):", placeholder=str(default_values["Earth (ground) wire distance (m) measured from centre (rail):"]))
            contact_wire_diameter = st.text_input("Diameter (mm) of contact wire:", placeholder=str(default_values["Diameter (mm) of contact wire:"]))
            contact_wire_resistance = st.text_input("Resistance (ohm/km) of contact wire:", placeholder=str(default_values["Resistance (ohm/km) of contact wire:"]))
            messenger_wire_diameter = st.text_input("Diameter (mm) of messenger wire:", placeholder=str(default_values["Diameter (mm) of messenger wire:"]))
            messenger_wire_resistance = st.text_input("Resistance (ohm/km) of messenger wire:", placeholder=str(default_values["Resistance (ohm/km) of messenger wire:"]))
            earth_wire_diameter = st.text_input("Diameter (mm) of earth(ground) wire:", placeholder=str(default_values["Diameter (mm) of earth(ground) wire:"]))
            earth_wire_resistance = st.text_input("Resistance (ohm/km) of earth(ground) wire:", placeholder=str(default_values["Resistance (ohm/km) of earth(ground) wire:"]))
            feeder_wire_diameter = st.text_input("Diameter (mm) of feeder wire:", placeholder=str(default_values["Diameter (mm) of feeder wire:"]))
            feeder_wire_resistance = st.text_input("Resistance (ohm/km) of feeder wire:", placeholder=str(default_values["Resistance (ohm/km) of feeder wire:"]))
            rail_diameter = st.text_input("Diameter (mm) of rail:", placeholder=str(default_values["Diameter (mm) of rail:"]))
            rail_resistance = st.text_input("Resistance (ohm/km) of rail:", placeholder=str(default_values["Resistance (ohm/km) of rail:"]))

            submit_button = st.form_submit_button("Save Data")

            if submit_button:
                # Validate and save data...
                try:
                    # Convert text inputs to integers or floats where applicable
                    num_tss = int(num_tss or default_values["Number of TSS:"])
                    distance_tss = list(map(float, distance_tss.split() or default_values["Distance (in km) of all the TSSs measured from the starting point:"].split()))
                    num_at = int(num_at or default_values["Number of AT:"])
                    distance_at = list(map(float, distance_at.split() or default_values["Distance (in km) of all the ATs measured from the starting point:"].split()))
                    primary_voltage = float(primary_voltage or default_values["TSS primary voltage (Kv):"])
                    secondary_voltage = float(secondary_voltage or default_values["TSS secondary voltage (Kv):"])
                    primary_resistance = float(primary_resistance or default_values["Primary side resistance (ohm):"])
                    primary_reactance = float(primary_reactance or default_values["Primary side reactance (ohm):"])
                    secondary_resistance = float(secondary_resistance or default_values["Secondary side resistance (ohm):"])
                    secondary_reactance = float(secondary_reactance or default_values["Secondary side reactance (ohm):"])
                    rail_ground_impedance = float(rail_ground_impedance or default_values["Rail Grounding impedance (ohm):"])
                    short_circuit_mva = float(short_circuit_mva or default_values["TSS (source side) short circuit MVA:"])
                    at_leakage_resistance = float(at_leakage_resistance or default_values["AT leakage resistance (ohm):"])
                    at_leakage_reactance = float(at_leakage_reactance or default_values["AT leakage reactance (ohm):"])
                    at_magnetising_resistance = float(at_magnetising_resistance or default_values["AT magnetising resistance (ohm):"])
                    at_magnetising_reactance = float(at_magnetising_reactance or default_values["AT magnetising reactance (ohm):"])
                    earth_conducting_resistivity = float(earth_conducting_resistivity or default_values["Homogenous earth conducting resistivity:"])
                    frequency = float(frequency or default_values["Frequency (Hz):"])
                    num_conductors = int(num_conductors or default_values["Number of conductors (contact, rail, feeder, messenger, earth):"])
                    contact_wire_height = float(contact_wire_height or default_values["Contact wire height (m) measured from rail:"])
                    messenger_wire_height = float(messenger_wire_height or default_values["Messenger wire height (m) measured from rail:"])
                    feeder_wire_height = float(feeder_wire_height or default_values["Feeder wire height (m) measured from rail:"])
                    feeder_wire_distance = float(feeder_wire_distance or default_values["Feeder wire distance (m) measured from centre (rail):"])
                    earth_wire_height = float(earth_wire_height or default_values["Earth (ground) wire height (m) measured from rail:"])
                    earth_wire_distance = float(earth_wire_distance or default_values["Earth (ground) wire distance (m) measured from centre (rail):"])
                    contact_wire_diameter = float(contact_wire_diameter or default_values["Diameter (mm) of contact wire:"])
                    contact_wire_resistance = float(contact_wire_resistance or default_values["Resistance (ohm/km) of contact wire:"])
                    messenger_wire_diameter = float(messenger_wire_diameter or default_values["Diameter (mm) of messenger wire:"])
                    messenger_wire_resistance = float(messenger_wire_resistance or default_values["Resistance (ohm/km) of messenger wire:"])
                    earth_wire_diameter = float(earth_wire_diameter or default_values["Diameter (mm) of earth(ground) wire:"])
                    earth_wire_resistance = float(earth_wire_resistance or default_values["Resistance (ohm/km) of earth(ground) wire:"])
                    feeder_wire_diameter = float(feeder_wire_diameter or default_values["Diameter (mm) of feeder wire:"])
                    feeder_wire_resistance = float(feeder_wire_resistance or default_values["Resistance (ohm/km) of feeder wire:"])
                    rail_diameter = float(rail_diameter or default_values["Diameter (mm) of rail:"])
                    rail_resistance = float(rail_resistance or default_values["Resistance (ohm/km) of rail:"])
                    
                    new_data = {
                        "Number of TSS:": num_tss,
                        "Distance (in km) of all the TSSs measured from the starting point:": distance_tss,
                        "Number of AT:": num_at,
                        "Distance (in km) of all the ATs measured from the starting point:": distance_at,
                        "TSS primary voltage (Kv):": primary_voltage,
                        "TSS secondary voltage (Kv):": secondary_voltage,
                        "Primary side resistance (ohm):": primary_resistance,
                        "Primary side reactance (ohm):": primary_reactance,
                        "Secondary side resistance (ohm):": secondary_resistance,
                        "Secondary side reactance (ohm):": secondary_reactance,
                        "Rail Grounding impedance (ohm):": rail_ground_impedance,
                        "TSS (source side) short circuit MVA:": short_circuit_mva,
                        "AT leakage resistance (ohm):": at_leakage_resistance,
                        "AT leakage reactance (ohm):": at_leakage_reactance,
                        "AT magnetising resistance (ohm):": at_magnetising_resistance,
                        "AT magnetising reactance (ohm):": at_magnetising_reactance,
                        "Homogenous earth conducting resistivity:": earth_conducting_resistivity,
                        "Frequency (Hz):": frequency,
                        "Number of conductors (contact, rail, feeder, messenger, earth):": num_conductors,
                        "Contact wire height (m) measured from rail:": contact_wire_height,
                        "Messenger wire height (m) measured from rail:": messenger_wire_height,
                        "Feeder wire height (m) measured from rail:": feeder_wire_height,
                        "Feeder wire distance (m) measured from centre (rail):": feeder_wire_distance,
                        "Earth (ground) wire height (m) measured from rail:": earth_wire_height,
                        "Earth (ground) wire distance (m) measured from centre (rail):": earth_wire_distance,
                        "Diameter (mm) of contact wire:": contact_wire_diameter,
                        "Resistance (ohm/km) of contact wire:": contact_wire_resistance,
                        "Diameter (mm) of messenger wire:": messenger_wire_diameter,
                        "Resistance (ohm/km) of messenger wire:": messenger_wire_resistance,
                        "Diameter (mm) of earth(ground) wire:": earth_wire_diameter,
                        "Resistance (ohm/km) of earth(ground) wire:": earth_wire_resistance,
                        "Diameter (mm) of feeder wire:": feeder_wire_diameter,
                        "Resistance (ohm/km) of feeder wire:": feeder_wire_resistance,
                        "Diameter (mm) of rail:": rail_diameter,
                        "Resistance (ohm/km) of rail:": rail_resistance,
                    }

                    write_data(file_path,new_data)
                    st.success("Data saved successfully!")
                    # Save the updated content back to the session state
                    formatted_text = "\n\n".join([f"{key}\n{value}" for key, value in new_data.items()])  # Format key-value pairs
                    # Store the formatted plain text in session state
                    st.session_state.edited_content = formatted_text

                except ValueError as e:
                    st.error(f"Error in data conversion: {e}")
        if st.session_state.edited_content:
            # st.download_button(
            #     label="Download updated file",
            #     data=st.session_state.edited_content,
            #     file_name="updated_file.csv",  # File name for download
            #     mime="text/plain"
            # )    
            st.download_button(
            label="Download CSV",
            data=open(file_path, "rb").read(),
            file_name="system_data.csv",
            mime="text/csv"
        )   

    elif selected == "Edit Existing Data":
        
        uploaded_file = st.file_uploader("Upload a .txt file", type="txt")

        if uploaded_file is not None:
            # Read the uploaded file
            file_content = uploaded_file.getvalue().decode("utf-8")

            # Text area for editing file content
            edited_content = st.text_area("Edit the data below:", file_content, height=300)

            if st.button("Save Updated Data"):
                # Save the updated content back to a file
                with open(file_path, "w") as file:
                    file.write(edited_content)
                st.success("Data saved successfully!")
                # Offer the file for download
                st.download_button(
                    label="Download updated file",
                    data=edited_content,
                    file_name="system_data.txt",  # File name for download
                    mime="text/plain"
                )


if __name__ == "__main__":
    main()


