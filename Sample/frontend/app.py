import streamlit as st
# from oct2py import Oct2Py
import matlab.engine

try:
    eng = matlab.engine.start_matlab()
    print("MATLAB Engine started successfully.")
    # Title of the Streamlit app
    st.title('MATLAB Backend Integration with Streamlit - Without Assignin')
    script_folder = '../backend'
    eng.cd(script_folder)

    # User input for variables a and b
    a = st.number_input('Enter the value for a:', value=0)
    b = st.number_input('Enter the value for b:', value=0)

    # Button to perform addition
    if st.button('Call my_add'):
        eng.my_add(float(a), float(b), nargout=0)  # Call the MATLAB function
        
        # Check if 'yy' exists in the workspace, retrieve it
        # if 'yy' in eng.workspace:
        #     yy_value = eng.workspace['yy']
        #     st.write(f'The result of addition (workspace variable yy) is: {yy_value}')
        # else:
        #     st.write('Variable yy does not exist in MATLAB workspace.')

    # Button to perform multiplication
    if st.button('Call my_multiply'):
        eng.my_multiply(float(a), float(b), nargout=0)  # Call the MATLAB function

        # Check if 'y' exists in the workspace, retrieve it
        y_value = eng.workspace['yy']
        print(y_value)
        st.text(y_value)
        # if 'y' in eng.workspace:
        #     y_value = eng.workspace['y']
        #     st.write(f'The result of multiplication (workspace variable y) is: {y_value}')
        # else:
        #     st.write('Variable y does not exist in MATLAB workspace.')

    # Stop MATLAB engine (optional, if you want to close MATLAB when done)
    if st.button('Stop MATLAB Engine'):
        eng.quit()
    st.write('MATLAB engine stopped.')

except Exception as e:
    print("Error starting MATLAB Engine:", e)


# # Initialize Oct2Py
# oc = Oct2Py()

# # Add the path to the directory containing functions.m
# oc.addpath('../backend')

# st.title('Octave Streamlit Integration')

# func_choice = st.selectbox('Choose a function', ['my_add', 'my_multiply'])
# a = st.number_input('Enter first number', value=0)
# b = st.number_input('Enter second number', value=0)

# if st.button('Calculate'):
#     # Call the appropriate function from functions.m
#     if func_choice == 'my_add':
#         result = oc.my_add(a, b)
#     elif func_choice == 'my_multiply':
#         result = oc.my_multiply(a, b)
#     st.write(f'Result: {result}')


# # // datafile, initialisation, HSR 
# # // Will they be stored in workspace



# Start MATLAB engine


