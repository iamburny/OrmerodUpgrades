$fn=150;

cube([20,30,5]);
cube([5,30,20]);
translate([10.1,0,0]) cube([5,30,20]);
translate([12,15,15]) cylinder(5,2.5,2.5);

difference() {
	union() {
		translate([14.9,10,4.9]) cube([10,10,7]);
		translate([25,15,5]) cylinder(7,5,5);
		translate([20,15,0]) cylinder(5,15,15);
	}
	union() {
		translate([25,15,-1]) cylinder(20,1,1); //filament
		translate([25,15,-1]) cylinder(8,1.7,1.7); //filament tube
		translate([25,14,-1]) cube([15,2,18]);
	}
}