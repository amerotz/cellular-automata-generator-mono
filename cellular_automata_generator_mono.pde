int rules[];
int current[], prev[];
int it = 0;
int maxConf, maxRules;
color colors[];
int stateNum = 2;
final int W = 80;
final int H = 80;

void setup(){
  size(800, 800);
  current = new int[W];
  prev = new int[W];
  init();
}

void draw(){
  if(it < H){
    
    for(int i = 1; i < W-1; i++)
      current[i] = state(prev[wrap(i-1)], prev[wrap(i)], prev[wrap(i+1)]);
    
    show();
    
    prev = current.clone();
    it++;
  }
  if(keyPressed){
    it = 0;
    init();
  }
}

int wrap(int n){
  return (W + n)%W;
}

void show(){
  stroke(0, 0);
  noStroke();
  for(int x = 0; x < W; x++){
    fill(getColor(current[x]));
    rect(width*x/(float)W, height*it/(float)H, width/(float)W, height/(float)H);
  }
}

void showPixels(){
  loadPixels();
  for(int x = 0; x < width; x++){
    pixels[it*width + x] = color(current[x]*255.0/(stateNum-1));
  }
  updatePixels();
}

color getColor(int n){
  return colors[n];
}

void init(){
  randomSeed(millis());
  stateNum = (int)random(2, 5);
  colors = new color[stateNum];
  maxConf = (int)pow(stateNum, 3);
  maxRules = (int) pow(stateNum, maxConf);
  rules = newRule();
  for(int i = 0; i < W; i++) prev[i] = (int) random(stateNum);
  for(int i = 0; i < stateNum; i++) colors[i] = color(random(255), random(255), random(255));
}

int state(int a, int b, int c){
  String s = "" + a + b + c;
  int n = Integer.parseInt(s, stateNum);
  return rules[n];
}

int[] newRule(){
  int r[] = new int[maxConf];
  for(int i = 0; i < maxConf; i++) {
    r[i] = (int) random(stateNum);
  }
  return r;
}
