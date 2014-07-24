$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

lyr = 0.24;
armsize = 4.8;

difference() {
union() {
//body
difference() {
	cylinder (armsize + (lyr*4),14.4,14.4);
	translate([0,0,-.2])cylinder (6,13.4,13.4);

}

//arms
difference() {
	translate([0,0,(armsize/2) + (lyr*2)]) rotate([0,90,0]) cube([armsize+ (lyr*2),armsize+ (lyr*2),32], true);
	translate([0,0,(armsize/2) + (lyr*2)]) rotate([0,90,0]) cube([armsize,armsize,32], true);
}

difference() {
	translate([0,0,(armsize/2) + (lyr*2)]) rotate([90,90,0]) cube([armsize+ (lyr*2),armsize+ (lyr*2),32], true);
	translate([0,0,(armsize/2) + (lyr*2)]) rotate([90,90,0]) cube([armsize,armsize,32], true);
}


	cylinder (armsize + (lyr*4),5,5);
}
	translate([0,0,-.2])cylinder (6,4.5,4.6);
	translate([0,0,(armsize/2) + (lyr*2)]) rotate([0,90,0]) cube([armsize,armsize,32], true);
	translate([0,0,(armsize/2) + (lyr*2)]) rotate([90,90,0]) cube([armsize,armsize,32], true);
}