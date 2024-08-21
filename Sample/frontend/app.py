import streamlit as st
from oct2py import Oct2Py

# Initialize Oct2Py
oc = Oct2Py()

# Add the path to the directory containing functions.m
oc.addpath('../backend')

st.title('Octave Streamlit Integration')

func_choice = st.selectbox('Choose a function', ['my_add', 'my_multiply'])
a = st.number_input('Enter first number', value=0)
b = st.number_input('Enter second number', value=0)

if st.button('Calculate'):
    # Call the appropriate function from functions.m
    if func_choice == 'my_add':
        result = oc.my_add(a, b)
    elif func_choice == 'my_multiply':
        result = oc.my_multiply(a, b)
    st.write(f'Result: {result}')
