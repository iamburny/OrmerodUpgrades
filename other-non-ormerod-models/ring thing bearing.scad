$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

gap = 1; //clearance

height = 10;
inner_hole_dia = 36;
outer_dia = 50;
teeth = 12;
tooth_w = 10;

//tooth
module tooth(r) {
	rotate([0,0,r*(360/teeth)]) translate([0,(outer_dia/2)-.5,0])
	difference()	{
		translate([0,0,height/2]) {
			cube([tooth_w ,10,height],true);//main tooth block
			
		}
		translate([0,-(outer_dia/2),0]) cylinder(height,outer_dia/2,outer_dia/2); //cut curve
		translate([-tooth_w,0,height/2]) rotate([0,0,-20]) cube([10,20,height],true);	
		translate([tooth_w,0,height/2]) rotate([0,0,20]) cube([10,20,height],true);
		translate([0,0,10+(height/2)]) rotate([-10,0,0]) cube([10,20,height],true);
	}
}

//outer 
module outer() {
	difference() {
		cylinder(height,outer_dia/2,outer_dia/2);
		cylinder(50,24,0);
		translate([0,0,-40]) cylinder(50,0,24);
	}
}

cent = 10;
hole = 7;
holes = 5;

//inner
module inner() {
	difference() {
		union() {
			cylinder(50,24 - gap,0);
			translate([0,0,-40]) cylinder(50,0,24-gap);
		}
		translate([0,0,-50]) cube([100,100,100], true);
		translate([0,0,50+height]) cube([100,100,100], true);
	
		//inner-inner hole
		//cylinder(height,inner_hole_dia/2,inner_hole_dia/2);
		for (r = [0 : holes] ){
			rotate([0,0,r*(360/holes)]) translate([cent,0,0]) cylinder(height,hole ,hole );
		}
		cylinder(height,hole ,hole );
		translate([-30,0,height/2]) rotate([0,90,0]) cylinder(60,2.5,2.5);
		translate([0,30,height/2]) rotate([90,0,0]) cylinder(60,2.5,2.5);
	}
}


for (r = [0 : teeth] ){
	tooth(r);
}

outer();
inner();
	
	
	
	
	
	
	
	
	
	
	
	
	