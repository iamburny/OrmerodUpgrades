$fn=200;

//body
dia = 25;
zheight = 25;

//slot
base = 4.5;
width = 7;

//thread hole
supWidth = 11;

//plastic screw hole
zpos = 14;
rad = 3.7;

difference() {
	translate([0,0,0]) cylinder( zheight,dia/2,dia/3); //body
	translate([-(dia+10)/2, -width /2,base]) cube([dia+10,width, zheight+10]); //slot
	translate([0,0,3]) cylinder(1.9, 1.9,3.4); //screwhole
	translate([0,0,-1]) cylinder(3+3, 1.9,1.9); //screwhole
	 translate([0,0,zpos]) rotate([90,0,0]) cylinder(dia/2, rad,rad);
}
difference() {
	translate([-supWidth/2, -(width*2)+3, 0]) cube([supWidth,7,20]);
	 translate([0,0,zpos]) rotate([90,0,0])cylinder(dia/2, rad,rad);
	}