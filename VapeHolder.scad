module hole(height, radius = 5) {
    offset = 0.1;
    translate([0,0, -1*offset])
        cylinder(h=height+2*offset, r1=radius, r2=radius);
}

module vape_base(msg, height) {
    hole_radius = 6;
    width = 20;
    length = 60;
        
    union(){
        color("grey")
        difference() {
            
        hull(){
                union(){
                    
                    translate([0, 0, 30]) // Move Middle Up before Hulling
                    cube([width, length, height]);
                    
                    translate([15, -15, 0])
                        cube([20, 20, height/2]);
                    
                    translate([-15, -15, 0])
                        cube([20, 20, height/2]);
                    
                    translate([-15, 55, 0])
                        cube([20, 20, height/2]);
                    
                    translate([15, 55, 0])
                        cube([20, 20, height/2]);
                }
            }

            
            
            for(i = [1 : 4]) {
                translate([width/2, (14*i)-5, 0])
                    hole(100/*height*/, hole_radius);    
            }
            

            //color("red")
            //rotate([0,0,90])
            //translate([-10,-34,4])
            //linear_extrude(6)
                //text(msg, size=2);

        }
    }
}

$fn = 360;

vape_base("vape holder v0.1", 10);