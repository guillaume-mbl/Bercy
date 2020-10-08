<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.util.CompareGenerator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	    <p class="text-left"><i class="fas fa-envelope"></i> info@malayim.com </p>		  
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
    <a class="nav-link" href="./home">Accueil</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./home#concert">Programmation</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="./home#concert-hall">La salle</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="./home#informations">Infos pratiques</a>
  </li>
</ul>


<div class="container fiche rounded mt-3">
	
	<%
		Concert c = (Concert)request.getAttribute("Concert");
	

		boolean estReservable = c.getEtat().getIntitule().equalsIgnoreCase("DISPONIBLE");
		
		if(estReservable){
		out.print("<img class=\"img-fluid rounded mt-3 mb-3\" src=\""+c.getCheminImage()+"\" />");
		out.print("<h5>"+c.getIntitule()+"</h5>");
		out.print("<p>"+c.getDescription()+"</p>");
		
	%>
	
	<hr />

	<form class="mt-3" method="post">
		<table class="table table-dark text-center">
			<thead>
				<tr>
					<th scope="col">Cat&eacute;gorie</th>
					<th scope="col">Prix/place</th>
					<th scope="col">Places</th>
				</tr>
			</thead>
			<tbody>
			
			<%
				List<Tarif> listTarifs = (ArrayList<Tarif>)request.getAttribute("Tarifs");
				int maxPlace=10;
				out.print("<input type=\"hidden\" class=\"form-control\" id=\"idConcert\" placeholder=\"ID\" name=\"idConcert\" value=\""+
		      			c.getId()+"\" readonly>");
				
				for(Tarif t : listTarifs){
					if(t.getRestant()>0){
						out.print("<tr>");
						out.print("<td>"+t.getCat().getIntitule()+"</td>");
						out.print("<td>"+t.getPrix()+" &euro;</td>");
						out.print("<td>");
						out.print("<select class=\"form-control\" required name=\""+c.getId()+"_"+t.getCat().getIntitule()+"\">");
						if(t.getRestant()<10){
							maxPlace = t.getRestant();
						}
						for(int i=0;i<=maxPlace;i++){
							out.print("<option value=\""+i+"\">"+i+"</option>");
						}
						out.print("</select>");
						out.print("</td></tr>");
					}
					
				}
			
			%>
				
			</tbody>
		</table>

		<hr />

		<div class="form-group">
			<label for="prenom">PRENOM</label>
			<input type="text" id="prenom" name="prenom" required class="form-control" />
		</div>

		<div class="form-group">
			<label for="nom">NOM</label>
			<input type="text" id="nom" name="nom" required class="form-control" />
		</div>

		<div class="form-group">
			<label for="email">EMAIL</label>
			<input type="email" id="email" name="email" required class="form-control" />
		</div>

		<button type="submit" name="submit" class="btn btn-primary mb-3">RESERVER</button>
	</form>
	<%
		}
	%>
	
		
	
</div>


</body>
</html>