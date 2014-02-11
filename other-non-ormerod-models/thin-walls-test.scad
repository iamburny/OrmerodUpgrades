//thin walls
$fn=50;
rad=6;
len=2;
h=20;
wall=0.15;


//box
difference() {
	hull() {
		//outer shape
		cube([len,len,h]);
		translate([20,20,0]) cube([len,len,h]);
		translate([0+rad,20-rad+len,0]) cylinder(h,rad,rad);
		translate([20-rad+len,0+rad,0]) cylinder(h,rad,rad);
	}
	hull() {
		//inner shape
		translate([wall,wall,wall*2]) cube([len,len,h]);
		translate([20-wall,20-wall,wall*2]) cube([len,len,h]);
		translate([0+rad+wall,20-rad+len-wall,wall*2]) cylinder(h,rad,rad);
		translate([20-rad+len-wall,0+rad+wall,wall*2]) cylinder(h,rad,rad);
	}
}

/*
//lid
difference() {
	hull() {
		//outer shape
		cube([len,len,h]);
		translate([20,20,0]) cube([len,len,h]);
		translate([0+rad,20-rad+len,0]) cylinder(h,rad,rad);
		translate([20-rad+len,0+rad,0]) cylinder(h,rad,rad);
	}
	hull() {
		//inner shape
		translate([wall,wall,wall*2]) cube([len,len,h]);
		translate([20-wall,20-wall,wall*2]) cube([len,len,h]);
		translate([0+rad+wall,20-rad+len-wall,wall*2]) cylinder(h,rad,rad);
		translate([20-rad+len-wall,0+rad+wall,wall*2]) cylinder(h,rad,rad);
	}
}
*/