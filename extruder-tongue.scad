$fn = 80;
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

//translate([-14,0,0]) import ("tongue.stl");

module original() {
	difference() {
		hull() {
			translate([0,14,0]) cylinder(4,4,4);

			difference() {
				translate([-4,4,0]) cube([8,8,4]);
				translate([-5,3.4,2]) rotate([45,0,0]) cube ([10,4,4]);
			}
		}
		translate([0,14,0])  cylinder(4,2,2);
	}

	difference() {
		translate([-4,-4,0]) cube([8,8,2]);
		cylinder(4,2,2);
		translate([-2,-4,0]) cube([4,4,2]);
	}
}

translate([0,0,0]) rotate([0,0,0]) {

difference() {
	union() {
		hull() {
			translate([0,14,0]) cylinder(4,4,4);
			translate([-4,4,0]) cube([8,8,4]);
		}
		translate([-4,7.6,4])  cube([8,3,7.6]);
	}
	translate([0,14,0])  cylinder(4,2,2);
	translate([-4.5,7.5,4.3]) rotate([0,90,0]) cylinder(9,.7,.7);
}


difference() {
	hull() {
		translate([-4,-4,0]) cube([8,8,3]);
		translate([-4,4,0]) cube([8,1,4]);
	}
	cylinder(4,2,2);
	cylinder(1,2.5,2.5);
	translate([-2,-4,0]) cube([4,4,4]);
	translate([-2.5,-4.5,0]) cube([5,5,1]);
}


difference() {
	translate([-4,-4,11.5])  cube([8,14.6,2.5]);
	translate([0,0,11.5])  cylinder(4,2.6,2.6);
	translate([-2,-4,11]) cube([4,4,4]);
	translate([0,-4,11])  cylinder(4,2.6,2.6);
}
}
