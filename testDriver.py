import random
import subprocess, sys, getopt

fileName = ""
iterations = 1

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

cmd = 'llc-12 ' + fileName + '.ll'
subprocess.run(cmd, shell=True, executable="/bin/fish")
cmd = 'clang-12 ' + fileName + '.s -o ' + fileName + '.out'
subprocess.run(cmd, shell=True, executable="/bin/fish")

for i in range(iterations):
    rand1 = random.getrandbits(63)
    rand2 = random.getrandbits(63)
    rand3 = random.getrandbits(63)
    rand4 = random.getrandbits(63)
    
    cmd = 'time ' + fileName + '.out ' + str(rand1) + ' ' + str(rand2)+ ' ' + str(rand3)+ ' ' + str(rand4)
    stat = subprocess.run(cmd, shell=True, executable="/bin/fish", capture_output=True)
    # print(stat)
    x = 182
    try:
        accTime += float(stat.stderr.decode("utf-8")[x:x+9])
    except ValueError:
        i = i-1


print("Number of iterations: " + str(iterations))
print("Acumulated time: " + str(accTime) + " millis")
print("Avg time per iteration: " + str(accTime / iterations) + " millis")

