<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%
    //String connectionURL = "jdbc:postgresql://localhost:5432/university";
    String connectionURL =
            "jdbc:postgresql://class-db.cs.fiu.edu:5432/spr18_dcarl023?user=spr18_dcarl023&password=5964076";
    Connection connection = null;
    Statement statement = null;
    ResultSet rs = null;

%>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js" integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="webapp/js/main.js" type="text/javascript"></script>
<head>
    <title>University Faculty</title>
</head>
<body>
<div class="container">

    <nav class="nav">
        <a class="nav-link" href="account.html">Back to Dashboard</a>
    </nav>

    <div class="row justify-content-center" style="padding: 30px 0px; ">
        <h1>Faculty Database</h1>
    </div>
    <input type="text" class="form-control col-3" id="search" onkeyup="searchFunction()" placeholder="Search for faculty name" title="Type in a name">
    <!--table to display data begins-->
    <table id="newTable" class="table table-bordered">
        <thead>
            <th class="" scope="col">Faculty Id</th>
            <th class="" scope="col">Name</th>
            <th class="" scope="col">Date of Birth</th>
            <th class="" scope="col">Address</th>
            <th class="" scope="col">Email</th>
            <th class="" scope="col">Level</th>
            <th scope="col"></th>
        </thead>
        <tbody>


        <%
            Class.forName("org.postgresql.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            statement = connection.createStatement();
            rs = statement.executeQuery("SELECT * FROM faculties");



            while( rs.next() ){
        %>
        <tr>
            <th class="faculty_id" scope="row"><% out.println(rs.getString("faculty_id")); %></th>
            <td class=""><% out.println(rs.getString("name")); %></td>
            <td class=""><% out.println(rs.getString("date_of_birth")); %></td>
            <td class=""><% out.println(rs.getString("address")); %></td>
            <td class=""><% out.println(rs.getString("email")); %></td>
            <td class=""><% out.println(rs.getString("level")); %></td>
            <td>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#editModal">
                    Edit
                </button>
                <button type="button" class="btn btn-danger" id="<%=rs.getString("faculty_id") %>"  value="delete">
                    Delete
                </button>
            </td>
        </tr>
        <%

            }
            rs.close();


        %>

        </tbody>
    </table>
    <!--table ends-->

    <!--form to add new facuilty to database-->
    <div class="row justify-content-center" style="padding: 30px 0px; ">
        <h3>Add new faculty to table</h3>
    </div>
    <div>
        <form method="post" class="form-inline">

            <label class="sr-only" for="faculty_id">id</label>
            <input type="text" class="form-control col-1" id="faculty_id" placeholder="id">

            <label class="sr-only" for="name">Name</label>
            <input type="text" class="form-control col-2" id="name" placeholder="Full name">

            <label class="sr-only" for="date_of_birth">Date of Birth</label>
            <input type="text" class="form-control col-2" id="date_of_birth" placeholder="mm-dd-yyyy">

            <label class="sr-only" for="address">Address</label>
            <input type="text" class="form-control col-2" id="address" placeholder="Address">

            <label class="sr-only" for="email">Email</label>
            <input type="text" class="form-control col-2" id="email" placeholder="Email">

            <label class="sr-only" for="level">Level</label>
            <input type="text" class="form-control col-2" id="level" placeholder="level">


            <button type="button" class="btn btn-warning" id="saveNewRow">Add New</button>
        </form>

    </div>
    <!--form for add new faculty ends-->
    <!--space from footer-->
    <div class="row justify-content-center" style="padding: 30px 0px; ">

    </div>
    <!--space ends-->

    <!-- Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content"></div>
        </div>
        <div class="modal-dialog">
            <div class="modal-content"></div>
        </div>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"> <span aria-hidden="true" class="">×   </span><span class="sr-only">Close</span>

                    </button>
                    <h4 class="modal-title" id="myModalLabel">Faculty Update</h4>

                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

</div>
<script>

    $(".btn-success[data-target='#editModal']").click(function() {
        var columnHeadings = $("thead th").map(function() {
            return $(this).text();
        }).get();
        columnHeadings.pop();
        var columnValues = $(this).parent().siblings().map(function() {
            return $(this).text();
        }).get();
        var modalBody = $('<div id="modalContent"></div>');
        var modalForm = $('<form role="form" name="modalForm" action="updatefac.jsp" method="post"></form>');
        $.each(columnHeadings, function(i, columnHeader) {
            var formGroup = $('<div class="form-group"></div>');
            formGroup.append('<label for="'+columnHeader+'">'+columnHeader+'</label>');
            formGroup.append('<input class="form-control" name="'+columnHeader+i+'" id="'+columnHeader+i+'" value="'+columnValues[i]+'" />');
            modalForm.append(formGroup);
        });
        modalBody.append(modalForm);
        $('.modal-body').html(modalBody);
    });
    $('.modal-footer .btn-primary').click(function() {
        $('form[name="modalForm"]').submit();
    });

    $(document).ready(function() {
        $(".btn-danger").click(function() {
            var id = +this.id;
            $.ajax({
                url: "deletefac.jsp",
                type: "POST",
                data: {
                    id : id
                },
                success : function(data){
                    alert(data); // alerts the response from jsp
                    location.reload();
                }
            });
        });
    });

    $(document).ready(function () {
        $("#saveNewRow").click(function () {
            $.ajax({
                url: "createfac.jsp",
                type: "post",
                data: {
                    faculty_id: $('#faculty_id').val(),
                    name: $('#name').val(),
                    date_of_birth: $('#date_of_birth').val(),
                    address: $('#address').val(),
                    email: $('#email').val(),
                    level: $('#level').val(),
                    success: function(data){
                        alert(data);
                        location.reload(true);

                    }
                }

            });

        });

    });

    function searchFunction() {
        var input, filter, table, tr, td, i;
        input = document.getElementById("search");
        filter = input.value.toUpperCase();
        table = document.getElementById("newTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

</script>
</body>
</html>
</html>
