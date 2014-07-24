$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

height = 30;
holer = 19;

eqtri = 19;

/*
difference () {
	//body
	translate([0,5,height/2]) cube ([27,27,30], true);
	translate([0,0,-1]) cylinder(32,9.5,9.5);

	//spike attach point
	rotate([0,0,90]) translate([13,-eqtri/2,-1]) linear_extrude(height+2)
	{
		polygon(points=[[0,0],[eqtri, eqtri/2],[0,eqtri]], paths=[[0,1,2]]);
	}

	//bolt hole
	rotate([0,90,0]) translate([-15,0,-15]) cylinder(30,2.5,2.5);
}

*/

linear_extrude(3)
{
	polygon(points=[[0,0],[0, 25],[150,12.5]], paths=[[0,1,2]]);
}

difference() {

rotate([90,0,0]) translate([0,-12.5,-14])
linear_extrude(3)
{
	polygon(points=[[0,0],[0, 25],[150,12.5]], paths=[[0,1,2]]);
}
translate([0,0,-10])cube([400,400,20],center=true);

}

difference() {
union() {
	translate([-25,0,0]) cube([25,25,30]);
	rotate([90,0,0]) translate([-12.5,30,-25]) cylinder(25,12.5,12.5);
}
translate([-26,3,13]) cube([30,19,40]);
	//bolt hole
	rotate([90,0,0]) translate([-12.5,30,-29]) cylinder(30,2.5,2.5);
}

