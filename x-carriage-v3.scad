$fn=100;

difference() {
union() {
	translate([-20,-15,-20.45]) import("x-carriage.stl"); 
	translate([20,3.8,7.2]) cube([7,4,1.8]);	
	}
	translate([20,-.2,0]) cube([0.35,5.5,15]); //sensor gap
	translate([20,-.2,9]) cube([1,5.8,6]); //vert slot to allow spring
	rotate([0,0,-15]) translate([18,10,0]) cube([0.4,5.5,9.05]); //diag slot to allow spring
	rotate([0,0,-15]) translate([18,10,9]) cube([0.4,2.2,1]); //diag slot to allow spring
	translate([22,10,0]) cylinder(9.005,.8,.8); //bendy hole
	
	hull() {
		//bearing slot extension
		translate([22.5,5,4.5])  rotate([90,0,0]) cylinder(10,1.7,1.7); 
		translate([26,5,4.5])  rotate([90,0,0]) cylinder(10,1.7,1.7); 
	}
	
	translate([20,4.1,1.55]) cube([14,3.3,4.5]); //hex nut slot
	
	//translate([0,0,45]) cube([60,60,70], true);		//DEV top chop
}

//translate([0,0,-1]) cube([50,50,2], true);		//zero base
