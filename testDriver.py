import random
import subprocess, sys, getopt

fileName = ""
iterations = 0

try:
    opts, args = getopt.getopt(sys.argv[1:], "f:i:")
except getopt.GetoptError:
    print ('testDriver.py -f <abs path of inputfile> -i <number of iterations>')
    sys.exit(2)
for opt, arg in opts:
    if opt == '-f':
        fileName = arg
    elif opt == '-i':
        iterations = int(arg)

accTime = 0.0

for i in range(iterations):
    rand1 = random.getrandbits(128)
    rand2 = random.getrandbits(128)
    cmd = 'time lli-12 ' + fileName + ' ' + str(rand1) + ' ' + str(rand2)
    stat = subprocess.run(cmd, shell=True, executable="/bin/fish", capture_output=True)
    # print(stat)
    x = 182
    accTime += float(stat.stderr.decode("utf-8")[x:x+9])
    
print(accTime)

