//Posição e tamanho da bolinha
let xBolinha = 300;
let yBolinha = 200;
let diametro = 25;
let raio = diametro/2;

//velocidade da bolinha
let velocidadeXBolinha = 3;
let velocidadeYBolinha = 3;

//variáveis da raquete
let xRaquete = 5;
let yRaquete = 150;
let raqueteLargura = 10;
let raqueteAltura = 100;

// variaveis da raquete do oponente
let xRaqueteOponente = 585;
let yRaqueteOponente = 150;
let velocidadeYOponente = 5;

let colidiu = false;

//Pontuaçao
let meusPontos = 0;
let PontosOponente = 0;

function setup() {
  createCanvas(600, 400);
}

function draw() {
  background(0);
  mostraBolinha();
  movimentaBolinha();
  verificaBolinha();
  mostraRaquete();
  movimentaMinhaRaquete();
  verificaColisaoRaquete();
  colisaoRaqueteMinhaBiblioteca();
  mostraRaqueteOponente();
  verificaColisaoRaqueteOponente();
  movimentaRaqueteOponente ();
  incluirPlacar();
  marcaPontos ();
}
  
  function mostraBolinha(){
    fill("red");
  circle(xBolinha, yBolinha, diametro);
  }
  
  function movimentaBolinha(){
  xBolinha += velocidadeXBolinha;
  yBolinha += velocidadeYBolinha;
  }
  
  function verificaBolinha(){
  if (xBolinha + raio > width || xBolinha - raio < 0){
    velocidadeXBolinha *= -1;
  }
  if (yBolinha + raio > height || yBolinha - raio < 0){
    velocidadeYBolinha *= -1;
  }
  }
  
  function mostraRaquete(){
    fill("blue");
    rect(xRaquete, yRaquete, raqueteLargura, raqueteAltura, 20);
  }

function movimentaMinhaRaquete(){
  if(keyIsDown(UP_ARROW)){
    yRaquete -= 10;
  }
  if(keyIsDown(DOWN_ARROW)){
    yRaquete += 10;
  }
}

function verificaColisaoRaquete(){
 if (xBolinha - raio < xRaquete + raqueteLargura && yBolinha - raio < yRaquete + raqueteAltura && yBolinha + raio > yRaquete){
   velocidadeXBolinha *= -1;
 } 
}

  function  colisaoRaqueteMinhaBiblioteca(){
  collideRectCircle(200, 200, 100, 150, mouseX, mouseY, 100);  
  }

// desenha a raquete do oponente
function mostraRaqueteOponente (){
 fill ("green");
  rect ( xRaqueteOponente,  yRaqueteOponente,
       raqueteLargura, raqueteAltura, 20 ); 
}

  function movimentaRaqueteOponente (){
  velocidadeYOponente = yBolinha -
  yRaqueteOponente - raqueteLargura / 2;
  yRaqueteOponente += velocidadeYOponente  
  }

function verificaColisaoRaqueteOponente () {
  colidiu=
  collideRectCircle (xRaqueteOponente,yRaqueteOponente,
  raqueteLargura, raqueteAltura, xBolinha, yBolinha, raio);
  if (colidiu ==true){
    velocidadeXBolinha *= 1;
  }
}
function incluirPlacar (){
  fill("rgb(45, 229,61)");
  textSize(24);
  text ("Eu "+ meusPontos, 230, 26 );
  text ("Ele "+ PontosOponente, 330, 26 );
}

function marcaPontos (){
 if (xBolinha > 590) {
   meusPontos =+ 1;
 }
 if (xBolinha < 10){
   PontosOponente =+ 1;
 } 
  
  
  
}




