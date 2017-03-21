<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title><s:text name="accueil.titre"/></title>

        <!-- Bootstrap Core CSS -->
        <link href="assets/css/bootstrap/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="assets/css/main.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="assets/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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
                    <div class="triangle"></div>
                    <div class="collapse navbar-collapse bg-darkgray blue-green" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav  client">
                        <!-- nom client -->
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
                            	<s:url id="localeFR" namespace="/" action="msg" >
   									<s:param name="request_locale" >fr</s:param>
								</s:url>
								<s:a href="%{localeFR}" >FR</s:a>
							</li>
                            <li>
                            	<s:url id="localeEN" namespace="/" action="msg" >
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
            <div class="container grey">
                <div class="row maxwidth2">
                	<div class="col-md-4">
	                	<div class="container-filtre">
	                        <div class="panel panel-info">
		                		<div class="panel-heading bg-green">
		                                <div class="panel-title"><s:text name="msg.ecrire"/></div>
		                        </div>
		                        <div class="panel-body" >
		                        	<form method="post" action="sendMessage.action">
		                        		<p>
			                        		<label for="dest" class="form-margin"><s:text name="msg.destinataire"/> : </label>
			                        		<input type="text" id="dest" name="dest" class="msg-form" maxlength="50"/>
			                        	</p>
			                        	<p>
			                        		<label for="obj" class="form-margin"><s:text name="msg.objet"/> : </label>
			                        		<input type="text" id="obj" name="obj" class="msg-form" maxlength="100"/>
			                        	</p>
			                        	<p>
			                        		<textarea rows="5" cols="40" name="texte" maxlength="200" class="msg-form"></textarea>
			                        	</p>
			                        	<p>
			                        		<input type="submit" name="send" value="Envoyer" class="msg-form"/>
			                        	</p>
		                        	</form>
                        		</div>
		                    </div>
                        </div>
                	</div>
                	<div class="col-md-4">
	                	<div class="container-filtre">
	                        <div class="panel panel-info">
		                		<div class="panel-heading bg-green">
		                                <div class="panel-title"><s:text name="msg.recus"/></div>
		                        </div>
		                        <div class="panel-body" >
		                        	<table>
		                        		<tr>
		                        			<th class="vu"></th>
		                        			<th class="msg-head"><s:text name="msg.expediteur"/></th>
		                        			<th class="msg-obj"><s:text name="msg.objet"/></th>
		                        			<th class="msg-head"><s:text name="msg.date"/></th>
		                        		</tr>
		                        		<s:iterator value="msglist">
			                        			<tr class="msg-row" id="<s:property value='id'/>">
			                        				<s:if test="vu == 1">
			                        					<td class="vu msg-vu"></td>
			                        				</s:if>
			                        				<s:else>
			                        					<td class="vu msg"></td>
			                        				</s:else>
			                        				<td class="from"><s:property value="from"/></td>
			                        				<td class="obj"><s:property value="obj"/></td>
			                        				<td class="date"><s:property value="date"/></td>
			                        				<td class="texte hidden"><s:property value="text"/></td>
			                        				<td class="id hidden"><s:property value="id"/></td>
			                        			</tr>
		                        		</s:iterator>
		                        	</table>
	                        	</div>
		                    </div>
                        </div>
                	</div>
                	<div class="col-md-4">
	                	<div class="container-filtre">
	                        <div class="panel panel-info">
		                		<div class="panel-heading bg-green">
		                                <div class="panel-title"><s:text name="msg.lire"/></div>
		                        </div>
		                        <div class="panel-body" >
		                        	<p class="form-margin"><s:text name="msg.expediteur"/> : <span id="expediteur"></span></p>
		                        	<p class="form-margin"><s:text name="msg.date"/> : <span id="date"></span></p>
		                        	<p class="form-margin"><s:text name="msg.objet"/> : <span id="objet"></span></p>
		                        	<p class="msg-text"><span id="texte"></span></p>
                        		</div>
		                    </div>
                        </div>
                	</div>
                </div>
            </div>
            <footer>
            <a href="http://biotraq.fr" target="_blank" class="alignright">http://biotraq.fr</a>
        	</footer>
        </div>
    	</s:else>
	</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".msg-row").each(function(index) {
				//Affiche le contenu d'un message et le rend lu lorsqu'on clique dessus
				$(this).click(function() {
					//Affiche le contenu
					$(".msg-row").removeClass("selected-row");
					$(this).addClass("selected-row");
					$(this).find(".vu").attr("class", "msg-vu");
					$("#expediteur").text($(this).find(".from").text());
					$("#objet").text($(this).find(".obj").text());
					$("#date").text($(this).find(".date").text());
					$("#texte").html($(this).find(".texte").text());
					//Rend le message lu
					var xmlhttp = new XMLHttpRequest();
					xmlhttp.open("GET", "see.action?id=" + $(this).find(".id").text(), true);
	    		    xmlhttp.send();
				});
			});
		});
	</script>
</html>