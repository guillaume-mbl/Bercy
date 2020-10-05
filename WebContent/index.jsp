<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MALAYIM'</title>
</head>
<body>
<link href="assets/css/styles.css" rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/typeit@7.0.4/dist/typeit.min.js"></script>
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script src="assets/js/script.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.0/css/all.css" integrity="sha384-OLYO0LymqQ+uHXELyx93kblK5YIS3B2ZfLGBmsJaUyor7CpMTBsahDHByqSuWW+q" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=PT+Sans&display=swap" rel="stylesheet"> 
<section id="header">
<div class="container">
  <div class="row">
    <div class="col-sm">
    <div class="contact">
	    <p class="text-left"><i class="fas fa-phone"></i> 02 43 40 70 00</p>
	    <p class="text-left"><i class="fas fa-ticket-alt"></i> 09 70 25 22 12</p>
	    <p class="text-left"><i class="fas fa-envelope"></i> info@antareslemans.com </p>		  
    </div>
    </div>
    <div class="col-sm">
      <img src="assets/img/logo.png" class="img-fluid" alt="Responsive image">
    </div>
    <div class="col-sm text-center" style="vertical-align: middle;">
      	<i class="fab fa-facebook-square fa-lg"></i>
		<i class="fab fa-twitter-square fa-lg"></i>
    </div>
  </div>
		

</div>


</section>
<ul class="nav first-nav justify-content-center">
  <li class="nav-item">
    <a class="nav-link active" href="#">Accueil</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#concert">Programmation</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#concert-hall">La salle</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="#informations">Infos pratiques</a>
  </li>
</ul>

<section id="news">
<div class="container">
<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="assets/img/bande_organisee.jpg" class="d-block " alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>First slide label</h5>
        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="assets/img/freeze.jpg" class="d-block w-70" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Second slide label</h5>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="assets/img/alain.jpg" class="d-block " alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Third slide label</h5>
        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
</section>
<section id="concert">
	<div class="container">
	<div class="label-concert">
		<h3>A l'Affiche</h3>
	</div>
	<div class="filter">
	
		<ul class="nav  justify-content-center">
		  <li class="nav-item">
		    <a class="nav-link active" href="#">Tous</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Concert</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">Spectacle</a>
		  </li>
		   <li class="nav-item">
		    <a class="nav-link" href="#">BasketBall</a>
		  </li>
		  <form class="form-inline">
			    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
			    <a href="#"><i class="fas fa-search"></i></a>
  		 </form>
		</ul>
	</div>
    
  
	<div data-aos="fade-up">
	<div class="row">
	  <div class="col-md-3">	  
	  <a href="#">
	  	<div class="card">
		  <img class="card-img-top" src="assets/img/bande_organisee.jpg" alt="Card image cap">
		  	<div class="card-body">
		  		<div class="concert-title">La Bande Organisée tour</div>
		    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	  			<div class="state">
	  				<a href="#" class="btn-state more-info" data-toggle="modal" data-target=".bd-example-modal-lg">Plus d'infos</a>
	  			</div>
	  		</div>
		</div>
		</a>
	  </div>
	  
	  
	  
	  <div class="col-md-3">
	  	 <a href="#">
	  	<div class="card">
		  <img class="card-img-top" src="assets/img/freeze.jpg" alt="Card image cap">
		  	<div class="card-body">
		  		<div class="concert-title">Freeze corleone</div>
		    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  				<div class="state">
	  				<a href="#" class="btn-state report">Reporte</a>
	  			</div>
	  		</div>
		</div>
		</a>
		
	  </div>
	  <div class="col-md-3">
	  	 <a href="#">
	  	<div class="card">
		  <img class="card-img-top" src="assets/img/alain.jpg" alt="Card image cap">
		  	<div class="card-body">
		    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				<div class="state">
	  				<a href="#" class="btn-state more-info">Plus d'infos</a>
	  			</div>
	  		</div>
		</div>
		</a>
	  </div>
	  <div class="col-md-3">
	  	 <a href="#">
	  	<div class="card">
		  <img class="card-img-top" src="assets/img/michel.jpg" alt="Card image cap">
		  	<div class="card-body">
		    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  				<div class="state">
	  				<a href="#" class="btn-state complet">Complet</a>
  				</div>
	  		</div>
		</div>
		</a>
	  </div>
	    <div class="col-md-3">
	  	 <a href="#">
	  	<div class="card">
		  <img class="card-img-top" src="assets/img/icon.png" alt="Card image cap">
		  	<div class="card-body">
		    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  			<div class="state">
	  			<a href="#" class="btn-state warn">M'alerté !</a>
	  		</div>	
	  		</div>
		</div>
		</a>
	  </div>
	      <div class="col-md-3">
	  	 <a href="#">
	  	<div class="card">
		  <img class="card-img-top" src="assets/img/icon.png" alt="Card image cap">
		  	<div class="card-body">
		    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	  			<div class="state">
	  				<a href="#" class="btn-state warn">M'alerté !</a>
	  			</div>	
	  		</div>
		</div>
		</a>
	  </div>
	      <div class="col-md-3">
	  	 <a href="#">
	  	<div class="card">
		  <img class="card-img-top" src="assets/img/icon.png" alt="Card image cap">
		  	<div class="card-body">
		    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	  			<div class="state">
	  				<a href="#" class="btn-state warn">M'alerté !</a>
	  			</div>
	  		</div>
		</div>
		</a>
	  </div>
	    <div class="col-md-3">
	  	 <a href="#" >
	  	<div class="card">
		  <img class="card-img-top" src="assets/img/icon.png" alt="Card image cap">
		  	<div class="card-body">
		    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  				<div class="state">
	  				<a href="#" class="btn-state warn">M'alerté !</a>
	  			</div>
	  		</div>
		</div>
		</a>
	  </div>
	</div>

	</div>
</section>
<section id="concert-hall">
<div class="container">
	<div class="label-hall">
		<h3>La salle</h3>
	</div>
	<div class="row">
    <div class="col">
      Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
    </div>
    <div class="col">
  <img src="assets/img/salle.jpg" alt="error">
    </div>
</div>
</section>
<section id="informations">
<div class="container">
	<div class="label-informations">
		<h3>Infos pratiques</h3>
	</div>
</div>
</section>
/************************* MODAL CONCERT ********************************************/
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      ...
    </div>
  </div>
</div>
/************************************************************************************/
</body>
</html>