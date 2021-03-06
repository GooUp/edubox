<!-- ***************************************************************************************
*   Title:                  NewItemCategory.jsp
*   Purpose:                CREATION OF NEW ITEM CATEGORY (UNIFY ADMIN)
*   Created & Modified By:  TAN CHIN WEE WINSTON
*   Date:                   21 FEBRUARY 2018
*   Code version:           1.0
*   Availability:           === NO REPLICATE ALLOWED. YOU HAVE BEEN WARNED. ===
**************************************************************************************** -->

<%@include file="/webapp/commoninfrastructure/SessionCheck.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unify Admin - New Item Category</title>

        <!-- CASCADING STYLESHEET -->
        <link href="css/unify/admin/baselayout/bootstrap-v3.1.1.min.css" rel="stylesheet" type="text/css" />
        <link href="css/unify/admin/baselayout/font-awesome-v4.7.0.min.css" rel="stylesheet" type="text/css" />
        <link href="css/unify/admin/baselayout/open-sans-font.css" rel="stylesheet" type="text/css" />
        <link href="css/unify/admin/weblayout/marketplace/NewItemCategoryCSS.css" rel="stylesheet" type="text/css" />

        <!-- JAVASCRIPT -->
        <script type="text/javascript" src="js/unify/admin/basejs/jquery-v1.10.2.min.js"></script>
        <script type="text/javascript" src="js/unify/admin/basejs/bootstrap-v3.1.1.min.js"></script>
        <script type="text/javascript" src="js/unify/admin/basejs/jquery.slimscroll-v1.3.1.min.js"></script>
        <script src="js/unify/admin/basejs/validator-v1.1.0.js" type="text/javascript"></script>
        <script src="js/unify/admin/webjs/marketplace/NewItemCategoryJS.js" type="text/javascript"></script> 
    </head>
    <body style="background-color: #FFFFFF;">
        <%  
            String successMessage = (String) request.getAttribute("successMessage");
            if (successMessage != null) {
        %>
        <div class="alert alert-success" id="successPanel" style="margin: 10px 0 30px 0;">
            <button type="button" class="close" id="closeSuccess">&times;</button><%= successMessage%>
        </div>
        <%  }   %>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
        <div class="alert alert-danger" id="errorPanel" style="margin: 10px 0 30px 0;">
            <button type="button" class="close" id="closeError">&times;</button><%= errorMessage%>
        </div>
        <%  }   %>
        
        <form action="MarketplaceAdmin" method="POST" enctype="multipart/form-data" target="_parent">
            <table border="0">
                <tr>
                    <td>
                        <div class="form-group">
                            <div class="image-upload">
                                <img id="output-image" />
                            </div>
                            <label for="file-upload" class="btn btn-default btn-sm btn-block" style="margin-top: 10px; width: 151px;">
                                <i class="fa fa-cloud-upload"></i>&nbsp;&nbsp;Upload Image
                            </label>
                            <input id="file-upload" name="itemImage" type="file" accept="image/*" required="required" onchange="javascript: previewImage(event)" />
                        </div>
                    </td>
                    <td>
                        <div class="form-group">
                            <label class="control-label">Category Type:&nbsp;&nbsp;<u>Marketplace</u></label>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-bookmark"></i></span>
                                <input type="text" class="form-control" placeholder="Item Category Name (Required)" required="required" name="categoryName" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-bookmark"></i></span>
                                <textarea rows="5" class="form-control" placeholder="Item Category Description (Required)" required="required" name="categoryDescription"></textarea>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="form-group" style="text-align: center;">
                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                <input type="hidden" name="pageTransit" value="createItemCategory"/>
                                <button type="submit" class="btn btn-primary">Create Item Category</button>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>