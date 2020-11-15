int taille_ecran = 1000;
int nb_iterations = 15;
float pas = 1/(float)300;
float o = 2;
Complex point_zoom = new Complex(-0.5,0);
int zoom = 1;
Complex[][][] m ;




void setup() {
  pas = (float)pas/zoom;
  size(1000,1000);
  background(0);
  m = new Complex[taille_ecran][taille_ecran][2];
  m = mandelbrot(nb_iterations,o);
  trace(m,nb_iterations);



}

void draw() {
  background(0);
  o+=1;
  m = mandelbrot(nb_iterations,o);
  trace(m , nb_iterations);
}

public Complex[][][] mandelbrot(int n,float ordre_mandelbrot){
  
  Complex[][][] mb = new Complex[taille_ecran][taille_ecran][2];
  Complex[][] cst = new Complex[taille_ecran][taille_ecran];
  
  for(int i=0;i<taille_ecran;i++){
      for(int j = 0; j<taille_ecran ; j++){
        mb[i][j][0] =  new Complex( 0 , 0 ) ;
        cst[i][j]= new  Complex( (j-taille_ecran/2)*pas +point_zoom.re ,(i-taille_ecran/2)*pas+point_zoom.im ) ; 
        mb[i][j][1] = new Complex(0 , 0 );
      }
    }
  
  
    
    for (int l = 0 ; l< taille_ecran ; l++){
      for (int c = 0 ; c<taille_ecran ; c++) {
        int compt = 0;
        Complex e = mb[l][c][0];
        for (int i =0 ; i<n; i++){
          compt ++;
        
          if (e != null){
         
            e = e.power(ordre_mandelbrot);
            e = e.addition(cst[l][c]);
            if (e.module()>2) {e = null;}
          }  
        }
        
        mb[l][c][1] = new Complex(compt , 0 );
                      
      
      mb[l][c][0] = e;
      }
    }
   
 

  return mb;
  
}

void trace(Complex[][][] matrice,int n){
  
   loadPixels();
  
  for(int i = 0 ; i<taille_ecran ; i++){
    for (int j = 0 ; j<taille_ecran ; j++){
      Complex e = matrice[i][j][0];
      if(e != null){
        
        float b = sqrt((float) (matrice[i][j][1].module())/n); // (int)(255*(1-e.module()/2))
        float r =(int)(255*(1-e.module()/2));
        
        int posi = j + i * taille_ecran;
        pixels[posi] = color(0,r,255-b);

      }
      else{
        float b = sqrt((float) (matrice[i][j][1].module())/n); // (int)(255*(1-e.module()/2))
        int posi = j + i * taille_ecran;
        pixels[posi] = color(64-b/4,0,0);
      }
    }
  }
  updatePixels();
}
