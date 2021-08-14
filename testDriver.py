import os
import subprocess

fileName = input("Abs Path for testing file:")
iterations = int(input("Test Times:"))
accTime = 0.0

for i in range(iterations):
    cmd = 'time lli-12 -force-interpreter=true ' + fileName
    stat = subprocess.run(cmd, shell=True, executable="/bin/fish", capture_output=True)
    # print(stat)
    x = 182
    accTime += float(stat.stderr.decode("utf-8")[x:x+9])
    
print(accTime)

