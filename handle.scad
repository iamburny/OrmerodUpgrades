$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

difference() {
	union() {	
		scale ([1,1,.5]) sphere(d=50);
		cylinder(20,10,10);
	}
	translate([-25,-25,-30]) cube([50,50,30]);
	cylinder(20,8,3);
}


