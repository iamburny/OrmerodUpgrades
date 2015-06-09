

//body
dia = 35;
zheight = 25;

//slot
base = 5.5;
width = 7;

//thread hole
supWidth = 11;

//plastic screw hole
zpos = 14;
rad = 3.7;

difference() {
    union() {
        cylinder(6,10,12.5);
        cylinder(12,4,4);
    }
    translate([0,0,5]) cylinder(12,2,2);
}

translate([40,0,0]) shelf_bracket();

module shelf_bracket() {
    difference() {
        translate([0,0,0]) cylinder( zheight,dia/2,dia/3); //body
        translate([-(dia+10)/2, -width /2,base]) cube([dia+10,width, zheight+10]); //slot
        screw_hole();
         translate([0,0,zpos]) rotate([90,0,0]) cylinder(dia/2, rad,rad);
    }
}

module screw_hole() {
    translate([0,0,3]) cylinder(2.5, 2.2,4.4); //screwhole
    translate([0,0,5.5]) cylinder(40, 4.4,4.4); //screwhole
	translate([0,0,-1]) cylinder(3+3, 2.2,2.2); //screwhole
}