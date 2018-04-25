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
<head>
    <title>University Courses</title>
</head>
<body>
<div class="container">

    <nav class="nav">
        <a class="nav-link" href="account.html">Back to Dashboard</a>
    </nav>

    <div class="row justify-content-center" style="padding: 30px 0px; ">
        <h1>Courses Database</h1>
    </div>
    <input type="text" class="form-control col-3" id="search" onkeyup="searchFunction()" placeholder="Search for course name" title="Type in a name">
    <!--table to display data begins-->
    <table id="newTable" class="table table-bordered">
        <thead>
        <th class="" scope="col">Course Id</th>
        <th class="" scope="col">Description</th>
        <th class="" scope="col">level</th>
        <th class="" scope="col">Instructor Id</th>
        <th class="" scope="col">Semester</th>
        <th scope="col"></th>
        </thead>
        <tbody>


        <%
            Class.forName("org.postgresql.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL);
            statement = connection.createStatement();
            rs = statement.executeQuery("SELECT * FROM courses");



            while( rs.next() ){
        %>
        <tr>
            <th class="" scope="row"><% out.println(rs.getString("course_id")); %></th>
            <td class=""><% out.println(rs.getString("description")); %></td>
            <td class=""><% out.println(rs.getString("level")); %></td>
            <td class=""><% out.println(rs.getString("instructor")); %></td>
            <td class=""><% out.println(rs.getString("semester")); %></td>
            <td>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#editModal">
                    Edit
                </button>
                <button type="button" class="btn btn-danger" id="<%=rs.getString("course_id") %>"  value="delete">
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
        <h3>Add new course to table</h3>
    </div>
    <div>
        <form method="post" class="form-inline">

            <label class="sr-only" for="course_id">id</label>
            <input type="text" class="form-control col-1" id="course_id" placeholder="id">

            <label class="sr-only" for="description">Description</label>
            <input type="text" class="form-control col-2" id="description" placeholder="Description">

            <label class="sr-only" for="level">Level</label>
            <input type="text" class="form-control col-2" id="level" placeholder="Level">

            <label class="sr-only" for="instructor">Instructor id</label>
            <input type="text" class="form-control col-2" id="instructor" placeholder="Instructor id">

            <label class="sr-only" for="semester">Semester</label>
            <input type="text" class="form-control col-2" id="semester" placeholder="Semester">

            <button type="button" class="btn btn-warning" id="saveNewRow">Add New</button>
        </form>

    </div>
    <!--form for add new courses ends-->

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
                    <h4 class="modal-title" id="myModalLabel">Courses Update</h4>

                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>
    <!--end modal-->
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
        var modalForm = $('<form role="form" name="modalForm" action="courseUpdate.jsp" method="post"></form>');
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
                url: "courseDelete.jsp",
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
                url: "courseCreate.jsp",
                type: "post",
                data: {
                    course_id: $('#course_id').val(),
                    description: $('#description').val(),
                    level: $('#level').val(),
                    instructor: $('#instructor').val(),
                    semester: $('#semester').val(),
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

