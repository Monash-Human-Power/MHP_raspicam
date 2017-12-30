# ---------------------------------------------------------------------
# Last Modified:
#   9-12-2017
# Description:
#   This program reads data from the accelerometer and dumps
#   it to a csv file. It is important to keep this file short as
#   speed of execution is critical.
# ---------------------------------------------------------------------

# ---------------------- Import required libraries --------------------
import IMUv2b
import time
import math
import csv

# ---------------------- Initialise berryIMU --------------------------
IMUv2b.detectIMU()
IMUv2b.initIMU()  # Initialise the accelerometer, gyroscope and compass

# ---------------------- Start Program --------------------------------

# Open file to print too
filename = "/home/pi/Documents/MHP_raspicam/IMU/Testing/Test_Data/Pi_Back.csv"
file = open(filename, 'w')
filewrite = csv.writer(file, delimiter=',', lineterminator='\n')

# Record program start time
init_time = time.time()

while True:
    try:
        # Read our accelerometer,gyroscope and magnetometer  values
        ACCx = IMUv2b.readACCx()
        ACCy = IMUv2b.readACCy()
        ACCz = IMUv2b.readACCz()

        # Record time when i2c read ends, calculate difference
        time_elapsed = round(time.time() - init_time,5)

        # Write information to file
        filewrite.writerow([time_elapsed, ACCx, ACCy, ACCz])

    except KeyboardInterrupt:
        # End program
        file.close()
        break