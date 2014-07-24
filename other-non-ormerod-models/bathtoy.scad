scoop = 40;
wall = 2;
 
difference() {
	cube([scoop,scoop,scoop], true); //body
	cube([scoop-(wall*2),scoop-(wall*2),scoop+wall],true);	//aperture
}

difference() {
	cube([scoop,scoop,scoop], true); //body
	cube([scoop-(wall*2),scoop-(wall*2),scoop+wall],true);	//aperture
}



/*
translate([-sqrt(40*40 + 40*40),0,0]) {
translate([-scoop*1.5,0,0]) cube([scoop*3,scoop,scoop]); //half cube
difference() {
	cylinder(40,20,20);
	translate([-20,0,0]) cube([40,20,40]);
	cylinder(40,15,15);
}*/