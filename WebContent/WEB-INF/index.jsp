<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.util.CompareGenerator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.Bercy.Beans.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <%
  		List<Concert> list = (ArrayList<Concert>)request.getAttribute("listeConcerts");
		
  	
  	if (list != null){
  		int i = 1;
  		for(Concert c: list){
  			if( i == 1){
  	  			out.print("<div class=\"carousel-item active\">");
  			}else{
  				out.print("<div class=\"carousel-item\">");
  			}
  			out.print("<img src="+ c.getCheminImage() + " class=\"d-block \" alt=\"...\">");
  			out.print("<div class=\"carousel-caption d-none d-md-block\">");
  			out.print("<h5>" + c.getIntitule() + "</h5>");
  			out.print("<p>"+c.getDescription()+"</p>");
  			out.print("</div>");
  			out.print("</div>");
  			
  			i+=1;
  			if(i == 4){
  				break;
  			}
		}
  	}
  	%>
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
	<%
			SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd/MM/yyyy");
	
	  		if (list != null){
	  	  		int i = 1;
	  	  		for(Concert c: list){
	  	  			out.print("<div class=\"col-md-3\">");
	  	  			out.print("<div class=\"card\" id="+c.getId()+" data-toggle=\"modal\" data-target=\"#modalInfos"+c.getId()+"\" >");
	  	  			out.print("<img class=\"card-img-top\" src="+c.getCheminImage()+" alt=\"Card image cap\">");
	  	  			out.print("<div class=\"card-body\">");
		  	  		out.print("<div class=\"concert-title\">"+c.getIntitule()+"</div>");
		  	  	
		  	  				  	  		
			  	  	out.print("<div class=\"concert-date\"><p class=\"card-text\">Le "+c.getDate()+" à " +c.getHeure()+"</p></div>");
			  	  	out.print("<div class=\"state\">");
			  	  	if( c.getEtat().getIntitule().equalsIgnoreCase("OUVERT") == true){
			  	  		out.print("<a href=\"#\" class=\"btn-state more-info\">PLUS D'INFOS</a>");
				  	}else if (c.getEtat().getIntitule().equalsIgnoreCase("REPORTE") == false){
				  		out.print("<a href=\"#\" class=\"btn-state report\">"+c.getEtat().getIntitule()+"</a>");
				  	}else if (c.getEtat().getIntitule().equalsIgnoreCase("COMPLET") == false){
				  		out.print("<a href=\"#\" class=\"btn-state complet\">"+c.getEtat().getIntitule()+"</a>");
			  	  	}
				  	out.print("</div>");
				  	out.print("</div>");
				  	out.print("</div>");
				  	out.print("</div>");
	  	  		}
	  		}
	  
	  		%> 
	
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
    
<div data-aos="fade-right">
    
      Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.
    </div>
    </div>
	
    	<div class="col">
    		<div data-aos="fade-left">
  				<img src="assets/img/salle.jpg" class="rounded" alt="error">
    		</div>
    </div>
</div>
</section>
<section id="informations">
<div class="container">
	<div class="label-informations">
		<h3>Infos pratiques</h3>
	</div>
	<div class="informations-content">
	 <p>Compte tenu des informations communiquées par les autorités sanitaires, retrouvez ci-dessous ou dans la rubrique "actualités" (cliquez ici) toutes les informations actualisées concernant le report ou l'annulation de spectacle.</p>
	</div>
</div>
</section>
<!---------------------------------------------  MODAL CONCERT ---------------------------------->
<%
	List<Tarif> listePrix = (ArrayList<Tarif>)request.getAttribute("listePrix");
	
	for(Concert c : list){
		out.print("<div class=\"modal fade bd-example-modal-lg\" id=\"modalInfos"+c.getId()+"\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myLargeModalLabel\" aria-hidden=\"true\">+"+
		"<div class=\"modal-dialog modal-lg\">"+
	    "<div class=\"modal-content\">"+
	    "<div class=\"modal-header\">");
		out.print("<h5 class=\"modal-title\"><div class=\"concert-title\">"+c.getIntitule()+"</div></h5>");
		out.print("<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">"+
		          "<span aria-hidden=\"true\">&times;</span>"+
		          "</button>"+
		          "</div>");
		out.print("<img src=\""+c.getCheminImage()+"\" class=\"img-fluid\" alt=\"Responsive image\">");
		out.print("<div class=\"body-content-modal\">");
		out.print("<p>"+c.getDescription()+"</p");
		out.print("<div class=\"row\">");
		out.print("<div class=\"layout-detail rounded\">");
		out.print("<div class=\"title-detail\">Tarif :</div>");
		out.print("<div class=\"row\">");
		out.print("<div class=\"row\">");
		
		System.out.println("ok"+c.getId());
		if(listePrix != null){

			for(Tarif t : listePrix){
				
				if(t.getConcert().getId() == c.getId()){
					out.print("<div class=\"content-detail\">"+
							 "<div class=\"row\">"+
					 		"A partir de :"+
					 			t.getPrix() + " euros"+
				 			"</div>"+
							"</div>");
				}
				
			}
		
		}
		out.print("<div class=\"title-detail\">Date :</div>"+
		 "<div class=\"content-detail\">"+
			 "<div class=\"row\">"+
				 "Le " + c.getDate() +
			 "</div>"+
		 "</div>"+
		 "</div>"+
		 "</div>");
		
		
		out.print("<div class=\"col\">"+
			    "<div class=\"layout-detail rounded\">"+
	     "<div class=\"title-detail\">Ecouter le dernier album :</div>"+
			    "<div class=\"content-detail\">"+
				 "<div class=\"row\">");
		System.out.println(c.getUrlAlbum());
		out.print("<a href=\""+c.getUrlAlbum()+"\"<i class=\"fab fa-spotify\">"+
				"</i></a>"+
				 "</div>");
		
		out.print("</div>"+
				   "<div class=\"title-detail\">Artiste(s) :</div>"+
				   "<div class=\"content-detail artistt\">"+
				   	"<span class=\"badge badge-info artist\">Artiste1</span><span class=\"badge badge-info\">Artiste2</span>"+
				"</div>"+
				"</div>"+
 				"</div>");
		
		out.print("</div>"+
				"<div class=\"modal-footer\">"+
				"<a href=\"./reserver?id="+c.getId()+"\""+
	        	"<button type=\"button\" class=\"btn-reservation btn btn-primary\">Reserver</button>"+
				"</a>"+
		      	"</div>"+
		    	"</div>"+
		  		"</div>"+
				"</div>"+
				"</div>");
		
	}

