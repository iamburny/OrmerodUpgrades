
$fs=0.2; // def 1, 0.2 is high res
$fa=3;//def 12, 3 is very nice

linear_extrude(
	height = 90, 
	center = 0, 
	convexity = 0, 
	twist = 360, 
	scale=1.2, 
	slices=100)
translate([10,0,0])
circle(45);
