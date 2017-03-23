<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GuangShangTao - Indexmain</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/datepicker3.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>

    <script src="js/bootstrap.min.js"></script>

    <script src="js/easypiechart.js"></script>
    <script src="js/easypiechart-data.js"></script>
    <script src="js/bootstrap-datepicker.js"></script>
    <script src="js/ajax.js"></script>
    <![endif]-->
    <script type="text/javascript">

        var shopTotalElements,orderTotalElements,messagesTotalElements,userTotalElements;
        //
        //        function download(type){
        //            msg = '�Ƿ��'+type+'������excel';
        //            if(confirm(msg)){
        //                var url="http://101.200.56.75/"+type+"/file";
        //                window.open(url);
        //            }
        //        }
        //
        //        function download(){
        //            msg = '�Ƿ�Ѹ�ҳshop������excel';
        //            if(confirm(msg)){
        //                var url="http://101.200.56.75/shop/file";
        //                window.open(url);
        //            }
        //        }


        window.onload =function () {

                Highcharts.chart('container', {
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    title: {
                        text: '2014 ĳ��վ������������ռ��'
                    },
                    tooltip: {
                        headerFormat: '{series.name}<br>',
                        pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                                style: {
                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                }
                            }
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: '�����������ռ��',
                        data: [
                            ['Firefox',   45.0],
                            ['IE',       26.8],
                            {
                                name: 'Chrome',
                                y: 12.8,
                                sliced: true,
                                selected: true
                            },
                            ['Safari',    8.5],
                            ['Opera',     6.2],
                            ['����',   0.7]
                        ]
                    }]
                });

            remond0(0,5,"messageid,asc",1);
            remond0(0,5,"orderid,asc",2);
            remond0(0,5,"userid,asc",3);
            remond0(0,5,"shopid,asc",4);
        }

        function remond0(page, size, sort,controller) {
            if(controller==1){
                $.ajax({
                    url: "http://101.200.56.75/messages/messagespage?page=" + page + "&size=" + size + "&sort=" + sort,
                    type: "GET",
                    dataType: "json",
                    success: function (res) {
                        messagesTotalElements=res.payload.totalElements;
//                        alert(messagesTotalElements+"          "+controller);
                        document.getElementById("messages").innerHTML = messagesTotalElements;
                    }

                });
            }
            if(controller==2){

                $.ajax({
                    url: "http://101.200.56.75/order/orderspage?page="+page+"&size="+size+"&sort="+sort,
                    type: "GET",
                    dataType: "json",
                    success: function (res) {
                        orderTotalElements = res.payload.totalElements;
//                        alert(orderTotalElements);
                        document.getElementById("order").innerHTML = orderTotalElements;
                    }

                });

            }
            if(controller == 3){

                $.ajax({
                    url: "http://101.200.56.75/users/userspage?page="+page+"&size="+size+"&sort="+sort,
                    type: "GET",
                    dataType: "json",
                    success: function (res) {
                        userTotalElements = res.payload.totalElements;
//                        alert(userTotalElements);
                        document.getElementById("user").innerHTML = userTotalElements;
                    }


                });

            }
            if(controller == 4){

                $.ajax({
                    url: "http://101.200.56.75/shop/newspage?page="+page+"&size="+size+"&sort="+sort,
                    type: "GET",
                    dataType: "json",
                    success: function (res) {
                        shopTotalElements = res.payload.totalElements;
//                        alert(shopTotalElements);
                        document.getElementById("shop").innerHTML =shopTotalElements;
                    }

                });

            }
        }
        //        shopTotalElements,orderTotalElements,messagesTotalElements,userTotalElements;


        function startTime()
        {
            var today=new Date()
            var h=today.getHours()
            var m=today.getMinutes()
            var s=today.getSeconds()
// add a zero in front of numbers<10
            m=checkTime(m)
            s=checkTime(s)
            document.getElementById('txt').innerHTML="����ʱ��:<span class='glyphicon glyphicon-time'></span>&nbsp;"+ h+":"+m+":"+s
//            document.getElementById('timeid').innerHTML="<span class='glyphicon glyphicon-time'></span>&nbsp;"+ h+":"+m+":"+s
            t=setTimeout('startTime()',500)
        }

        function checkTime(i)
        {
            if (i<10)
            {i="0" + i}
            return i
        }
        function back(){
            window.history.back(-1);
        }


    </script>


</head>

<body onload="startTime()">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>GuangShangTao</span>Admin</a>
            <ul class="user-menu">
                <li class="dropdown pull-right">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <shiro:principal/> <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
                        <li><a href="${pageContext.request.contextPath }/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div><!-- /.container-fluid -->
