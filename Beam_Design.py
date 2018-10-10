import math

def beta_1(fc):
	# Input in KSI
	# source: ACI Table 22.2.2.4.3
	# Values of beta_1 for equivalent rectangular concrete stress distribution
	if fc <= 4:
		var = 0.85
	elif fc < 8:
		var = 0.85 - (0.05*(fc-4))/(1)
	else:
		var = 0.65
	
	return var
	
def phi(ey):
	# Not yet complete
	# source: ACI 21.2.2 Strength reduction factors
	
	if es >= 0.005:
		# tension controlled
		var = 0.9

# inputs in KSI
def rho_bal(fc, fy):
	return (0.85*fc*beta_1(fc))/(fy) * (87)/(87+fy)

def As_min(fc,fy):
	return (3*math.sqrt(fc)/fy) * bw * d

def R(fc, fy):
	rho = (0.75/2)* rho_bal(fc, fy) # rho target
	var = 1 - fy/(1.7*fc) * rho
	return rho * fy * var

def g(d, Mu, phi, fc, fy, ratio=0.6):
	return Mu/((d**3)*phi*R(fc, fy)) - ratio

def A(d, Mu, phi, fc, fy):
	return (-3/d**4) * (Mu/(phi*R(fc,fy)))

x0 = 10

phi = 0.9
fc = 4 #ksi
fy = 60 #ksi
Es = 29000 #ksi
ecu = 0.003
Mu = 212*12 # kip-in.

tolerance=1.0e-4
itMax=100
error = 1
iterations = 0
xold = x0

while error>tolerance and iterations<itMax:
	iterations += 1
	xnew = xold - g(xold,Mu,phi,fc,fy)/A(xold,Mu,phi,fc,fy)
	error = abs(g(xold,Mu,phi,fc,fy))
	xold = xnew

dunrounded = xold

bunrounded = Mu/(dunrounded**2*phi*R(fc,fy))

b_des = math.ceil(bunrounded)
d_des = math.ceil(dunrounded)

As = rho_bal(fc,fy) * b_des * d_des

# Picking Steel

No = [3,4,5,6,7,8,9,10,11,14,18]
areas = [0.11,0.2,0.31,0.44,0.6,0.79,1,1.27,1.56,2.25,4]
diameters = [0.375,0.5,0.625,0.75,0.875,1,1.128,1.27,1.41,1.693,2.257]

areas_des = []
# Check which bars will work
for i, area in enumerate(areas):
	#no of bars required for bar no.
	no_of_bars = math.ceil(As/area)
	
	bar_width = no_of_bars*diameters[i]
	bar_spacing = (no_of_bars - 1) * 1# inch bt bars
	clearance = 2*1.5 #1.5 inch on both sides
	
	total_space = bar_width + bar_spacing + clearance
	
	if b_des > total_space:
		print(f'{no_of_bars} number {No[i]} bars')
		areas_des.append(no_of_bars * areas[i])

# Choose the minimum area
As_des = min(areas_des)

print(f'As: {As_des}, b: {b_des}, d: {d_des}')

# Check strain in the steel
A = 0.85*fc*beta_1(fc)*b_des
B = As_des * Es * ecu
C = -As_des * Es * ecu * d_des

# Calculate depth of neutral axis
c = (-B + math.sqrt(B**2 - 4*A*C)) / (2*A)

# Calculate strain of steel
ey = fy/Es
es = (ecu*(d_des-c))/c

if es>ey:
	print('The steel is yielding!')
else:
	print('The steel is not yielding ://')

## Checks
rho_min = 0.003
#rho_des = As_des / (b_des*d_des)



