height = 24;
rings = 2;
space = 1.5;
width = 2;
maxradius = 21;
resolution = 100;
pivotends = 1;
slotsize = 3;
pivotsize = 3;
difference(){
    union(){
        for(i = [0:rings-1]){
            radius = maxradius-((width+space)*i);
            rotation = i*90;
            difference(){
                union(){
                    difference(){
                        intersection() {
                            //if(i!= rings-1)
                            cube([radius*2,radius*2,height], center=true);
                            sphere(radius, $fn=resolution);
                        }
                        //if(i != rings-1)
                        sphere(radius-width, $fn=resolution);    
                    }
                    if(i != rings-1){
                        rotate([0,90,rotation]) translate([0,0,-(radius-(width))]) cylinder((space+(width*1.3)),pivotsize,(pivotsize/3.5)*pivotends, $fn=resolution);
                        rotate([0,-90,rotation]) translate([0,0,-(radius-(width))]) cylinder((space+(width*1.3)),pivotsize,(pivotsize/3.5)*pivotends, $fn=resolution);
                    
                    }
                }
                if(i != 0){
                    rotate([0,90,rotation+90]) translate([0,0,-(radius+(width/1.65))]) cylinder((space+(width*1.3)),pivotsize,(pivotsize/3.5)*pivotends, $fn=resolution);
                    rotate([0,-90,rotation+90]) translate([0,0,-(radius+(width/1.65))]) cylinder((space+(width*1.3)),pivotsize,(pivotsize/3.5)*pivotends, $fn=resolution);
                }
            }
        }
    }
    union(){
        for(i = [0:30:150]){
            rotate([0,0,i+15]){
                cube([maxradius*2,slotsize,height-8],center = true, $fn=resolution);
                rotate([0,90,0]) translate([(height-8)/2,0,0])cylinder(maxradius*2,slotsize/2,slotsize/2,center = true, $fn=100);
                rotate([0,90,0]) translate([-(height-8)/2,0,0])cylinder(maxradius*2,slotsize/2,slotsize/2,center = true, $fn=100);
            }    
        }
    }
}