</nav>

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
    <form role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search">
        </div>
    </form>
    <ul class="nav menu">
        <li class="active"><a href="/testtubiao"><span class="glyphicon glyphicon-dashboard"></span> ���ݲ���</a></li>
        <li><a href="/shopmain"><span class="glyphicon glyphicon-shopping-cart"></span> ��Ʒ����</a></li>
        <li><a href="/usermain"><span class="glyphicon glyphicon-user"></span> �û�����</a></li>
        <li><a href="/ordermain"><span class="glyphicon glyphicon-list-alt"></span> ��������</a></li>
        <li><a href="/messagesmain"><span class="glyphicon glyphicon-comment"></span> ���۲���</a></li>
        <li class="parent ">
            <a href="#">
                <span class="glyphicon glyphicon-download-alt"></span> �������� <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em class="glyphicon glyphicon-s glyphicon-plus"></em></span>
            </a>
            <ul class="children collapse" id="sub-item-1">
                <li>
                    <a class=""  href="http://101.200.56.75/"  >
                        <span class="glyphicon glyphicon-circle-arrow-down"></span> kong-api-gateway
                    </a>
                </li>
                <li>
                    <a class=""  href="http://www.gzcc.cn/" >
                        <span class="glyphicon glyphicon-circle-arrow-down"></span> ������ѧԺ
                    </a>
                </li>
          </ul>
        </li>
        <li role="presentation" class="divider"></li>
        <li><a href="${pageContext.request.contextPath }/logout"><span class="glyphicon glyphicon-user"></span> Login Out</a></li>
    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li> [<a href="/indexmain"><span class='glyphicon glyphicon-home'></span>&nbsp;��ҳ</a>]</li>
            <li class="active">Main</li>
            <li> [<a href="/time" id="txt"> </a>]</li>
            <li>[<a href="#" onclick="back()"><span class='glyphicon glyphicon-share-alt'></span>&nbsp;���� </a> ]</li>
            <li> [ <a href="/help" ><span class='glyphicon glyphicon-question-sign'></span>&nbsp;����</a>]</li>
            <li> [<a href="/thisuser"><span class='glyphicon glyphicon-user'></span>&nbsp;�û�</a>]&nbsp;&nbsp;</li>
        </ol>
    </div><!--/.row-->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Main</h1>
        </div>
    </div><!--/.row-->

    <%--<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >��ҳģ��</a></div>--%>

    <div class="row">
        <div class="col-xs-12 col-md-6 col-lg-3">
            <div class="panel panel-blue panel-widget ">
                <div class="row no-padding">
                    <div class="col-sm-3 col-lg-5 widget-left">
                        <em class="glyphicon glyphicon-list-alt glyphicon-l"></em>
                    </div>
                    <div class="col-sm-9 col-lg-7 widget-right">
                        <div class="large" id="order"></div>
                        <div class="text-muted">����</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-md-6 col-lg-3">
            <div class="panel panel-orange panel-widget">
                <div class="row no-padding">
                    <div class="col-sm-3 col-lg-5 widget-left">
                        <em class="glyphicon glyphicon-comment glyphicon-l"></em>
                    </div>
                    <div class="col-sm-9 col-lg-7 widget-right">
                        <div class="large" id="messages"></div>
                        <div class="text-muted">����</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-md-6 col-lg-3">
            <div class="panel panel-teal panel-widget">
                <div class="row no-padding">
                    <div class="col-sm-3 col-lg-5 widget-left">
                        <em class="glyphicon glyphicon-user glyphicon-l"></em>
                    </div>
                    <div class="col-sm-9 col-lg-7 widget-right">
                        <div class="large" id="user"></div>
                        <div class="text-muted">�û�</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-md-6 col-lg-3">
            <div class="panel panel-red panel-widget">
                <div class="row no-padding">
                    <div class="col-sm-3 col-lg-5 widget-left">
                        <em class="glyphicon glyphicon-shopping-cart glyphicon-l"></em>
                    </div>
                    <div class="col-sm-9 col-lg-7 widget-right">
                        <div class="large" id="shop"></div>
                        <div class="text-muted">��Ʒ</div>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/.row-->

    <%--<div id="container" name="container" style="width: 810px; height: 400px; margin: 20px 5px 15px 20px "></div>--%>
    <div id="container" name="container1" style="width:1000px;height:400px;margin-right:20px;"></div>



    <div class="row">
        <div class="col-xs-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>Sports</h4>
                    <div class="easypiechart" id="easypiechart-blue" data-percent="92" ><span class="percent">92%</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>Electronics</h4>
                    <div class="easypiechart" id="easypiechart-orange" data-percent="65" ><span class="percent">65%</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>Book</h4>
                    <div class="easypiechart" id="easypiechart-teal" data-percent="56" ><span class="percent">56%</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-6 col-md-3">
            <div class="panel panel-default">
                <div class="panel-body easypiechart-panel">
                    <h4>Food</h4>
                    <div class="easypiechart" id="easypiechart-red" data-percent="47" ><span class="percent">47%</span>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/.row-->
</div>	<!--/.main-->


</body>

</html>
