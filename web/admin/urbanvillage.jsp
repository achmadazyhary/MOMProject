<%-- 
    Document   : urbanvillage
    Created on : Aug 2, 2019, 4:23:03 PM
    Author     : HARRY-PC
--%>

<%@page import="models.Subdistrict"%>
<%@page import="models.Urbanvillage"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Urban-Village Page</h1>
    <a class="btn btn-primary btn-icon-split" data-toggle="modal" data-target="#modalInsert"><span class="icon text-white-50">
            <i class="fas fa-plus"></i>
        </span>
        <span class="text">Insert Urban-Village</span>
    </a>
    <br>
    <br>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Urban-Village Data</h6>
        </div>
        <%
            List<Urbanvillage> listUrbanvillage = (List<Urbanvillage>) session.getAttribute("listUrbanvillage");
            List<Subdistrict> listSubdistrict = (List<Subdistrict>) session.getAttribute("listSubdistrict");
            Urbanvillage urbanvillage = (Urbanvillage) session.getAttribute("urbanvillage");
            if (session.getAttribute("listUrbanvillage") == null) {
                response.sendRedirect("../UrbanvillageServlet");
            }
        %>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>No</th> 
                            <th>Urban-Village</th>
                            <th>Sub-District</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>No</th>
                            <th>Urban-Village</th>
                            <th>Sub-District</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <%
                            if (session.getAttribute("listUrbanvillage") != null) {
                                for (Urbanvillage urban : listUrbanvillage) {
                        %>
                        <tr>
                            <td></td>
                            <td><%=urban.getName()%></td>
                            <td><%=urban.getSubdistrict().getName()%></td>
                            <td><a class="btn btn-danger"  href="../UrbanvillageServlet?action=delete&id=<%=urban.getId()%>">Delete</a>
                                <a class="btn btn-primary" data-toggle="modal" data-target="#modalEdit<%=urban.getId()%>" >Update</a>
                            </td>
                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal Insert-->
<div class="modal fade" id="modalInsert" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="../UrbanvillageServlet" method="POST">
                    <label><b>Urban-Village</b></label>
                    <input class="form-control" type="text" name="name" value="<%= (urbanvillage != null) ? urbanvillage.getName() : ""%>" />
                    <br>
                    <label><b>Sub-District</b></label>
                    <div>
                        <select class="form-control" id="subdistrict" name="subdistrict">
                            <option value="">None</option>
                            <%if (session.getAttribute("listUrbanvillage") != null) {
                                for (Subdistrict s : listSubdistrict) {%>
                                <option value="<%=s.getId()%>"<%= (urbanvillage != null) ? (Integer.parseInt(s.getId().toString()) == Integer.parseInt(urbanvillage.getSubdistrict().getId().toString())) ? "selected" : "" : "" %>><%=s.getName()%></option>
                                <%}
                            }%>
                        </select>
                    </div>
                    <br>
                    <input  type="submit" value="Save" class="btn btn-success" id="insert">
                </form>
            </div>
        </div>
    </div>
</div>
<!--End of Modal Insert-->

<!-- Modal Edit-->
<%if (session.getAttribute("listUrbanvillage") != null) {
   for (Urbanvillage u : listUrbanvillage) {%>
<div class="modal fade" id="modalEdit<%= u.getId()%>" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="../UrbanvillageServlet" method="POST">
                    <label><b>ID</b></label>
                    <input class="form-control" type="text" name="id" value="<%=u.getId()%>" readonly/>
                    <br>
                    <label><b>Urban-Village</b></label>
                    <input class="form-control" type="text" name="name" value="<%=u.getName()%>" />
                    <br>
                    <label><b>Sub-District</b></label>
                    <div>
                        <select class="form-control" id="subdistrict" name="subdistrict">
                            <option value="">None</option>
                           <%if (session.getAttribute("listUrbanvillage") != null) {
                                for (Subdistrict s : listSubdistrict) {%>
                                <option value="<%=s.getId()%>"<%= (u != null) ? (Integer.parseInt(s.getId().toString()) == Integer.parseInt(u.getSubdistrict().getId().toString())) ? "selected" : "" : "" %>><%=s.getName()%></option>
                                <%}
                            }%>
                        </select>
                    </div>
                    <br>
                    <input  type="submit" value="Save" class="btn btn-success">
                </form>
            </div>
        </div>
    </div>
</div>
<%}
    }
%>
<!--End of Modal Edit-->
<%@include file="../layout/footer.jsp"%>
<%
    session.removeAttribute("listUrbanvillage"); 
    session.removeAttribute("urbanvillage");
%>
</html>
