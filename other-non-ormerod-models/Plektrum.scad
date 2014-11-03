$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

//CUSTOMIZER VARIABLES

// This section is displays the box options
// Pick Thickness 
z_thick = 0.72;	//	[1:Extra Lite, 1.5:Lite, 1.875:Medium, 2.5:Heavy, 3.75:Extra Heavy, 4.375:Extreme!]

//AdvancedGrip Technology
Grip = 0; // [1:Yes, 0:No]

//CUSTOMIZER VARIABLES END

module grip() {
	//TOP GRIP
	translate([0,0,-1.61]) {
		difference() {
			translate([0,23,2])
				intersection() {
					translate([-51,0,0]) cylinder(.2,67,66);
					translate([51,0,0]) cylinder(.2,67,66);
					translate([0,-38,0]) cylinder(.2,25,24);
				}
			translate([0,-15,0]) cylinder(3,16,25);
		}
	}
	//BOTTOM GRIP
	translate([0,-4,-1.61]) {
		difference() {
			translate([0,23,2])
				intersection() {
				translate([-51,0,0]) cylinder(.2,65,64);
				translate([51,0,0]) cylinder(.2,65,64);
				translate([0,-38,0]) cylinder(.2,23,22);
			}
			translate([0,-15,0]) cylinder(3,14,23);
		}
	}
}

module pick_shape(z_thick) {
	//error correct
	translate([0,25,0])
	linear_extrude(height = z_thick, twist = 0, slices = 3) {
	offset(delta = 4, join_type = "round") {
		intersection() {
			translate([-57,0,0]) circle(69);
			translate([57,0,0]) circle(69);
			translate([0,-41,0]) circle(25);
		}
	}
	}
}

//PickPerfect

color("darkorange") pick_shape(z_thick);
if(Grip==1){
	color("gold") grip();
}
translate([0,-0,.5])linear_extrude(height = z_thick, slices = 3) {
	 text("CRB", font = "Racing Sans One", size = 8, halign = "center");
}



