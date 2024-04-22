<%-- 
    Document   : index
    Created on : Apr 11, 2024, 2:33:42 PM
    Author     : APC
--%>

<%@page import="g2.topicTbl.topicDAO"%>
<%@page import="g2.topicTbl.topicDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="myStyle.css">
        <script src="https://kit.fontawesome.com/aed3462b10.js" crossorigin="anonymous"></script>
        <title>Home Page</title>
    </head>
    <body>
        <header>
            <div id="header">
                <h1>G2 Forum Web</h1>
                <p></p>
            </div>
            <nav id="menu">
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href=""></a></li>
                    <li><a href=""></a></li>
                    <li><a href="signup.jsp">Sign-up</a></li>
                    <li><a href="login.jsp">Login</a>
                    </li>
                </ul>
                <ul>
                    <div id="createPost">
                        <!--Create post,vote -->
                    </div>
                    <div class="search-container">
                        <form action="MainController" method="GET">
                            <input type="text" placeholder="user"
                                   name="txtSearchUser"/>
                            <button type="submit" name="btAction" value="Search_User"><i class="fa fa-search"></i></button>
                        </form>
                        <form action="MainController" method="GET">
                            <input type="text" placeholder="topic" 
                                   name="txtSearchTopic"/>
                            <button type="submit" name="btAction" value="Search_Topic"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </ul>
            </nav>
        </header>
        <div id="body">
            <div id="postTable">

            </div>
            <div id="topicTable">
                <%
                    if (request.getParameter("txtSearchTopic") != null) {
                        List<topicDTO> list_topic = (List<topicDTO>) request.getAttribute("TOPICS");
                        if (list_topic != null && list_topic.size() > 0) {
                %>
                <table border="1">
                    <%
                        for (topicDTO t : list_topic) {
                    %>
                    <thead>
                        <tr>
                            <th><%= t.getTitle()%></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Read more</td>
                        </tr>
                    </tbody>
                    <%
                        };
                    %>
                </table>
                <%
                    }
                } else {
                    topicDAO t_dao = new topicDAO();
                    List<topicDTO> list_topic = null;
//(List<topicDTO>) t_dao.getTopicData();
                    if (list_topic != null && list_topic.size() > 0) {
                %>
                <table border="1">
                    <%
                        for (topicDTO t : list_topic) {
                    %>
                    <thead>
                        <tr>
                            <th><%= t.getTitle()%></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Read more</td>
                        </tr>
                    </tbody>
                    <%
                        };
                    %>
                </table>

                <%
                        }
                    }
                %>
            </div>
        </div>
        <footer>
            <div id="footer">
                <h6>G2 Forum Web</h6>
                <h6><a href="home.jsp">Github</a></h6>
            </div>
        </footer>
    </body>
</html>
