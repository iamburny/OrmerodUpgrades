$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

//cylinder(150,55/2,55/2);

difference() {
	union() {
	translate([-80,0,0]) cylinder(10,55/2,55/2);
	translate([-80,0,0]) cylinder(15,52/2,50.6/2);
	}
	translate([-80,0,3]) cylinder(20,46/2,46/2);
	
}