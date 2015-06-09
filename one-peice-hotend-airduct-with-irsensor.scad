$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

//Fan Spacer
sc = 32; //Screw Centres

hole = 37.5;  //fan hole
x=42;
y=42;
z=2;

module fan_mount_arm() {
   cube([0,0,0]);
}

module body_shape() {
	translate([x/2,x/2,0]) cylinder(z,(hole+6)/2,(hole+6)/2);
	cube([x,y,z]); //outer block
	fan_mount_arm()
}

module screw_holes() {
	translate([(x-sc)/2,(x-sc)/2,-.1]) cylinder(3,1.6,1.6);
	translate([(x-sc)/2,(x-sc)/2 + sc,-.1]) cylinder(3,1.2,1.2);
	translate([(x-sc)/2 + sc,(x-sc)/2,-.1]) cylinder(3,1.6,1.6);
	translate([(x-sc)/2 + sc,(x-sc)/2 + sc,-.1]) cylinder(3,1.2,1.2);
}


difference() {
	body_shape();
	translate([x/2,x/2,-.1]) cylinder(20,hole/2,hole/2); //fan hole
	screw_holes();
}
