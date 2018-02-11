<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Common Admin - Admins</title>
            
        <!-- CASCADING STYLESHEET (CSS) -->
        <link href="css/commoninfrastructure/admin/baselayout/bootstrap-v3.3.7.min.css" rel="stylesheet" type="text/css">
        <link href="css/commoninfrastructure/admin/baselayout/CommonAdminBaseCSS.css" rel="stylesheet" type="text/css">
        <!-- NProgress -->
        <link href="css/commoninfrastructure/admin/weblayout/nprogress.css" rel="stylesheet">
        <!-- iCheck -->
        <link href="css/commoninfrastructure/admin/weblayout/green.css" rel="stylesheet">
        <!-- Datatables -->
        <link href="css/commoninfrastructure/admin/weblayout/dataTables.bootstrap.min.css" rel="stylesheet">
        <link href="css/commoninfrastructure/admin/weblayout/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="css/commoninfrastructure/admin/weblayout/fixedHeader.bootstrap.min.css" rel="stylesheet">
        <link href="css/commoninfrastructure/admin/weblayout/responsive.bootstrap.min.css" rel="stylesheet">
        <link href="css/commoninfrastructure/admin/weblayout/scroller.bootstrap.min.css" rel="stylesheet">
            
        <!--Font Awesome 5 JS-->
        <script defer src="fonts/fa5/fontawesome-all.js"></script>
        <script defer src="fonts/fa5/fa-v4-shims.js"></script>
    </head>
        
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@include file="../SideMenu.jspf"%>
                <%@include file="../TopMenu.jspf"%>               
                <div class="right_col" role="main">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Admins</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li>
                                            <a href="SystemAdmin?pageTransit=NewAdmin">
                                            <button type="button" class="btn btn-default">
                                                
                                                    <i class="fas fa-plus"></i>&nbsp;&nbsp;Create New Admin
                                            </button>
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <!--
                                    <p class="text-muted font-13 m-b-30">
                                        The following EduPack Users are admins.
                                    </p>
                                    -->
                                    <table id="datatable" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="w_20">Photo</th>
                                                <th>Name</th>
                                                <th>Username</th>
                                                <th>Date Created</th>
                                                <th>Admin Type</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>                                                                                       
                                        <tbody>
                                            <% 
                                                ArrayList adminList = (ArrayList)request.getAttribute("adminList");
                                                for(Object o : adminList){
                                                    ArrayList adminData = (ArrayList) o;
                                                    String adminType = (String) adminData.get(4);
                                                    if(adminType.trim().equalsIgnoreCase("unifyadmin")){
                                                        adminType="Unify Admin";
                                                    }else if(adminType.trim().equalsIgnoreCase("edutechadmin")){
                                                        adminType="EduTech Admin";
                                                    }else if(adminType.trim().equalsIgnoreCase("dualadmin")){
                                                        adminType="Dual Admin (EduTech + Unify)";
                                                    }else if(adminType.trim().equalsIgnoreCase("superadmin")){
                                                        adminType="Super Admin (Full Access Rights)";
                                                    }
                                            %>
                                            
                                            <tr>
                                                <td><img src="uploads/commoninfrastructure/admin/images/<%= adminData.get(0) %>" style="max-width: 50px; max-height: 50px;" /></td>
                                                <td><%=adminData.get(1)%></td>
                                                <td><%=adminData.get(2)%></td>
                                                <td><%=adminData.get(3)%></td>
                                                <td><%=adminType%></td>
                                                <td>
                                                    <ul class="list-inline">
                                                        <li>
                                                            <a href="SystemAdmin?pageTransit=ViewAdmin&id=<%=adminData.get(2)%>"><i class="fas fa-eye fa-lg"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="SystemAdmin?pageTransit=EditAdmin&id=<%=adminData.get(2)%>"><i class="fas fa-edit fa-lg"></i></a>                                                            
                                                        </li>
                                                        <li>
                                                            <a onclick="return confirm('Delete Admin?')" href="SystemAdmin?pageTransit=deleteAdmin&id=<%=adminData.get(2)%>"><i class="fas fa-trash fa-lg"></i></a> 
                                                        </li>
                                                    </ul>
                                                </td>
                                            </tr>                                                                                                                                                                                           
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- JAVASCRIPT (JS) -->
        <script src="js/commoninfrastructure/admin/basejs/jquery-v2.2.4.min.js" type="text/javascript"></script>
        <script src="js/commoninfrastructure/admin/basejs/bootstrap-v3.3.6.min.js" type="text/javascript"></script>
        <script src="js/commoninfrastructure/admin/webjs/StudentListJS.js" type="text/javascript"></script>

        <!-- FastClick -->
        <script src="js/commoninfrastructure/admin/webjs/fastclick.js"></script>
        <!-- NProgress -->
        <script src="js/commoninfrastructure/admin/webjs/nprogress.js"></script>
        <!-- iCheck -->
        <script src="js/commoninfrastructure/admin/webjs/icheck.min.js"></script>
        <!-- Datatables -->
        <script src="js/commoninfrastructure/admin/webjs/dataTables/jquery.dataTables.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/dataTables.bootstrap.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/dataTables.buttons.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/buttons.bootstrap.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/buttons.flash.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/buttons.html5.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/buttons.print.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/dataTables.fixedHeader.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/dataTables.keyTable.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/dataTables.responsive.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/responsive.bootstrap.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/dataTables.scroller.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/jszip.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/pdfmake.min.js"></script>
        <script src="js/commoninfrastructure/admin/webjs/dataTables/vfs_fonts.js"></script>
            
        <!--System Admin Base JS-->
        <script src="js/commoninfrastructure/admin/basejs/CommonAdminBaseJS.js" type="text/javascript"></script>
    </body>
</html>