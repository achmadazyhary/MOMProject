<%-- 
    Document   : customer
    Created on : Aug 4, 2019, 4:07:41 PM
    Author     : HARRY-PC
--%>

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
//            List<Employee> listEmployee = (List<Employee>) session.getAttribute("listEmployee");
//            List<Role> listRole = (List<Role>) session.getAttribute("listRole");
//            Employee employee = (Employee) session.getAttribute("employee");
//            if (session.getAttribute("listEmployee") == null) {
//                response.sendRedirect("../EmployeeServlet");
//            }
        %>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>No</th> 
                            <th>Name</th>
                            <th>PIC</th>
                            <th>Address</th>
                            <th>Province</th>
                            <th>District</th>
                            <th>Sub-District</th>
                            <th>Urban-Village</th>
                            <th>Phone Number</th>
                            <th>E-mail Address</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>No</th> 
                            <th>Name</th>
                            <th>PIC</th>
                            <th>Address</th>
                            <th>Province</th>
                            <th>District</th>
                            <th>Sub-District</th>
                            <th>Urban-Village</th>
                            <th>Phone Number</th>
                            <th>E-mail Address</th>
                            <th>Action</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <%
//                            if (session.getAttribute("listEmployee") != null) {
//                                for (Employee emp : listEmployee) {
                        %>
                        <tr>
                            <td></td>
                            <td><%//=emp.getName()%></td>
                            <td><%//=emp.getLastname()%></td>
                            <td><%//=emp.getRole().getName()%></td>
                            <td><%//=emp.getPhone()%></td>
                            <td><%//=emp.getEmail()%></td>
                            <td><%//=emp.getPassword()%></td>
                            <td><%//=emp.getPassword()%></td>
                            <td><%//=emp.getPassword()%></td>
                            <td><%//=emp.getPassword()%></td>
                            <td><a class="btn btn-danger"  href="../EmployeeServlet?action=delete&id=<%//=emp.getId()%>">Delete</a>
                                <a class="btn btn-primary" data-toggle="modal" data-target="#modalEdit<%//=emp.getId()%>" >Update</a>
                            </td>
                        </tr>
                        <%//}
                            //}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<%@include file="../layout/footer.jsp" %>
