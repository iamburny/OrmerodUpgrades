$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

sc = 32; //Screw Centres
wall=2;
hole = 37.5;  //fan hole
x=42;
y=x;
z=15.10;
heo = 2.5; //hot end offset
hbr = 16; //heat block recess

ventB=(x/2)-(hbr/2)+heo-2;
ventS=(x/2)-(hbr/2)-heo;

module sensorMount() {
	difference() {
		union() {
			translate([-3,y-5.5,9]) rotate([0,90,0]) cylinder(4,3,6);	// sensor board mount
			translate([-3,y-28.5,9]) rotate([0,90,0]) cylinder(4,3,6);	// sensor board mount	
		}
		translate([-4,y-5.5,9]) rotate([0,90,0]) cylinder(h=5,r=1.2);	// sensor board hole
		translate([-4,y-28.5,9]) rotate([0,90,0]) cylinder(h=5,r=1.2);	// sensor board hole
	}
}

module heatsink() 
{
	cube([38, 40, 12]); //heatsink hole
	translate([-1,-1,11]) cube([40, 42, 3]); //heatsink recess
	translate([3,36,-2.1]) cylinder(3,1.6,1.6); //screw hole
	translate([35,36,-2.1]) cylinder(3,1.6,1.6); //screw hole
}

module prism(l, w, h) {
	translate([0, l, 0]) rotate( a= [90, 0, 0]) 
	linear_extrude(height = l) polygon(points = [
		[0, 0],
		[w, 0],
		[0, h]
	], paths=[[0,2,1]]);
}

module vHole(len) {
	difference() {
		union() {
			cube([10-6,len,6]);
			translate([10-6,len,6]) rotate([90,0,0]) cylinder(len,6,6);
		}
		translate ([-7,-1,6]) cube([16,len+2,10]);
		translate ([-7,-1,0]) cube([6,len+2,7]);
	}
}

//Body
difference() {
	cube([x,y+1.9,z]); //outer block
	
	translate([x/2,(y/2),-.1]) cylinder(5,hole/2,hole/2); //fan hole
	translate([wall,wall,2]) heatsink();

}

/*/*Cable Traps
translate([x,(y/2)-10,0]) cube([wall*2,20,1.5]); //right cable trap
difference() {
	translate([x+3,(y/2)-10,0]) cube([1.5,20,z]); //right cable trap
	translate([x+2,(y/2)-10,z-2]) rotate([45,0,0]) cube(3); //right cable trap bevel
	translate([x+2,y-11,z-2]) rotate([45,0,0]) cube(3); //right cable trap bevel
}
translate([x+1.6,(y/2)-7.5,z-1.5]) rotate([0,45,0]) cube([2,15,2]); //right cable trap catch

//Tie Wrap T
translate([x/2-2.5,-6,0]) cube([5,6,2]);
translate([x/2-4,-6,0]) cube([8,2,2]);
*/

//sensorMount() ;
