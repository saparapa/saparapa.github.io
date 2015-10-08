// Global variables
float radius = 50.0;
int X, Y;
int nX, nY;
int delay = 16;

// Setup the Processing Canvas
void setup(){
  size(400, 400);
  strokeWeight(10);
  frameRate(15);
  X = width / 2;
  Y = height / 2;
  nX = X;
  nY = Y;  
}


var xPositions = [0];
var yPositions = [0];
var type = [0];

// fylder listen med elementer med styrede førstekoordinater og tilfældige andenkoordinater, samt giver elementer en type 
for(var r = 0; r < 400; r += 30) {
    xPositions.push(r);
    yPositions.push(10 + random(-200, 200));
        if(r < 200) {
            type.push(0);
        } else if (r < 400) {
            type.push(1);
        }
}

// tegner elementerne 
void draw(){
    background(204, 247, 255);

    for(var s = 0; s < xPositions.length; s++) {
        noStroke();
        fill(255,255,255);
        if (type[s] === 0) {
            ellipse(xPositions[s], yPositions[s], 15, 15);
        } else {
            fill(random(0,255),random(0,255),random(0,255));
            ellipse(xPositions[s],yPositions[s],5,15);
        }
        yPositions[s] += 5;
        if (yPositions[s] > 400) {
            yPositions[s] = 0;
        }
    }    
    
}

void mousePressed() {
    if (mousePressed) {
        xPositions.push(mouseX);
        yPositions.push(mouseY);
        if(mouseX < 200){
            type.push(1);
        } else if(mouseY < 400) {
            type.push(0);
        }
    }
}