%>
<!-- 
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <div class="modal-header">
        <h5 class="modal-title"><div class="concert-title">La Bande Organisée tour</div></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      	<img src="assets/img/bande_organisee.jpg" class="img-fluid" alt="Responsive image">
      	<div class="body-content-modal">
     		 <p>Le phénomène marseillais Bande Organisée continue de tout rafler sur son passage et les premiers certifications commencent à tomber. 
			 En effet, ll n'aura fallu que 25 jours aux rappeurs marseillais présents sur le titre de Jul Bande Organisé pour cumuler 30 millions de streams et ainsi décrocher la certification disque de platine. Rien que sur Youtube, le clip réunissant Sch, Kofs, Jul, Naps, Soso maness, Elams, Solda et Houari a été regardé plus de 47 millions de fois. La semaine dernière, les marseillais se sont même payés le luxe de squatter le top 100 monde Spotify. Selon Midi/Minuit, c'est la première fois dans le rap français qu'un single est certifié platine aussi rapidement devant Lettre à Une Femme de Ninho et Au DD de PNL.</p>
			 <div class="row">
    <div class="col">
      <div class="layout-detail rounded">
				 <div class="title-detail">Tarif :</div>
				 <div class="content-detail">
					 <div class="row">
						 A partir de :
						 56 euros	
					 </div>
				 </div>
				 
		 		 <div class="title-detail">Date :</div>
		 		 <div class="content-detail">
					 <div class="row">
						 Le 24/11/2020
					 </div>
				 </div>
				 
			</div>
    </div>
    <div class="col">
    <div class="layout-detail rounded">
     <div class="title-detail">Ecouter le dernier album :</div>
		 		 <div class="content-detail">
					 <div class="row">
						 <a href="https://open.spotify.com/album/3FrSGEYwEQS2Qx9nPt5WUs?si=ZIVjLpwMS-WkKvZq_6GSIg"><i class="fab fa-spotify">
				</i></a>
					 </div>
				 </div>
				   <div class="title-detail">Artiste(s) :</div>
				   <div class="content-detail artistt">
				   	<span class="badge badge-info artist">Jul</span><span class="badge badge-info">Naps</span>
				</div>
				</div>
    </div>

		</div>
		<div class="modal-footer">
        	<button type="button" class="btn-reservation btn btn-primary">Reserver</button>
      	</div>
    </div>
  </div>
</div>
</div>
-->
<div class="footer">
	<div class="container-fluid">
	<div class="container">
	  <div class="row">
	   
      <div class="col-sm">
	      
	      <div class="footer-logo">
	      	  <p>malayim'</p>
		    
		   </div>	
	    </div>
	    <div class="col-sm">
	     <table class="table table-borderless">
  			<thead>
		  	</thead>
		  <tbody>
		    <tr>
		      <td><a href="">Programmation</a></td>
		    </tr>
		    <tr>	     
		      <td><a href="">La salle</a></td>
		    </tr>
		    <tr>	     
		      <td><a href="">Infos pratiques</a></td>
		    </tr>
		  </tbody>
		</table>
	    </div>
	    <div class="col-sm">
	      <div class="row">
	      <div class="footer-social-network ">
	      	  <p>suivez-nous !</p>
		      <i class="fab fa-facebook-f"></i>
		      <i class="fab fa-twitter"></i>
		   </div>	
	      </div>
	    </div>
  </div>
</div>
			 
	</div>
</div>



</body>
</html></html>