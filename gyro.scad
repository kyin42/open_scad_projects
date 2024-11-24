
rings = 4;
inner = 8;
gap = .1;
width = 1.5;
height = 7;
res = 180;

intersection(){
    sphere(inner, $fn = res);
    cube([inner*2,inner*2,height*2],center=true);
}

for(size = [inner+width : width : width*rings+inner]){
    //height = height + (((size-(inner+width))/width));
    echo(height);
    difference(){
        intersection(){
            cube([size*2,size*2,height*2],center=true);
            sphere(size, $fn = res);
        }
        sphere(size-width+gap, $fn = res);
    }
}