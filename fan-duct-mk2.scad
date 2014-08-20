$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

h = 50;
fan = 56.7;  //60mm = 56.7
hollow_scale = 0.93;
fan_rad = (fan / hollow_scale) / 2;
nozzle_rad = 15 / 2;
wall = 1.5;

module cone() {
	difference() {
		cylinder(h,fan_rad,nozzle_rad);
		translate([-fan_rad-5,-fan_rad,19]) rotate([0,40,0]) cube([10,fan_rad*2, h]);			}
}

module mount() {
	difference() {
		cube([20,30,10]);
	}
}

module fan_screw_holes(centres = 50) {
	for(xp = [0:1]) { //4 x screw holes
		for(yp = [0:1]) { 
			translate([(centres/2) - (xp*centres), (centres/2) - (yp*centres),-.1]) cylinder(4,1.6,1.6);
		}
	}
}

//translate([0,0,29.5])
//rotate([0,-130,0]) {

difference() {
	union() {
		cone();
		translate([0,0,1.5]) cube([fan_rad*2,fan_rad*2,3],true); //base 
		translate([0,-10,35]) rotate([0,40,0]) cube([20,20,10]); //mount block
	}
	translate([0,0,2]) scale([hollow_scale,hollow_scale,hollow_scale]) cone(); //inner hollow cone
	translate([0,0,h-.5]) cube([20,20, 5], true); //crop top of cone
	cylinder(3,fan_rad*hollow_scale,fan_rad*hollow_scale); //open bottom of cone
	fan_screw_holes();
	
	translate([0,0,10]) rotate([0,40,0]) cylinder(30,1.6,1.6);
}

//}

