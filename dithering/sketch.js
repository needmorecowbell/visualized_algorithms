let img;
let dithermap;

function preload(){
  img= loadImage('assets/bettywhite.jpg');
}

function setup(){
  img.loadPixels();
 // dithermap= get_dither_map();

  createCanvas(img.width, img.height);
}

function draw(){
  background(0);
  image(img,0,0);
  stroke('purple'); // Change the color
  strokeWeight(10); // Make the points 10 pixels in size
  point(85, 75);
  point(30, 75);
}

function get_dither_map(){
  console.log("Getting dithermap");
  for (let x = 0; x < img.pixels.length; x++) {
    console.log("entered for loop");
    for (let y = 0; y < img.pixels[x].length; y++) {
      console.log(img.pixels[x][y]);
    }
    const element = img.pixels[x];
    
  }
}
