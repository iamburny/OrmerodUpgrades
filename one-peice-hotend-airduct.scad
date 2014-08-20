$fn=40;
//hotend duct 
sc = 32; //Screw Centres
wall=2;
hole = 37.5;  //fan hole
x=42;
y=x;
z=15.10;
heo = 2.5; //hot end offset
hbr = 16; //heat block recess

module heatsink() 
{
	cube([38, 40, 12]); //heatsink hole
	translate([-1,-1,11]) cube([40, 42, 3]); //heatsink recess
	translate([3,36,-2.1]) cylinder(3,1.6,1.6); //screw hole
	translate([35,36,-2.1]) cylinder(3,1.6,1.6); //screw hole
}


//Body
difference() {
	cube([x,y+15,z]); //outer block
	translate([2,2,2]) heatsink();
	translate([x/2,(y/2),-.1]) cylinder(5,hole/2,hole/2); //fan hole
}