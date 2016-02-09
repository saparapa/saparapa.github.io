// Global variables
int itk = 0;

// Setup the Processing Canvas
void setup(){
  size(800, 800);
  frameRate(15);
}

var fisk = [];

// afgør hvilken farve fisken skal have
void fishColor(fX, fY) {
    var r = map(fX, 0, 800, 0, 255);
    var g = map(fY, 0, 800, 0, 255);
    return color(r, g, 150);
};

// egenskaber vores fisk har
Class Fish(fX, fY) {
    this.fX = fX;
    this.fY = fY;
    this.bColor = fishColor(fX, fY);
    this.bLength = 78 * map(fX, 0, 800, 0.5, 0.9);
    this.bHeight = 44 * map(fY, 0, 800, 0.7, 0.9);
    this.tWidth = this.bLength/4;
    this.tHeight = this.bHeight/2;
};

// tegner en fisk
void drawFish = function(f) {
    noStroke();
    // body
    fill(f.bColor);
    ellipse(f.fX, f.fY, f.bLength, f.bHeight);

    // tail
    triangle(f.fX - f.bLength/2, f.fY,
             f.fX - f.bLength/2 - f.tWidth, f.fY - f.tHeight,
             f.fX - f.bLength/2 - f.tWidth, f.fY + f.tHeight);

    // eye
    fill(33, 33, 33);
    ellipse(f.fX + f.bLength/4, f.fY, f.bHeight/5, f.bHeight/5);
    
};

// startskærm
void start() {
    background(89, 216, 255);
    for (var i = 0; i < 4; i++) {
        var fish = new Fish(50 + 90*i, random(50, 350));
        drawFish(fish);
        fisk.push(fish);
    }
    fill(191, 242, 245);
    textSize(18);
    textAlign(CENTER, CENTER);
    text("Tegn fisk ved at klikke med musen", 400, 380);
    text("Få dem til at svømme med højre piletast", 400, 420);
};

void draw() {
    if (itk === 0) {
        start();
        itk = 1;
     }
};


// får fiskene til at svømme
void keyPressed() {
    if (keyCode === RIGHT) {
        background(89, 216, 255);
        for (var i = 0; i < fisk.length; i++) {

            // fiskene svømmer rundt
            if (fisk[i].fX > 850) {
                fisk[i].fX = -40;
            } else {
                fisk[i].fX += 2;
            }
            
            // fiskene kan ikke svømme oven eller neden ud
            if (fisk[i].fY < -40) {
                fisk[i].fY = 840;
            } else if (fisk[i].fY > 840) {
                fisk[i].fY = -40;
            }
            // nogen fisk svømmer op andre ned
            if (i % 2 === 0) {
                fisk[i].fY += 1;
            } else {
                fisk[i].fY -= 1;
            }
            drawFish(fisk[i]);
        }
    }
};

// tilføjer nye fisk
void mousePressed() {
    var fish = new Fish(mouseX, mouseY);
    drawFish(fish);
    fisk.push(fish);
};         
