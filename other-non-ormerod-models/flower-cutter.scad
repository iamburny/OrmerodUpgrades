$fs=0.8; // def 1, 0.2 is high res
$fa=4;//def 12, 3 is very nice
%translate([0,0,-0.5])cube([200,200,1],center=true); //build platform

translate ([-59,-59,0]) linear_extrude(height=40, true) import("C:/Users/Matt/Desktop/flower2.dxf");
