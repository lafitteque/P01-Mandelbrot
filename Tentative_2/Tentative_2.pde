int taille_ecran = 1000;
int nombre_iterations=22;
int compte_iterations;
complexe z;
complexe c;
complexe centre = new complexe(-1,0);
float scale = 1/3f;
float puissance = 2;


void setup(){
  size(1000,1000);
  background(20);
  mandelbrot(nombre_iterations);
}

void draw(){

}

void mandelbrot(int n ){
  for (int i = 0 ; i<taille_ecran ; i++){
      for (int j = 0 ; j<taille_ecran ; j++){
        point_mandelbrot( i , j , n );
      }
  }
}


void point_mandelbrot(int x , int y , int n ){
  compte_iterations = 0;
  z = new complexe(0f,0f);
  c = new complexe( x/ (float) taille_ecran / scale  - 1 / 2f / scale + centre.re, y/ (float) taille_ecran / scale - 1 / 2f / scale + centre.im);
  
  for (int i = 0; i<n;i++){
    if(z != null){
      z = z.power(puissance).addition(c);
      compte_iterations++;
      if (z.module() > 2 ) {
        z = null;
      }    
    }
  }
  //println(c.re , c.im);
  stroke( (z!=null)?0:255, 127 , 255* compte_iterations/ (float) n);
  point(x,y);
}
