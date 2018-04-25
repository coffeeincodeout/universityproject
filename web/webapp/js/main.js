/**
 * Created by David Carlo on 4/12/18.
 */



function tableEditFunction(){
    var data = ['student_id', 'name', 'date_of_birth', 'address', 'email', 'level'];
    var table = document.getElementById("newTable");
    var row = table.insertRow(table.rows.length);
    //row.contentEditable = true;
    for (var i = 0; i < table.rows[0].cells.length - 1; i++) {
        var cell1 = row.insertCell(i).innerHTML="<input type='text' class='form-control' id='"+data[i]+"' ></input> ";;
        //var cellIdName = data[i];
       // var x = document.getElementById(cellIdName)
        //x.contentEditable = true;


    }

    var deleteButton = row.insertCell(table.rows[0].cells.length - 1);
    deleteButton.innerHTML = "<button type='button' class='btn btn-success' id='saveNewRow'>Save</button>"
        +"<button type='button' class='btn btn-danger' onclick='deleteRow(this)'>Delete</button>";
}

function deleteRow(r){
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("newTable").deleteRow(i);

}









