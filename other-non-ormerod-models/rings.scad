$fn=60;
//ring 1

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
