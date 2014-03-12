$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

rotate([0,0,33.1]) translate([-170,-157.5,-20.45]) import ("x-idler-bracket.stl");

translate([4,-7,0]) difference()  {
	union() {
		cube([15,12,5]);
		hull() {
		translate([3,0,0]) cylinder(h=5,r=3);
		translate([12,0,0]) cylinder(h=5,r=3);
		}
	}
	translate([10,2,-1]) cylinder(h=7,r=1.7);
}