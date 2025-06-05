import serial
import csv
import argparse
from datetime import datetime, timezone

parser = argparse.ArgumentParser()
parser.add_argument('--filename', type=str, default="test_rig.csv")

args = parser.parse_args()

ser = serial.Serial('COM5', 9600)  # Replace COM3 with your port
with open(args.filename, 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['Timestamp [UTC]', 'Force [lbf]', 'Dist [mm]'])  # CSV header

    while True:
        line = ser.readline().decode().strip()
        if line:
            values = line.split(',')
            timestamp = datetime.now(timezone.utc).isoformat()
            values = [timestamp] + values
            if len(values) == 3:
                writer.writerow(values)
                print(values)