<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<!--<meta http-equiv="refresh" content="30">-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><s:text name="accueil.titre"/></title>

    <!-- Bootstrap Core CSS -->
    <link href="assets/css/bootstrap/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="assets/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Custom CSS -->
    <link href="assets/css/main.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

    <body>
		<s:if test="%{#session.email == '' || #session.email == null}">
    		<script>window.location.replace("/biotraq");</script>
    	</s:if>
    	<s:else>
        <div class="global">
            <!-- Navigation -->
            <nav class="navbar" role="navigation">
                <div class="container">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header bg-white">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="AccueilAction.action"><img src="assets/img/logo-bio.png" alt="logo biotraq" /></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                      <div class="triangle"></div>
                    <div class="collapse navbar-collapse bg-darkgray blue-green" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav  client">
                        <!-- Nom client -->
                            <li class="text-green"></li>
                        </ul>
                         <s:if test="%{#session.username != null}">
                         <ul class="nav navbar-nav  connect ">
                            <li class="text-green"><s:property value="#session.username"/></li>
                        </ul>
                        </s:if>
                        <ul class="nav navbar-nav navbar-right exit">
                            <li><a href="#">exit</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right lang">
                            <li>
                            	<s:url id="localeFR" namespace="/" action="MajLotAction" >
   									<s:param name="request_locale" >fr</s:param>
								</s:url>
								<s:a href="%{localeFR}" >FR</s:a>
							</li>
                            <li>
                            	<s:url id="localeEN" namespace="/" action="MajLotAction" >
  									<s:param name="request_locale" >en</s:param>
								</s:url>
								<s:a href="%{localeEN}" >EN</s:a>
								<s:url id="logout" namespace="/" action="logoutBTQ"></s:url>
								<s:a href="%{logout}"><i class="fa fa-sign-out beige"></i></s:a>
							</li>
                        </ul>

                        <ul class="nav navbar-nav  navbar-right  bg-darkgray">
                            <li>
                                <a href="AccueilAction.action"><s:text name="accueil.label"/></a>
                            </li>
                            <li>
                                <a href="MajLotAction.action"><s:text name="accueil.label1"/></a>
                            </li>
                            <li>
                                <a href="contact.action"><s:text name="accueil.label2"/></a>
                            </li>
                            <li>
                                <a href="help.action"><s:text name="accueil.label3"/></a>
                            </li>
                            <li>
                                <a href="msg.action"><s:text name="accueil.label5"/><s:if test="msgnonvus>0"><span class="badge badge-rouge"><s:property value="msgnonvus"/></span></s:if></a>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container -->
                <div class="subnav container">
                    <div class="sublinks col-md-8">
                        <ul class="clearfix">
                            <li><s:a href="AccueilAction.action"><s:text name="accueil.label.nav1"/></s:a></li>
                            <li><s:a href="detailsAction.action"><s:text name="accueil.label.nav2"/></s:a></li>
                            <li><s:a action="informationlot.action"> <s:param name="id_lot">1</s:param><s:text name="accueil.label.nav3"/></s:a></li>
                        </ul>
                    </div>
                    <div class="search-form col-md-3">
                        <form method="get" action="search.action">
                            <div class="input-group">
                                <input type="text" name="searchtext" class="form-control" placeholder="<s:text name="accueil.label.search"/>">
                                <span class="input-group-btn">
                            <input class="btn btn-default bg-green " type="submit" value="<s:text name="accueil.label.gosearch"/>"/>
                      </span>
                            </div>
                            <!-- /input-group -->
                        </form>
                    </div>
                </div>
            </nav>
            <!-- Page Content -->
            <div class="container grey custoScroll">
                <div class="row maxwidth">
                    <div class="col-md-3 ">
                        <div class="panel panel-info ">
                            <div class="panel-heading bg-green">
                                <div class="panel-title ">Date Demo</div>
                            </div>
                                          
                            <div class="panel-body">
                                <form action="datedemo.action" method="get" role="form" class="big-space">
        							<div class="form-group"><input type="date" name="date" id="date" class="form-control" value="04/06/2015"/></div>
        							<div class="form-group"><input type="submit" name="submit" value="Envoyer" class="btn btn-default"/></div>
        						</form>
                        	</div>
                    	</div>
                    </div>

                    <div class="col-md-3">
                        <div class="panel panel-info">
                            <div class="panel-heading bg-green">
                                <div class="panel-title ">Pas de temps</div>
                            </div>
							 <div class="panel-body">
                               <form action="pas.action" method="get" role="form" class="big-space">
        							<div class="form-group"><input type="number" name="number" id="number" class="form-control" value="1" step="0.5"/></div>
        							<div class="form-group"><input type="submit" name="submit" value="Envoyer" class="btn btn-default"/></div>
        						</form>
                            </div>
                              
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="panel panel-info panel">
                            <div class="panel-heading bg-green">
                                <div class="panel-title ">Réinitialisation des lots</div>
                            </div>
                            <div class="panel-body">
								<form class="big-space" role="form" action="lot41.action">
									<input type="submit" class="btn btn-default" value="Lot 41"/>
								</form>
								<form class="big-space" role="form" action="lot42.action">
									<input type="submit" class="btn btn-default" value="Lot 42"/>
								</form>"
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="panel panel-info panel">
                            <div class="panel-heading bg-green">
                                <div class="panel-title ">Liens</div>
                            </div>
                            <div class="panel-body">
								<a href="simulator.action"><h2>Simulateur</h2></a>
								<a href="cassandra.action"><h2>jspCassandraAdmin</h2></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel panel-info panel">
                            <div class="panel-heading bg-green">
                                <div class="panel-title ">Supprimer correction</div>
                            </div>
                            <div class="panel-body">
								<s:iterator  value="listCorrT" >
									<div class="my-favs">
										<s:a action="supcorr.action">
											<s:param name="id"><s:property value="lot_id" /> </s:param>
											<p><s:property value="libelleLot" /></p>
											<span class="icon-corrtemp"></span>
										</s:a>   
									</div>
									<div class="clear"></div>
								</s:iterator>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  end container -->
        <footer>
            <a href="http://biotraq.fr" target="_blank" class="alignright">http://biotraq.fr</a>
        </footer>
        </div>
        <!-- end global -->
        <!-- jQuery -->
        <script src="assets/js/vendor/jquery-1.11.2.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="assets/js/vendor/bootstrap.min.js"></script>
		</s:else>
    </body>

</html>
