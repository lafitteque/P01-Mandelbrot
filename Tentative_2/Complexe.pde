class complexe{
  float re;
  float im;
  
  
  complexe(float re,float im){
    this.re = re;
    this.im = im;
  }
  
  void val(){
    println(this.re, this.im);
  }
  
  complexe product (complexe z){
    float r = this.re*z.re - this.im*z.im;
    float i = this.re*z.im + z.re*this.im;
  return new complexe( r , i );
  }

  complexe addition(complexe z){
    return new complexe(this.re + z.re ,
                   z.im + this.im);
  }

  float module(){
    return pow( pow(this.re,2) +
                    pow(this.im,2) ,
                    0.5);
  }

  float arg(){
     return  (float) Math.atan2(this.im,this.re);
  }

  complexe power(float p){
    float mod = pow(pow(this.re,2) + pow(this.im,2),p*0.5);
    float angle = this.arg();
    angle = angle * p;
    //println(angle);
    return new complexe((float)mod*(float)Math.cos(angle) , (float)mod*(float)Math.sin(angle) );
  }


}
