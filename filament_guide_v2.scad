$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

cube([40,30,5]); //base
cube([5,30,20]); //vert left
translate([10.1,0,0]) cube([5,30,20]); //vert right
translate([12,15,15]) cylinder(5,2.5,2.5); //grip knobble

difference() {
	union() {
		translate([14.9,10,4.9]) cube([30,10,7]);
		translate([45,15,5]) cylinder(7,5,5);
		translate([40,15,0]) cylinder(5,15,15);
	}
	union() {
		translate([45,15,-1]) cylinder(20,1,1); //filament
		translate([45,15,-1]) cylinder(8,1.55,1.55); //filament tube
		translate([45,14,-1]) cube([15,2,18]);
	}
}