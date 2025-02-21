# Conservative (worst case) weather data (to be taken from the user)
Q_s = 1000  # Global solar radiation in W/m^2
T_a = 40    # Ambient air temperature in degrees Celsius
V_w = 0.6   # Wind speed in m/s
theta = 90  # Angle between wind direction and conductor axis in degrees (perpendicular wind direction)
e = 0.8     # Emissivity
a = 0.8     # Absorptivity

T_0 = 20  # Temperature (deg C) at which OHE resistances are specified (to be taken from the user)

# To be taken from the user
mCp_c = 1310  # Total heat capacity of contact wire in J/m-deg C
mCp_r = 1310  # Total heat capacity of rail in J/m-deg C
mCp_f = 1310  # Total heat capacity of feeder wire in J/m-deg C

# To be taken from the user
alpha_c = 0.004  # Temperature coefficient of resistance (per deg C) of contact wire  
alpha_r = 0.003  # Temperature coefficient of resistance (per deg C) of rail 
alpha_f = 0.004  # Temperature coefficient of resistance (per deg C) of feeder wire
