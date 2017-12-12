# ---------------------------------------------------------------------
# Last Modified:
#   9-12-2017
# Description:
#   This program reads data from the accelerometer and dumps
#   it to a csv file. It is important to keep this file short as
#   speed of execution is critical.
# ---------------------------------------------------------------------

# ---------------------- Import required libraries --------------------
import IMUv1
import time
import math
import csv

# ---------------------- Initialise berryIMU --------------------------
IMUv1.detectIMU()
IMUv1.initIMU()  # Initialise the accelerometer, gyroscope and compass

# ---------------------- Start Program --------------------------------

# Calibration Variables
g = 1
ZeroGx = -97.8495
ZeroGy = 35.6995
ZeroGz = -91.919
Sensx = 1349
Sensy = 1374.8
Sensz = 1387

# Open file to print too
filename = "/home/pi/Documents/MHP_raspicam/IMU/Testing/Test_Data/Pi_Front.csv"
file = open(filename, 'w')
filewrite = csv.writer(file, delimiter=',', lineterminator='\n')

# Record program start time
init_time = time.time()

while True:
    try:
        # Read our accelerometer,gyroscope and magnetometer  values
        ACCx = IMUv1.readACCx()
        ACCy = IMUv1.readACCy()
        ACCz = IMUv1.readACCz()

        # Record time when i2c read ends, calculate difference
        time_elapsed = round(time.time() - init_time,5)

        # Write information to file
        filewrite.writerow([time_elapsed, ACCx, ACCy, ACCz])

    except KeyboardInterrupt:
        # End program
        file.close()
        break