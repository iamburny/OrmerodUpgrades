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

ventB=(x/2)-(hbr/2)+heo;
ventS=(x/2)-(hbr/2)-heo;

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


//Vents
translate([x,y-0.01,0]) rotate([0,0,90]) {
difference() {
	union() {
	difference() {
		union() {
			prism(ventS,z,z);
			translate([z-6,0,0]) cube([4,ventS,6]);
		}
		difference() {
			translate([-.01,wall,wall]) prism(ventS-(wall*2),z-(wall*2),z-(wall*2));
			translate([6,0,0]) cube([6,ventS,6]);
		}
		
		translate([z-12,wall,wall]) vHole(ventS-(wall*2));
	}

	translate([0,ventS+hbr,0]) { //Small Vent
		difference() { //Big Vent
			union() {
				prism(ventB,z,z);
				translate([z-6,0,0]) cube([4,ventB,6]);
			}
			difference() {
				translate([-.01,wall,wall]) prism(ventB-(wall*2),z-(wall*2),z-(wall*2));
				translate([6,0,0]) cube([6,ventB,6]);
			}
			translate([z-12,wall,wall]) vHole(ventB-(wall*2));
		}
	}
	cube([z-2,y,wall]); //Base
	translate([0,0,z-wall]) cube([wall,y,wall]); //top of slope edging strip
	difference() {
		translate([-wall/2,ventS-wall,wall]) cube([wall+1,hbr+(wall*2),z-(wall*2)]); //vent join

		translate([-1,ventS-3,wall]) rotate([0,0,45]) cube([wall,wall,z-(wall*2)]); //vent join bevel
		translate([-1,hbr+ventS,wall]) rotate([0,0,45]) cube([wall,wall,z-(wall*2)]); //vent join bevel
	}
	}
	translate([10,-1,0]) rotate([0,45,0]) cube([10,y+2,10]);
}

}

//Body
difference() {
	cube([x,y,z]); //outer block
	translate([x/2,x/2,-.1]) cylinder(20,hole/2,hole/2); //fan hole
	translate([wall,wall,2]) cube([x-(wall*2), x, 20]); //heatsink hole
	translate([wall-1,wall-1,z-2]) cube([x-(wall), x, 20]); //heatsink recess
	
	for(xp = [0:1]) { //4 x screw holes
		for(yp = [1:1]) { // dont need 4 screw holes so changed [0:1] to [1:1]
			//hull() { //hull to make slots
			translate([((x-sc)/2) + (xp*sc),((x-sc)/2) + (yp*sc),-.1]) cylinder(3,1.6,1.6);
			//translate([((x-sc)/2) + (xp*sc),((x-sc)/2) + (yp*sc)+2,-.1]) cylinder(3,1.5,1.5);
			//}
		}
	}
	translate([0,-6,-1]) rotate([0,0,45]) cube([5,5,z+2]);
	translate([x,-6,-1]) rotate([0,0,45]) cube([5,5,z+2]);
}


//Cable Traps
translate([x,(y/2)-10,0]) cube([wall*2,20,2]); //right cable trap
	difference() {
	hull() {
		translate([x+wall,(y/2),5]) rotate([0,90,0]) cylinder(wall,9,10); //right cable trap
		translate([x+wall,(y/2)-10,0]) cube([wall,20,2]); //right cable trap
	}
	translate([x+wall-.1,(y/2)-10,-10]) cube([wall+.2,20,10]); //remove bottom cylinder
}

translate([-wall*2,(y/2)-10,0]) cube([wall*2,20,2]); //left cable trap
	difference() {
	hull() {
		translate([-wall*2,(y/2),5]) rotate([0,90,0]) cylinder(wall,10,9); 
		translate([-wall*2,(y/2)-10,0]) cube([wall,20,2]); 
	}
	translate([-(wall*2)-.1,(y/2)-10,-10]) cube([wall+.2,20,10]); //remove bottom cylinder
}

//Tie Wrap T
translate([x/2-2.5,-6,0]) cube([5,6,2]);
translate([x/2-4,-6,0]) cube([8,2,2]);
