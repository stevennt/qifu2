<%@page import="org.qifu.util.SystemSettingConfigureUtils"%>
<%@page import="org.qifu.base.Constants"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="q" uri="http://www.qifu.org/controller/tag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE html>
<html>
<head>
<title>qifu2</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="./tether/tether.min.css?ver=${jsVerBuild}" >
<script type="text/javascript" src="./tether/tether.min.js?ver=${jsVerBuild}"></script>
<script type="text/javascript" src="./popper-js/umd/popper.min.js?ver=${jsVerBuild}"></script>
<script type="text/javascript" src="./jquery/jquery-3.2.1.min.js?ver=${jsVerBuild}"></script>
<link rel="stylesheet" href="./bootstrap-vali/css/main.css?ver=${jsVerBuild}" >
<link href="./font-awesome/css/font-awesome.min.css?ver=${jsVerBuild}" rel="stylesheet" type="text/css" />
<script src="./bootstrap-vali/js/bootstrap.js?ver=${jsVerBuild}" ></script>

<!-- The javascript plugin to display page loading on top-->
<script src="./js/plugins/pace.min.js?ver=${jsVerBuild}"></script>

<script src="./bootbox/bootbox.js?ver=${jsVerBuild}" ></script>

<link rel="stylesheet" href="./toastr/toastr.min.css?ver=${jsVerBuild}" >
<script src="./toastr/toastr.min.js?ver=${jsVerBuild}" ></script>

<link rel="stylesheet" href="./css/m.css?ver=${jsVerBuild}" >
<script src="./configJs.do?ver=${jsVerBuild}" ></script>
<script src="./js/m.js?ver=${jsVerBuild}" ></script>

<style type="text/css">


</style>


<script type="text/javascript">

var _m_PAGE_CHANGE_URL_PARAM = '<%=Constants.QIFU_PAGE_IN_TAB_IFRAME%>';

// =====================================================================
${menuJavascriptData}
// =====================================================================

${iconJavascriptData}

function getIconUrlFromOid(oid) {
	var iconUrl = '';
	for (var n in _iconData) {
		if (_iconData[n].oid == oid) {
			iconUrl = '<%=basePath%>/icons/' + _iconData[n].fileName;
		}
	}
	return iconUrl;
}

function getIconUrlFromId(id) {
	var iconUrl = '';
	for (var n in _iconData) {
		if (_iconData[n].iconId == id) {
			iconUrl = '<%=basePath%>/icons/' + _iconData[n].fileName;
		}
	}
	return iconUrl;
}

$( document ).ready(function() {
	
	$('#myTab').bind('show', function(e) {  
	    var paneID = $(e.target).attr('href');
	    var src = $(paneID).attr('data-src');
	    // if the iframe hasn't already been loaded once
	    if($(paneID+" iframe").attr("src")=="")
	    {
	        $(paneID+" iframe").attr("src",src);
	    }
	});
	
	// first load on config
	${firstLoadJavascript}
	
});

</script>


</head>


<body class="app sidebar-mini rtl">


<!-- Modal Start here -->
<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" id="myPleaseWait" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="mySmallModalLabel">Please wait!</h4>
      </div>
      <div class="modal-body">
        <img alt="loading" src="./images/loadingAnimation.gif" border="0">
      </div>
    </div>
  </div>
</div>
<!-- Modal ends Here -->

<!-- Modal Start here for page query grid -->
<div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallQueryGridModalLabel" aria-hidden="true" id="myPleaseWaitForQueryGrid" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="mySmallQueryGridModalLabel">Please wait!</h4>
      </div>
      <div class="modal-body">
        <img alt="loading" src="./images/loadingAnimation.gif" border="0">
      </div>
    </div>
  </div>
</div>
<!-- Modal ends Here for page query grid -->


<!-- ##################### Modal for Program ##################### -->
${modalHtmlData}
<!-- ##################### Modal for Program ##################### -->

    <!-- Navbar-->
    <header class="app-header">
    	
	  <a class="app-header__logo" href="#" onclick="window.location='<%=basePath%>/index.do';"><img alt="祈-qífú" src="./images/logo2.png" border="0"></img>&nbsp;&nbsp;qífú</a>
      <a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      
	  <!-- User Menu-->
	  <ul class="app-nav">
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
          	<!-- 
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-cog fa-lg"></i> Settings</a></li>
            <li><a class="dropdown-item" href="page-user.html"><i class="fa fa-user fa-lg"></i> Profile</a></li>
            -->
            <li><a class="dropdown-item" href="#" onclick="logoutEvent();"><i class="fa fa-power-off"></i> Logout</a></li>
          </ul>
        </li>	  
	  </ul>
	  
    </header>

    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	
    <aside class="app-sidebar">
      
      <ul class="app-menu">
		
       	${navItemHtmlData}
       	
       	
       	<li><a class="app-menu__item" href="#" onclick="addTab('CORE_PROG999D9999Q', null);"><i class="app-menu__icon fa fa-info-circle"></i><span class="app-menu__label">About</span></a></li>
       	<li><a class="app-menu__item" href="#" onclick="logoutEvent();"><i class="app-menu__icon fa fa-power-off"></i><span class="app-menu__label">Logout</span></a></li>
       	
      </ul>
    </aside>
	
    <main class="app-content">
	
			<ul class="nav nav-tabs" id="myTab" role="tablist">

			</ul>

			<!-- Tab panes -->
			<div class="tab-content" id="myTabContent">
				

			</div>
	  
    </main>
    
    
    
	<!-- vali-admin main js for app tree, put last -->
	<script src="./js/main.js?ver=${jsVerBuild}"></script>    

</body>
  
  
</html>
