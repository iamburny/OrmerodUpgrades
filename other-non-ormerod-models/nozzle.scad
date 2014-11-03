$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

outer_rad = 37 / 2;
inner_rad = 32.5 / 2;

module tube(h) {
		hull() {
			translate([0,-4,0]) cylinder(h,5,5);
			translate([0,4,0]) cylinder(h,5,5);
		}
}

module base(h,out,in) {
		cylinder(h,out,out);
}

hull() {
	translate([5,0,45]) tube(1);
	translate([outer_rad,0,0]) base(20,outer_rad,inner_rad);
}

translate([5,0,45]) tube(40);
