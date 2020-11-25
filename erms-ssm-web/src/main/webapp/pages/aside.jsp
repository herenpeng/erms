<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>导航栏</title>
</head>
<body>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>
                    <security:authentication property="principal.username"></security:authentication>
                </p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
        <!-- search form -->
        <!--<form action="#" method="get" class="sidebar-form">
    <div class="input-group">
        <input type="text" name="q" class="form-control" placeholder="搜索...">
        <span class="input-group-btn">
        <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
        </button>
      </span>
    </div>
</form>-->
        <!-- /.search form -->


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index"><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <!-- 菜单 -->
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>系统管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="admin-login">
                        <security:authorize access="hasRole('ADMIN')">
                        <a href="${pageContext.request.contextPath}/user/findAll.do">
                            <i class="fa fa-circle-o"></i> 用户管理
                        </a>
                        </security:authorize>
                    </li>

                    <li id="admin-register">
                        <a href="${pageContext.request.contextPath}/role/findAll.do">
                            <i class="fa fa-circle-o"></i> 角色管理
                        </a>
                    </li>

                    <li id="admin-register">
                        <a href="${pageContext.request.contextPath}/permission/findAll.do">
                            <i class="fa fa-circle-o"></i> 资源权限管理
                        </a>
                    </li>

                    <li id="admin-register">
                        <a href="${pageContext.request.contextPath}/sysLog/findAll.do">
                            <i class="fa fa-circle-o"></i> 访问日志
                        </a>
                    </li>

                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i> <span>基础数据</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="charts-flot">
                        <a href="${pageContext.request.contextPath}/product/findAll.do">
                            <i class="fa fa-circle-o"></i> 产品管理
                        </a>
                    </li>

                    <li id="charts-inline">
                        <a href="${pageContext.request.contextPath}/orders/findAll.do?page=1&size=4">
                            <i class="fa fa-circle-o"></i> 订单管理
                        </a>
                    </li>

                </ul>
            </li>

            <!-- 菜单 /-->
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
</body>
</html>
