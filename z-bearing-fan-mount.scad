$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

//color("red") translate([-38,-171.5,-20.451]) import("z-bearing-clamp.stl");  

fh = 15;

module flange() {
	difference() {
		union() {
			translate([-5,11,0]) cube([10,9,fh]);
			translate([0,20,0]) cylinder(fh,5,5);
		}
		translate([0,20.5,-1]) cylinder(fh+2,1.7,1.7);
	}
}

module uBracket() {
	difference() {
		union() {
			translate([5,0,0]) cube([10,30,10]); // U body
			rotate([90,0,0]) translate([5,5,-30]) cylinder(30,5,5); //U screw holes outer rad
			translate([12.5,25,0]) cube([37.5,5,10]); //arm
			rotate([90,0,0]) translate([50,5,-30]) cylinder(5,5,5); // arm end radius

		}
		translate([-.5,3,-1]) cube([11,15,12]);
		translate([-.5,21.5,-1]) cube([11,15,12]); //U cut out
		translate([4.6,31,5]) rotate([90,0,0]) cylinder(32,1.6,1.7); //U screw holes
		rotate([90,0,0]) translate([50,5,-31]) cylinder(7,1.7,1.7); // arm pin hole

	}
}

module joint() {
	difference() {
		union() {
			translate([5,-5,0]) cube([5,12.5,10]);
			translate([-5,7.5,5]) rotate([0,90,0])cylinder(15,5,5);
 			translate([-1,-5,0]) cube(10,5,5);
			rotate([90,0,0]) translate([0,5,-1]) cylinder(6,5,5);
		}
		translate([4,7.5,5]) rotate([0,90,0])cylinder(7,1.5,1.5);
		translate([-6,-.5,-1]) cube([11,5.5,12]); 

		rotate([90,0,0]) translate([0,5,-15]) cylinder(14,1.7,1.7); // top screw hole
		rotate([90,0,0]) translate([0,5,-1]) cylinder(7,1.5,1.5); // top screw hole
		rotate([90,0,0]) translate([0,5,-13]) cylinder(3,3,3); // top screw head hole
	}
}

module fanMount() {

	difference() {
		union() {
			translate([8,0,0]) cube([18,50,3]); //fan support
			translate([8,0,0]) cube([6,12.5,10]); // arm end 
			translate([8,12.5,5]) rotate([0,90,0])cylinder(6,5,5); // arm end radius
		}
		translate([20,5,-1]) cylinder(15,1.6,1.6);  //fan support fixing hole
		translate([20,45,-1]) cylinder(15,1.6,1.6);  //fan support fixing hole
		translate([41,25,-1]) cylinder(5,25,25);  //fan support fixing hole
		translate([7,12.5,5]) rotate([0,90,0])cylinder(8,1.7,1.7); // arm pin hole	
		translate([11,12.5,5]) rotate([0,90,0])cylinder(10,3,3); // arm pin hole	
	}



}



//color("red") flange(); 

//color("blue") rotate([90,0,90]) translate([16,-3,-5]) uBracket();

uBracket();

color("orange") translate([50,40,0]) joint(); //50,25,0

color("green") translate([57,20,0]) fanMount(); //52,20,0