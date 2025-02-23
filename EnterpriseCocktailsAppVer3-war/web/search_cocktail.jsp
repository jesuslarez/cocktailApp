<%-- 
    Document   : search_cocktail
    Created on : 18-Mar-2021, 12:02:34
    Author     : Jesus Larez
--%>

<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

        <title>Search Cocktail</title>
    <div class="p-3 mb-2 bg-primary text-white"><h1>Cocktail App</h1></div>

</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link" href="main.jsp">Home</a>
                    <a class="nav-link" href="favourite_list.jsp">Favourite Cocktails</a>                 
                    <a class="nav-link" href="favourite_bar_list.jsp">Favourite Bars</a>
                    <a class="nav-link" href="index.jsp">Log Out</a>
                </div>
            </div>
        </div>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <h2> Cocktails list </h2>
    <%
        List<Cocktail> result = (List) session.getAttribute("cocktailResults");
        String ingredient1 = (String) session.getAttribute("ingredient1");
        String ingredient2 = (String) session.getAttribute("ingredient2");
        int start = (int) session.getAttribute("start");
        String name = "";
        for (Cocktail cocktail : result) {
            name = cocktail.getName();
    %> 
    <ul>
        <form action=FrontController>
            <input type="hidden" value = "<%= name%>" name="cocktailName">
            <input type="hidden" name="command" value="CmdViewCocktail">
            <input type="submit" class="btn btn-info" value = "<%= name%>" > 
        </form> 
    </ul> <%
        }
    %>
    <form action=FrontController>
        <input type="hidden" name="command" value="CmdOrderByName">
        <input type="submit" class="btn btn-secondary" value = "Sort By name" > 
    </form>
    <br>
    <nav aria-label="...">
        <ul class="pagination">
            <li class="page-item">
                <form action="FrontController">
                    <input type="hidden" name="command" value="CmdSearchCocktail">
                    <input type="hidden" name="ingredient1" value="<%= ingredient1%>"> 
                    <input type="hidden" name="ingredient2" value="<%= ingredient2%>"> 
                    <input type="hidden" name="start" value=<%= (start-5)%>> 
                    <input type="submit" class="page-link" value="Previous">
                </form>
            </li>
            <li class="page-item">
                <form action="FrontController">
                    <input type="hidden" name="command" value="CmdSearchCocktail">
                    <input type="hidden" name="ingredient1" value="<%= ingredient1%>"> 
                    <input type="hidden" name="ingredient2" value="<%= ingredient2%>"> 
                    <input type="hidden" name="start" value="0"> 
                    <input type="submit" class="page-link" value="1">
                </form>
            <li class="page-item">
                <form action="FrontController">
                    <input type="hidden" name="command" value="CmdSearchCocktail">
                    <input type="hidden" name="ingredient1" value="<%= ingredient1%>"> 
                    <input type="hidden" name="ingredient2" value="<%= ingredient2%>"> 
                    <input type="hidden" name="start" value="5"> 
                    <input type="submit" class="page-link" value="2">
                </form>
            </li>
            <li class="page-item">
                <form action="FrontController">
                    <input type="hidden" name="command" value="CmdSearchCocktail">
                    <input type="hidden" name="ingredient1" value="<%= ingredient1%>"> 
                    <input type="hidden" name="ingredient2" value="<%= ingredient2%>"> 
                    <input type="hidden" name="start" value="10"> 
                    <input type="submit" class="page-link" value="3">
                </form>
            </li>
            <li class="page-item">
                <form action="FrontController">
                    <input type="hidden" name="command" value="CmdSearchCocktail">
                    <input type="hidden" name="ingredient1" value="<%= ingredient1%>"> 
                    <input type="hidden" name="ingredient2" value="<%= ingredient2%>"> 
                    <input type="hidden" name="start" value=<%= (start+5)%>> 
                    <input type="submit" class="page-link" value="Next">
                </form>
            </li>
        </ul>
    </nav>
    <footer class="bg-light text-center text-lg-start">
        <!-- Copyright -->
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
            © 2021 Copyright: Cocktails App by Jesus Larez
        </div>
        <!-- Copyright -->
    </footer>
</body>
</html>
