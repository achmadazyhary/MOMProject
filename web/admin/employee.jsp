<%-- 
    Document   : employee
    Created on : Aug 4, 2019, 2:53:29 PM
    Author     : HARRY-PC
--%>

<%@page import="models.Role"%>
<%@page import="models.Employee"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800">Employee Page</h1>
    <a class="btn btn-primary btn-icon-split" data-toggle="modal" data-target="#modalInsert">
        <span class="icon text-white-50">
            <i class="fas fa-plus"></i>
        </span>
        <span class="text">Insert Employee</span>
    </a>
    <br>
    <br>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Employee Data</h6>
        </div>
        <%
            List<Employee> listEmployee = (List<Employee>) session.getAttribute("listEmployee");
            List<Role> listRole = (List<Role>) session.getAttribute("listRole");
            Employee employee = (Employee) session.getAttribute("employee");
            if (session.getAttribute("listEmployee") == null) {
                response.sendRedirect("../EmployeeServlet");
            }
        %>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>No</th> 
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Role</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>No</th> 
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Role</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <%
                            if (session.getAttribute("listEmployee") != null) {
                                for (Employee emp : listEmployee) {
                        %>
                        <tr>
                            <td></td>
                            <td><%=emp.getName()%></td>
                            <td><%=emp.getLastname()%></td>
                            <td><%=emp.getRole().getName()%></td>
                            <td><%=emp.getPhone()%></td>
                            <td><%=emp.getEmail()%></td>
                            <td><%=emp.getPassword()%></td>
                            <td><a class="btn btn-danger"  href="../EmployeeServlet?action=delete&id=<%=emp.getId()%>">Delete</a>
                                <a class="btn btn-primary" data-toggle="modal" data-target="#modalEdit<%=emp.getId()%>" >Update</a>
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
                <form action="../EmployeeServlet" method="POST">
                    <label><b>First Name</b></label>
                    <input class="form-control" type="text" name="name" value="<%= (employee != null) ? employee.getName() : ""%>" />
                    <br>
                    <label><b>Last Name</b></label>
                    <input class="form-control" type="text" name="lastName" value="<%= (employee != null) ? employee.getLastname() : ""%>" />
                    <br>
                    <label><b>Sub-District</b></label>
                    <div>
                        <select class="form-control" id="role" name="role">
                            <option value="">None</option>
                            <%if (session.getAttribute("listEmployee") != null) {
                                for (Role r : listRole) {%>
                                <option value="<%=r.getId()%>"<%= (employee != null) ? (Integer.parseInt(r.getId().toString()) == Integer.parseInt(employee.getRole().getId().toString())) ? "selected" : "" : "" %>><%=r.getName()%></option>
                                <%}
                            }%>
                        </select>
                    </div>
                    <br>
                    <label><b>Phone Number</b></label>
                    <input class="form-control" type="number" name="phone" value="<%= (employee != null) ? employee.getPhone() : ""%>" />
                    <br>
                    <label><b>E-Mail Addres</b></label>
                    <input class="form-control" type="email" name="email" value="<%= (employee != null) ? employee.getEmail() : ""%>" />
                    <br>
                    <label><b>Password</b></label>
                    <input class="form-control" type="password" name="password" value="<%= (employee != null) ? employee.getPassword() : ""%>" />
                    <br>
                    <input  type="submit" value="Save" class="btn btn-success" id="insert">
                </form>
            </div>
        </div>
    </div>
</div>
<!--End of Modal Insert-->
<!-- Modal Edit-->
<%if (session.getAttribute("listEmployee") != null) {
   for (Employee e : listEmployee) {%>
<div class="modal fade" id="modalEdit<%= e.getId()%>" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="../EmployeeServlet" method="POST">
                    <label><b>ID</b></label>
                    <input class="form-control" type="text" name="id" value="<%=e.getId()%>" readonly/>
                    <br>
                    <label><b>First Name</b></label>
                    <input class="form-control" type="text" name="name" value="<%=e.getName()%>" />
                    <br>
                    <label><b>Last Name</b></label>
                    <input class="form-control" type="text" name="lastName" value="<%=e.getLastname()%>" />
                    <br>
                    <label><b>Sub-District</b></label>
                    <div>
                        <select class="form-control" id="role" name="role">
                            <option value="">None</option>
                            <%if (session.getAttribute("listEmployee") != null) {
                                for (Role r : listRole) {%>
                                <option value="<%=r.getId()%>"<%= (e != null) ? (Integer.parseInt(r.getId().toString()) == Integer.parseInt(e.getRole().getId().toString())) ? "selected" : "" : "" %>><%=r.getName()%></option>
                                <%}
                            }%>
                        </select>
                    </div>
                    <br>
                    <label><b>Phone Number</b></label>
                    <input class="form-control" type="number" name="phone" value="<%=e.getPhone()%>" />
                    <br>
                    <label><b>E-Mail Addres</b></label>
                    <input class="form-control" type="email" name="email" value="<%=e.getEmail()%>" />
                    <br>
                    <label><b>Password</b></label>
                    <input class="form-control" type="password" name="password" value="<%=e.getPassword()%>" />
                    <br>
                    <input  type="submit" value="Save" class="btn btn-success" id="insert">
                </form>
            </div>
        </div>
    </div>
</div>
<%}
    }
%>
<!--End of Modal Edit-->
<%@include file="../layout/footer.jsp" %>
<%
    session.removeAttribute("listEmployee"); 
    session.removeAttribute("employee");
%>
</html>