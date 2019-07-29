<%--
  Created by IntelliJ IDEA.
  User: Sidang
  Date: 7/29/2019
  Time: 9:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-6">
            <form action="#" method="post">
                <div class="form-group">
                    <label>URL</label>
                    <input type="text" name="url" class="form-control form-control-lg" >
                </div>
                <div class="form-group">
                    <label>Title Selector</label>
                    <input type="text" name="titleSelector" class="form-control" >
                </div>
                <div class="form-group">
                    <label>Description Selector</label>
                    <input type="text" name="descriptionSelector" class="form-control" >
                </div>
                <div class="form-group">
                    <label>Content Selector</label>
                    <input type="text" name="contentSelector" class="form-control" >
                </div>
                <div class="form-group">
                    <button type="button" class="btn-info" id="btn-preview">Preview</button>
                    <button type="button" class="btn-primary">Reset</button>
                    <button type="button" class="btn-success">Post</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" role="dialog" id="modal-preview">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="article-title">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="article-content">
                <p>modal body!!!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btn-save">Saves Changes</button>
            </div>
        </div>
    </div>
</div>

<script>
    $('#btn-preview').click(function () {
        var data ={
            "url":$('input[name="url"]').val(),
            "titleSelector":$('input[name="titleSelector"]').val(),
            "descriptionSelector":$('input[name="descriptionSelector"]').val(),
            "contentSelector":$('input[name="contentSelector"]').val(),
        };
        var url = "http://localhost:8080/admin/special-content";
        $.ajax({
           "url":url,
           "method":"POST",
           "data":JSON.stringify(data),
           "success":function (data) {
               $('#article-title').text(data.title);
               $('#article-content').html(data.content);
               $('#modal-preview').modal('show');
           },
           "error":function () {
               alert(2);
           }
        });
        return false;
    });
    $('#btn-save').click(function () {
       var data ={
           "url":$('input[name="url"]').val(),
           "title":$('input[name="#article-title"]').text(),
           "description":"",
           "content":$('input[name="#article-content"]').html(),
       };
       var url = "http://localhost:8080/admin/save-special-content";
       $.ajax({
           "url":url,
           "method":"POST",
           "data":JSON.stringify(data),
           "success":function (data) {
               alert("Okie!!!");
               $('#modal-preview').modal('hide');
           },
           "error":function () {
               alert(2);
           }
       });
       return false;
    });
</script>




<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
