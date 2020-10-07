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
<title>Votre réservation</title>
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
    
  <section id="reservation">
    <div class="container">
        <center><h2>Récapatulatif :</h2></center> 
        <%
        	Reservation r = (Reservation)request.getAttribute("reservation");
        
        %>
        <div class="alert alert-primary" role="alert">
            Vous receverez un mail de confirmation à  l'addresse suivante : <% out.print(r.getEmail()); %>
        </div>
          <div class="row recap">
            <div class="col-sm">
              <p class="titile2">Nom: <% out.print(r.getNom()); %></p>
            </div>
            <div class="col-sm">
             <p class="titile2">Prenom: <% out.print(r.getPrenom());%></p>
              
            </div>
            <div class="col-sm">
                 <p class="titile2">Numero de réservation : <% out.print(r.getNumero()); %></p>
            </div>
            </div>
        
        <table class="table table-recap">
          <thead class="thead-dark">
            <tr>
              <th scope="col">Catégorie</th>
              <th scope="col">Nombre</th>
              <th scope="col">Total</th>
             
            </tr>
        </thead>
      <tbody>
      <%
     	List<Place> listePlace = (ArrayList<Place>)request.getAttribute("places");
      	float prixTotal = 0;
      
      for(Place p : listePlace){
    	  out.print("<tr>");
    	  out.print("<td>"+p.getTarif().getCat().getIntitule()+"</td>");
    	  out.print("<td>"+p.getNbPlace()+"</td>");
    	  out.print("<td>"+p.getTarif().getPrix()*p.getNbPlace() +" €</td>");
    	  out.print("</tr>");
    	  prixTotal += p.getTarif().getPrix()*p.getNbPlace();
      }
      
      %>
        <!--<tr>
          <td>Fausse A</td>
          <td>3</td>
          <td>130â¬</td>
        </tr>
          <tr>
          <td>Tribune A</td>
          <td>2</td>
          <td>130â¬</td>
        </tr>
    	-->
      </tbody>
            <thead class="thead-dark">
            <tr>
              <th scope="col"></th>
              <th scope="col"></th>
              <%
              	out.print("<th scope=\"col\">"+ prixTotal +" €</th>");
              %>
              
             
            </tr>
        </thead>
        </table>
 
        
        
        

<center><a href="./home"><button type="button" class="btn btn-light btn-comeback">Retourner Ã  l'accueil</button></a></center>
    </div>
    
 </section>
    
    
</body>
</html>