$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

difference(){
cylinder(5,17,15);

translate([.1,0.1,-1]) cube([10.3,10.3,10.3]);
translate([-10.1,-10.1,-1]) cube([10.3,10.3,10.3]);
}