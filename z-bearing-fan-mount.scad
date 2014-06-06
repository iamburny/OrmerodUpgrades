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

module fanMount() {
	difference() {
			union() {
				translate([0,12,0]) cube([10,3,10]); //arm
				translate([0,0,0]) cube([10,3,10]); //arm
				
				intersection() {
					union() {
						rotate([90,0,0]) translate([0,5,-18]) cylinder(8,5,5); // arm end radius
						rotate([90,0,0]) translate([0,5,-5]) cylinder(8,5,5); // arm end radius
					}
					translate([0,7.5,5]) sphere(9); // 
				}
			}
			rotate([90,0,0]) translate([0,6.7,-18]) cylinder(20,1.7,1.7); // mount slot
			rotate([90,0,0]) translate([0,5.2,-18]) cylinder(20,1.7,1.7); // mount slot
			rotate([90,0,0]) translate([0,3.7,-18]) cylinder(20,1.7,1.7); // mount slot
	}
	
	difference() {
		translate([8,0,0]) cube([13,50,3]); //fan support
		translate([16,5,-1]) cylinder(15,1.7,1.7);  //fan support fixing hole
		translate([16,45,-1]) cylinder(15,1.7,1.7);  //fan support fixing hole
		translate([36,25,-1]) cylinder(5,25,25);  //fan support fixing hole
	}
}


color("red") flange(); 

color("blue") rotate([90,0,90]) translate([16,-3,-5]) uBracket();

color("green") rotate([90,0,90]) translate([66,17,-5]) fanMount();