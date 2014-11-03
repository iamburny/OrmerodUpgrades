$fs=0.4; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

gph = 41.5;
gpd = 21.5;
z_thick = 1;

rotate([90,0,90]) {
cube([gph+(z_thick*2),10,z_thick]); //front

cube([z_thick,10,gpd+(z_thick*2)]); //side L
translate([gph+z_thick,0,0]) cube([z_thick,10,gpd+(z_thick*2)]); //side L

translate([0,0,gpd+z_thick]) cube([(gph/2)-1.5,10,z_thick]); //top
translate([(gph/2)+(z_thick*2)+.5,0,gpd+z_thick]) cube([(gph/2)-.5,10,z_thick]); //top

difference() {
union() {
	translate([(gph/2)-4,0,gpd+z_thick]) cube([3,10,8]); //mount
	translate([(gph/2)+2.5,0,gpd+z_thick]) cube([3,10,8]); //mount

	translate([(gph/2)-4,5,gpd+z_thick+8]) rotate([0,90,0]) cylinder (3,5,5); //mount
	translate([(gph/2)+2.5,5,gpd+z_thick+8]) rotate([0,90,0]) cylinder (3,5,5); //mount
}
	translate([(gph/2)-15,5,gpd+z_thick+8]) rotate([0,90,0]) cylinder (30,2.8,2.8); //screw hole
}
}
