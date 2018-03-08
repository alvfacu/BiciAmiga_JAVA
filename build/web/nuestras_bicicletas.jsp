<!DOCTYPE html>


  <head>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BiciAmiga - Rosario</title>

    <!-- Bootstrap core CSS -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/business-casual.min.css" rel="stylesheet">

    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
  </head>

  <body>
    <!-- Navigation -->
    <%@include file="nav_bar.jsp"%>

    <!-- Body -->
    <br>
    <h1 class="site-heading text-center text-white d d-lg-block">
      <span class="site-heading-upper text-primary mb-3">Nuestras bicis</span>
    </h1>

    <!-- PLAYERA -->
    <section class="page-section">
      <div class="container">   
        <div class="product-item">
          <div class="product-item-title d-flex" >
            <div class="bg-bicis p-4 d-flex mr-auto rounded border" >
              <h2 class="section-heading mb-0">
                <span class="section-heading-upper">Bicicleta</span>
                <span class="section-heading-lower">Playera</span>
              </h2>
            </div>
          </div>
          <div id="slider">
            <div class="slides">
              <div class="slider">
                <div class="product-item-img rounded img-fluid  image">
                  <img src="https://images-na.ssl-images-amazon.com/images/I/81Rp-NDfhBL._SL1500_.jpg" onload="resizeImg(this, 750, 450);">
                </div>
              </div>
              <div class="slider">
                <div class="product-item-img rounded img-fluid  image">
                  <img src="https://images-na.ssl-images-amazon.com/images/I/81zodE3jnTL._SL1500_.jpg" onload="resizeImg(this, 750, 450);">
                </div>
              </div>
              <div class="slider">
                <div class="product-item-img rounded img-fluid  image">
                  <img src="https://images-na.ssl-images-amazon.com/images/I/81t3Q%2BEpXjL._SL1500_.jpg" onload="resizeImg(this, 200, 100);">
                </div>
              </div>
              <div class="slider">
                <div class=" product-item-img rounded img-fluid image">
                  <img src="https://images-na.ssl-images-amazon.com/images/I/713PdMAMglL._SL1500_.jpg" onload="resizeImg(this, 200, 100);">
                </div>
              </div>              
            </div>
          </div>
          <div class="product-item-description d-flex ml-auto border">
            <div class="bg-bicis p-4 rounded">
              <p class="mb-0">We take pride in our work, and it shows. Every time you order a beverage from us, we guarantee that it will be an experience worth having. Whether it's our world famous Venezuelan Cappuccino, a refreshing iced herbal tea, or something as simple as a cup of speciality sourced black coffee, you will be coming back for more.</p>              
              <br>
              <div>
                <a class="btn btn-reserva btn-xl bg-faded" style="color:#040404; float: right" href="reservar.jsp">¡Reservala!</a>
              </div>              
            </div>
          </div>
        </div>        
      </div>
    </section>
    <!-- MOUNTAIN -->
    <section class="page-section">
      <div class="container">
        <div class="product-item">
          <div class="product-item-title d-flex">
            <div class="bg-bicis p-4 d-flex mr-auto rounded border" style="float:left;">
              <h2 class="section-heading mb-0">
                <span class="section-heading-upper">Bicicleta</span>
                <span class="section-heading-lower">Mountain Bike</span>
              </h2>
            </div>
          </div>
          <div id="slider">
            <div class="slides">
              <div class="slider">
                <div class="product-item-img rounded img-fluid  image">
                  <img src="img/mountain/mountain_full_1.jpg">
                </div>
              </div>
              <div class="slider">
                <div class="product-item-img rounded img-fluid  image">
                  <img src="img/mountain/mountain_full_2.jpg">
                </div>
              </div>
              <div class="slider">
                <div class="product-item-img rounded img-fluid  image">
                  <img src="img/mountain/mountain_full_7.jpg">
                </div>
              </div>
              <div class="slider">
                <div class=" product-item-img rounded img-fluid image">
                  <img src="img/mountain/mountain_full_9.jpg">
                </div>
              </div>              
            </div>
          </div>
          <div class="product-item-description d-flex ml-auto">
            <div class="bg-bicis p-4 rounded border">
              <p class="mb-0">Our seasonal menu features delicious snacks, baked goods, and even full meals perfect for breakfast or lunchtime. We source our ingredients from local, oragnic farms whenever possible, alongside premium vendors for specialty goods.</p>
              <br>
              <div>
                <a class="btn btn-reserva btn-xl bg-faded" style="color:#040404; float: right" href="reservar.jsp">¡Reservala!</a>
              </div> 
            </div>
          </div>
        </div>
      </div>
    </section>    
    <!-- DOBLE -->
    <section class="page-section">
      <div class="container">
        <div class="product-item">
          <div class="product-item-title d-flex">
            <div class="bg-bicis p-4 d-flex mr-auto rounded border" style="float:left;">
              <h2 class="section-heading mb-0">
                <span class="section-heading-upper">Bicicleta</span>
                <span class="section-heading-lower">Doble</span>
              </h2>
            </div>
          </div>
          <img class="product-item-img mx-auto d-flex rounded img-fluid mb-2 mt-2 mb-lg-0 border" src="img/doble/doble_full.jpg" alt="">
          <div class="product-item-description d-flex ml-auto border">
            <div class="bg-bicis p-4 rounded">
              <p class="mb-0">Travelling the world for the very best quality coffee is something take pride in. When you visit us, you'll always find new blends from around the world, mainly from regions in Central and South America. We sell our blends in smaller to large bulk quantities. Please visit us in person for more details.</p>
              <br>
              <div>
                <a class="btn btn-reserva btn-xl bg-faded" style="color:#040404; float: right" href="reservar.jsp">¡Reservala!</a>
              </div> 
            </div>
          </div>          
        </div>
      </div>
    </section>

    <!-- Footer -->
    <%@include file="footer.jsp"%>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
