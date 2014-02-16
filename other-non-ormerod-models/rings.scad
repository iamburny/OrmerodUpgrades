$fn=60;
//ring 1
/*
difference() {
	cylinder(10,15,15);
	translate([0,0,-1]) cylinder(12,10,10);
}

//ring 2
translate([30,0,0]) {
	difference() {
		cylinder(10,10,10);
		translate([0,0,-1]) cylinder(12,5,5);
	}
}

//ring 2
translate([-25,0,0]) {
	difference() {
		cylinder(10,5,5);
		translate([0,0,-1]) cylinder(12,1,1);
	}
}
*/

difference() {
	union() {
		cylinder(10,13,13); //outer
		hull() {
			translate([0,0,4]) cylinder(2,13,13); //inner
			scale([.85,1,1]) cylinder(.1,15,15);
		}
		hull() {
			translate([0,0,4]) cylinder(2,13,13); //inner
			translate([0,0,9.9]) scale([.89,1,1]) cylinder(.1,14,14);
		}
	}
	translate([0,0,2.1]) cylinder(8,11.6,11.6); //inner
}
