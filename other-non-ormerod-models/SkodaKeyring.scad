$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform
difference() {
import ("skoda.stl");

difference() {
	cylinder(h=5,r=35);
	translate([0,0,-1]) cylinder(h=7,r=20);
}
}