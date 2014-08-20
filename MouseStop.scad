$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

module ear(size=3) {
	difference() {
		sphere(size);
		translate([0,-size*2,-size*2]) cube([size*4,size*4,size*4]);
	}
}

module eye(size=5, width=1) {
	translate([0,0,0]) cube([width,size,30]);
	translate([(size/2)+(width/2),(size/2)-(width/2),0]) rotate([0,0,90]) cube([width,size,30]);
}

module leg() {
linear_extrude(height = 2) {
	offset(delta=.4, join_type = "round") {
		polygon(
			points=[
				[4,-2],[4,4],[2,8],[3,9],[5,5],
				[5.5,5.5],[5.5,10],[6.5,10],[6.5,5.5],[7,5],
				[8,9],[9,8],[8,5],[7.5,-2] 
			], 
			paths=[
				[0,1,2,3,4,5,6,7,8,9,10,11,12,13]
			]);
	}
	}
}

module body() {
	difference() {
	union() {
		translate([0,0,-3]) hull() {
			cylinder(15,15,20); //bum
			translate([50,0,5]) sphere(2); //nose
		}
		translate([52.5,0,1.8]) sphere(2.2); //Nose tip

		//whiskers
		translate([48,10,.2]) rotate([90,0,5]) cylinder(20,.5,.5); 
		translate([49.8,10,.2]) rotate([90,0,-5]) cylinder(20,.5,.5);

		translate([13,13,0]) rotate([0,0,-20]) leg(); //front leg
		translate([23.5,-10,0]) rotate([0,0,-160]) leg(); //back leg

		translate([-8,13,0]) rotate([0,0,20]) leg(); //back leg
		translate([3.5,-17,0]) rotate([0,0,160]) leg(); //back leg

	}

		//back slope
		rotate([0,-12,0]) translate([-20,-25,4]) cube([60,50,20]);

		//eye crosses
		translate([41.5,1,4]) rotate([-15,0,40]) eye(4);
		translate([40,-4.5,1]) rotate([15,0,45]) eye(4);

		//underneath trim
		translate([0,0,-5])cube([200,200,10],center=true);
	}
}

body();

translate([37,-5,8]) ear(3.5);
translate([37,5,8]) ear(3.5);

