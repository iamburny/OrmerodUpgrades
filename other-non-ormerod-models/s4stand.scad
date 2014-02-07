$fn=200;
include <MCAD/regular_shapes.scad>;
slot = 9;
angle = -17;

difference() {
	
	union() {
		cube([125,25,17], true);
		translate([0,15,0]) cube([6,12,45], true);
		rotate([90+angle,0,0]) translate([0,10,-31.5])  {
			difference() {
				cylinder(30,10,30);
				translate([0,0,-5]) cylinder(30,10,30);
			}
		}
	}

	translate ([0,0,-23.5])  cube([125,60,30], true); //clear base
	 rotate([angle,0,0])  {
		translate ([0,-3,5])cube([135,slot,10], true); //main landscape lot
		translate ([-35.5,-3.5,3.5])  cube([25,3,10], true); //vol button slot
		translate ([0,-3,-1]) cube([70,slot,10], true); //portrait slot
		translate ([0,-10,1]) cube([18,slot,10], true); //portrait button slot
	}
	translate ([0,-10,6])  cube([110,12,7.5], true); //front landscape gap

	color("orange") translate ([0,-17,-10]) rotate([30,0,0]) cube([110,12,4], true);  //front bevel
	color("orange") translate ([66,0,-10]) rotate([0,30,0]) cube([12,10,4], true);  //right bevel
	mirror([1,0,0]) color("orange") translate ([66,0,-10]) rotate([0,30,0]) cube([12,10,4], true);  //right bevel
	//translate([0,10,2]) cylinder(35,20,0); //hollow
	rotate([90+angle,0,0]) translate([-16,5,-1.7]) scale([.2,.2,.4]) linear_extrude(3) import("S4.dxf");		
}

