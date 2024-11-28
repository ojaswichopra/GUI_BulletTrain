from oct2py import Oct2Py
oc = Oct2Py()
oc.eval('cd("../backend_codes")')



def run_oct2py(extracted_data, N, N_hr, train_time):    
    oc.eval(f"""
        code_run({extracted_data['tss_distances']},{extracted_data['at_distances']},{N},{N_hr},{train_time},{extracted_data['tss_primary_voltage']},{extracted_data['tss_secondary_voltage']},{extracted_data['primary_resistance']},{extracted_data['primary_reactance']},{extracted_data['secondary_resistance']},{extracted_data['secondary_reactance']},{extracted_data['rail_grounding_impedance']},{extracted_data['short_circuit_mva']},{extracted_data['at_leakage_resistance']},{extracted_data['at_leakage_reactance']},{extracted_data['at_magnetising_resistance']},{extracted_data['at_magnetising_reactance']},{extracted_data['earth_resistivity']},{extracted_data['frequency']},{extracted_data['num_conductors']},{extracted_data['contact_wire_height']},{extracted_data['messenger_wire_height']},{extracted_data['feeder_wire_height']},{extracted_data['feeder_wire_distance']},{extracted_data['earth_wire_height']},{extracted_data['earth_wire_distance']},{extracted_data['contact_wire_diameter']},{extracted_data['contact_wire_resistance']},{extracted_data['messenger_wire_diameter']},{extracted_data['messenger_wire_resistance']},{extracted_data['earth_wire_diameter']},{extracted_data['earth_wire_resistance']},{extracted_data['feeder_wire_diameter']},{extracted_data['feeder_wire_resistance']},{extracted_data['rail_diameter']},{extracted_data['rail_resistance']})
    """)
    print("Load flow executed successfully!")
    
def run_oct2py_TSS(extracted_data, N, N_hr, N_TSS_O,train_time): 
    oc.eval('cd("../one_TSS_outage")')   
    oc.eval(f"""
        code_run_outage({extracted_data['tss_distances']},{extracted_data['at_distances']},{N},{N_hr},{N_TSS_O},{train_time},{extracted_data['tss_primary_voltage']},{extracted_data['tss_secondary_voltage']},{extracted_data['primary_resistance']},{extracted_data['primary_reactance']},{extracted_data['secondary_resistance']},{extracted_data['secondary_reactance']},{extracted_data['rail_grounding_impedance']},{extracted_data['short_circuit_mva']},{extracted_data['at_leakage_resistance']},{extracted_data['at_leakage_reactance']},{extracted_data['at_magnetising_resistance']},{extracted_data['at_magnetising_reactance']},{extracted_data['earth_resistivity']},{extracted_data['frequency']},{extracted_data['num_conductors']},{extracted_data['contact_wire_height']},{extracted_data['messenger_wire_height']},{extracted_data['feeder_wire_height']},{extracted_data['feeder_wire_distance']},{extracted_data['earth_wire_height']},{extracted_data['earth_wire_distance']},{extracted_data['contact_wire_diameter']},{extracted_data['contact_wire_resistance']},{extracted_data['messenger_wire_diameter']},{extracted_data['messenger_wire_resistance']},{extracted_data['earth_wire_diameter']},{extracted_data['earth_wire_resistance']},{extracted_data['feeder_wire_diameter']},{extracted_data['feeder_wire_resistance']},{extracted_data['rail_diameter']},{extracted_data['rail_resistance']})
    """)
    print("Load flow executed successfully!")
    
def run_oct2py_TSS_two(extracted_data, N, N_hr, N_TSS_O_str,train_time):  
    oc.eval('cd("../two_TSS_outage")')   
    oc.eval(f"""
        code_run_adjecent_outage_gnu({extracted_data['tss_distances']},{extracted_data['at_distances']},{N},{N_hr},'{N_TSS_O_str}',{train_time},{extracted_data['tss_primary_voltage']},{extracted_data['tss_secondary_voltage']},{extracted_data['primary_resistance']},{extracted_data['primary_reactance']},{extracted_data['secondary_resistance']},{extracted_data['secondary_reactance']},{extracted_data['rail_grounding_impedance']},{extracted_data['short_circuit_mva']},{extracted_data['at_leakage_resistance']},{extracted_data['at_leakage_reactance']},{extracted_data['at_magnetising_resistance']},{extracted_data['at_magnetising_reactance']},{extracted_data['earth_resistivity']},{extracted_data['frequency']},{extracted_data['num_conductors']},{extracted_data['contact_wire_height']},{extracted_data['messenger_wire_height']},{extracted_data['feeder_wire_height']},{extracted_data['feeder_wire_distance']},{extracted_data['earth_wire_height']},{extracted_data['earth_wire_distance']},{extracted_data['contact_wire_diameter']},{extracted_data['contact_wire_resistance']},{extracted_data['messenger_wire_diameter']},{extracted_data['messenger_wire_resistance']},{extracted_data['earth_wire_diameter']},{extracted_data['earth_wire_resistance']},{extracted_data['feeder_wire_diameter']},{extracted_data['feeder_wire_resistance']},{extracted_data['rail_diameter']},{extracted_data['rail_resistance']})
    """)
    print("Load flow executed successfully!")

def run_load_flow_standard(extracted_data): 
    oc.eval('cd("../EN-50641")')
    oc.eval(f"""
        code_run({extracted_data['tss_distances']},{extracted_data['at_distances']},{extracted_data['tss_primary_voltage']},{extracted_data['tss_secondary_voltage']},{extracted_data['primary_resistance']},{extracted_data['primary_reactance']},{extracted_data['secondary_resistance']},{extracted_data['secondary_reactance']},{extracted_data['rail_grounding_impedance']},{extracted_data['short_circuit_mva']},{extracted_data['at_leakage_resistance']},{extracted_data['at_leakage_reactance']},{extracted_data['at_magnetising_resistance']},{extracted_data['at_magnetising_reactance']},{extracted_data['earth_resistivity']},{extracted_data['frequency']},{extracted_data['num_conductors']},{extracted_data['contact_wire_height']},{extracted_data['messenger_wire_height']},{extracted_data['feeder_wire_height']},{extracted_data['feeder_wire_distance']},{extracted_data['earth_wire_height']},{extracted_data['earth_wire_distance']},{extracted_data['contact_wire_diameter']},{extracted_data['contact_wire_resistance']},{extracted_data['messenger_wire_diameter']},{extracted_data['messenger_wire_resistance']},{extracted_data['earth_wire_diameter']},{extracted_data['earth_wire_resistance']},{extracted_data['feeder_wire_diameter']},{extracted_data['feeder_wire_resistance']},{extracted_data['rail_diameter']},{extracted_data['rail_resistance']})
    """)
    print("Load flow executed successfully!")

__all__ = ['run_oct2py', 'run_load_flow_standard','run_oct2py_TSS','run_oct2py_TSS_two']