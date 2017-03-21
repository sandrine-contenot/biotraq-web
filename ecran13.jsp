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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		
        <!-- Custom Fonts -->
        <link href="assets/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">



        <!-- Calendar -->
        <link rel="stylesheet" type="text/css" href="assets/css/calendar.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/custom_2.css" />
        <script src="assets/js/vendor/modernizr.custom.63321.js"></script>

        <!-- Custom CSS -->
        <link href="assets/css/main.css" rel="stylesheet">
		
		
		
		
		<!-- loads d3.js -->
		<!--
	    <script type="text/javascript" src="assets/js/vendor/d3.min.js" ></script>
	    <script type="text/javascript" src="assets/js/linegraph.js"></script>
		-->
		
		<!-- graphe -->
		<!--
		<link type="text/css" rel="stylesheet" href="assets/css/graph.css" />
		-->
		

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    	
    	
    	
    	<style type="text/css">
			.highcharts-yaxis-grid .highcharts-grid-line {
				display: none;
			}
		</style>
		
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/highcharts-more.js"></script>	
		<script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
		
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
                            	<s:url id="localeFR" namespace="/" action="ti" >
   									<s:param name="request_locale" >fr</s:param>
   									<s:param name="id_lot" ><s:property value="%{#parameters.id_lot}"/></s:param>
								</s:url>
								<s:a href="%{localeFR}" >FR</s:a>
							</li>
                            <li>
                            	<s:url id="localeEN" namespace="/" action="ti" >
  									<s:param name="request_locale" >en</s:param>
   									<s:param name="id_lot" ><s:property value="%{#parameters.id_lot}"/></s:param>
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
                            <li class="menu-selected"><s:a action="correction.action"><s:param name="lotid"><s:property value="detailSurLot.id" /></s:param><s:text name="accueil.label.nav4"/></s:a></li>
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
            <div class="container grey custoScroll ">
                <div class="row maxwidth">
                    <div class="col-md-12">
                        <div class="filtre-content filtre-ec5">
                        	<div>
                            <a href="#" class=" bg-white filtre-last-1 margin-little ec5 div-small">
                                    <span class="ico-ec5  ico right tete">
										<s:if test="(resultatSurLot.etat.equals('vert'))">
											<div class="icon-ok" ></div>
										 </s:if>
										 <s:if test="(resultatSurLot.etat.equals('orange'))">
											<div class="icon-alert" ></div>
										 </s:if>
										   <s:if test="(resultatSurLot.etat.equals('rouge'))">
											<div class="icon-urgence" ></div>
										 </s:if>
                                        
                                    </span>
                            </a>
							</div>
                            <div class="panel-heading bg-darkgray bold margin-little heading-ec5 div-large">
                            	<s:if test="prevLot.equals(-1)">
                            		<i class="chevron-l-ec5 fa fa-chevron-left text-darkgrey left"></i>
                            	</s:if>
                            	<s:else>
                                	<a href="ti.action?id_lot=<s:property value='prevLot' />" id="previouslink"><i class="chevron-l-ec5 fa fa-chevron-left text-white left"></i></a>
                                </s:else>
                                <p class="title-product-ec5"><s:property value="detailSurLot.libelle" /></p>
                                <s:if test="nextLot.equals(-1)">
                                	<i class=" chevron-r-ec5 fa fa-chevron-right right text-darkgrey"></i>
                                </s:if>
                                <s:else>
                                	<a href="ti.action?id_lot=<s:property value='nextLot' />" id="nextlink"><i class=" chevron-r-ec5 fa fa-chevron-right right text-white"></i></a>
                           		</s:else>
                            </div>

                            <div>
                                <span class=" ico-ec5 ico left bg-white margin-little div-small">
                               		<s:if test="(resultatSurLot.sml.equals(1.0))">
    					        	 <div class="strategique-iconH"></div>
							        </s:if>
							         <s:elseif test="(resultatSurLot.sml.equals(2.0))">
							        	 <div class="strategique-icon"></div>
							        </s:elseif>  
							        <s:elseif test="(resultatSurLot.sml.equals(3.0))">
							       			<div class="strategique-iconL"></div>
							        </s:elseif>
							    </span>
                            </div>
                            <div>
                                <span class=" ico-ec5 ico left bg-white margin-little div-small">
                                    <s:if test="(etoile.equals(1))">                             	 	
                                			<img src="assets/img/favori_gris.png"  />                              		
                                	</s:if>
                                	 <s:elseif test="(etoile.equals(2))">
                                			<img src="assets/img/favori_yellow.png" />
                                	</s:elseif>
								</span>	
                            </div>

                            <div>
                                <span class="ico-ec5 ico left bg-white margin-little div-medium">
                                <span class="text-grey vue-ec5"><img src="assets/img/vu.png" alt="" /> 
                                <p class="view-number-ec5"><s:property value="resultatSurLot.vues"/></p></span></span>
                            </div>

                        </div>
                        <div >
                            <p class="text-green date-ec5">
                            	<s:if test="localeString == 'en'"><s:property value="listeMesure.tempsStringEn" /></s:if>
                            	<s:else><s:property value="listeMesure.tempsStringFr" /></s:else>
                            </p>
                        </div>
                    </div>
                </div>
                
                
                
                
                
                <div class="row maxwidth">
                	
					
					
                    <div class="col-md-3">
                        <div class="panel panel-info panel">
                            <div class="panel-heading bg-green ">
                                <div class="panel-title "><img src="assets/img/TEMPERATURE.png" width="45" height="45" alt="" class="ti-icon" /><s:text name="ti.temperature"/></div>
                            </div>
                            
                            <div class="panel-body">
                            	<div class="etat_line ti-text"><div class="horizontal-spaces"><s:text name="ti.ambiante"/> : <span id="temperature"><s:property value="ti.temperature_ext"/></span>°C - <s:text name="ti.ir"/> : <span id="ir"><s:property value="ti.ir"/>°C</span></div><div class="horizontal-spaces"> <s:text name="ti.min"/> : <span id="mintemp"><s:property value="mintemp"/></span>°C</div><div class="horizontal-spaces"> <s:text name="ti.max"/> : <span id="maxtemp"><s:property value="maxtemp"/></span>°C</div><div class="horizontal-spaces"> <s:text name="ti.moyenne"/> : <span id="avgtemp"><s:property value="avgtemp"/></span>°C</div></div>
                            	
								
								
								
								
								
						<ul class="nav nav-tabs">
						  <li class="active"><a href="#tab11" data-toggle="tab">Compteur</a></li>
						  <li><a href="#tab12" data-toggle="tab">Courbe</a></li>
						</ul>
						<div class="tab-content">
						  <div class="tab-pane active" id="tab11">
						  	<div id="jauge_temp" style="width: 100%; height: 250px; float: left"></div>
						  </div>
						  <div class="tab-pane" id="tab12">
						  	<div id="chart_temp" style="width: 230px; height: 250px; float: left"></div>
						  	
						  	
						  	
						  </div>
						</div>
								
								
								<!-- 
								
								<div class="etat_line ti-text"><div class="horizontal-spaces">
								<s:text name="ti.ambiante"/> : <span id="temperature">
								<s:property value="ti.temperature_ext"/></span>°C - 
								<s:text name="ti.ir"/> : <span id="ir"><s:property value="ti.ir"/></span>°C</div>
								<div class="horizontal-spaces"> 
								<s:text name="ti.min"/> : <span id="mintemp"><s:property value="mintemp"/></span>°C</div>
								<div class="horizontal-spaces"> 
								<s:text name="ti.max"/> : <span id="maxtemp"><s:property value="maxtemp"/></span>°C</div>
								<div class="horizontal-spaces">
								<s:text name="ti.moyenne"/> : <span id="avgtemp"><s:property value="avgtemp"/></span>°C</div></div>
                            	<canvas id="canvtemp" width="230" height="200"></canvas>
                            	
                            	 -->
							<script type="text/javascript">
						  	
						  		var chartTemp = Highcharts.chart('chart_temp', {
								chart: {
									type: 'spline',
									animation: Highcharts.svg, // don't animate in old IE
									marginRight: 10,
									/*
									events: {
										load: function () {
											var series = this.series[0];
													var x = (new Date()).getTime(); // current time
													var y = 0;
													series.addPoint([x, y], true, true);
										}
									}*/
								},
								title: {
									text: 'Temperature'
								},
								xAxis: {
									type: 'datetime'
								},
								yAxis: {
									title: {
										text: '°C'
									},
									plotBands: [{ // Light air
								        from: 0,
								        to: 4,
								        color: 'rgba(0, 255, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											},{ // Light air
								        from: 4,
								        to: 8,
								        color: 'rgba(255, 153, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											},{ // Light air
								        from: 8,
								        to: 40,
								        color: 'rgba(255, 0, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											}],
									plotLines: [{
										value: 0,
										width: 1,
										color: '#808080'
									}],
									min: 0,     
									max: 40
								},
								tooltip: {
									formatter: function () {
										return '<b>' + this.series.name + '</b><br/>' +
											Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
											Highcharts.numberFormat(this.y, 2);
									}
								},
								plotOptions: {
								    series: {
								        marker: {
								            enabled: false
								        }
								    }
								},
								legend: {
									enabled: false
								},
								exporting: {
									enabled: false
								},
								series: [{
									name: 'Temperature',
									data: (function () {
										// generate an array of random data
										var data = [],
											time = (new Date()).getTime(),
											i;

										for (i = -10; i <= 0; i += 1) {
											data.push({
												x: time + i * 2000,
												y: 0
											});
										}
										return data;
									}())
								}]
							});
						  	
						  	</script>
								
								<script>
								
								 
								
								var gaugeOptions = {
										
									    chart: {
									        type: 'solidgauge'
									    },
							
									    title: null,
							
									    pane: {
									        center: ['50%', '70%'],
									        size: '100%',
									        startAngle: -90,
									        endAngle: 90,
									        background: {
									            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
									            innerRadius: '60%',
									            outerRadius: '100%',
									            shape: 'arc'
									        }
									    },
							
									    tooltip: {
									        enabled: false
									    },
							
									    // the value axis
									    yAxis: {
									        stops: [
									            [0.0, '#55BF3B'], // green
									            [0.1, '#DDDF0D'], // yellow
									            [0.2, '#DF5353'] // red
									        ],
									        lineWidth: 0,
									        minorTickInterval: null,
									        tickAmount: 2,
									        title: {
									            y: -70
									        },
									        labels: {
									            y: 16
									        }
									    },
							
									    plotOptions: {
									        solidgauge: {
									            dataLabels: {
									                y: 5,
									                borderWidth: 0,
									                useHTML: true
									            }
									        }
									    }
									};
							
								
									
									// The speed gauge
									var jaugeTemp = Highcharts.chart('jauge_temp', Highcharts.merge(gaugeOptions, {
									    yAxis: {
									        min: 0,
									        max: 35,
									        title: {
									            text: ''
									        }
									    },
							
									    credits: {
									        enabled: false
									    },
							
									    series: [{
									        name: '',
									        data: [0],
									        dataLabels: {
									            format: '<div style="text-align:center"><span style="font-size:25px;color:' +
									                ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
									                   '<span style="font-size:12px;color:silver">°C</span></div>'
									        },
									        tooltip: {
									            valueSuffix: ' °C'
									        }
									    }]
							
									}));
							
									/*
									// Bring life to the dials
									setInterval(function () {
										var temperature = "<s:property value='ti.temperature_ext'/>";
									    // Speed
									    var point,
									        newVal,
									        inc;
									
									    if (jaugeTemp) {
									        point = jaugeTemp.series[0].points[0];
									        inc = parseFloat(temperature);
									        newVal = inc;
									        console.log(newVal)
											
									        if (newVal < 0 || newVal > 200) {
									            newVal = point.y - inc;
									        }
											
									        point.update(newVal);
									    }
									}, 3000);
									*/
									
									
									
								</script>
								
								
                            </div>
                        </div>
                   </div>
                   <div class="col-md-3">
                        <div class="panel panel-info panel">
                            <div class="panel-heading bg-green ">
                                <div class="panel-title "><img src="assets/img/HYGRO.png" width="35" height="45" alt="" class="ti-icon" /><s:text name="ti.hygrometrie"/></div>
                            </div>
                            <div class="panel-body">
                            	<div class="etat_line ti-text"><div class="horizontal-spaces"><span id="hygrometrie"><s:property value="ti.hygrometrie"/></span>%</div><div class="horizontal-spaces"> <s:text name="ti.min"/> : <span id="minhygr"><s:property value="minhygr"/></span>%</div><div class="horizontal-spaces"> <s:text name="ti.max"/> : <span id="maxhygr"><s:property value="maxhygr"/></span>%</div><div class="horizontal-spaces"> <s:text name="ti.moyenne"/> : <span id="avghygr"><s:property value="avghygr"/></span>%</div></div>
                            	<!--
                            	<canvas id="canvhygr" width="230" height="200"></canvas> 
                            	 -->
                            	 
                            	 <ul class="nav nav-tabs">
								  <li class="active"><a href="#tab21" data-toggle="tab">Compteur</a></li>
								  <li><a href="#tab22" data-toggle="tab">Courbe</a></li>
								</ul>
								<div class="tab-content">
								  <div class="tab-pane active" id="tab21">
                            	 	<div id="jauge_hygr" style="width: 100%; height: 250px; float: left"></div>
								  </div>
								  <div class="tab-pane" id="tab22">
								  	<div id="chart_hygr" style="width: 230px; height: 250px; float: left"></div>
								  	
								  </div>
								</div>
                            	 <script type="text/javascript">
						  	
						  		var chartHygr = Highcharts.chart('chart_hygr', {
								chart: {
									type: 'spline',
									animation: Highcharts.svg, // don't animate in old IE
									marginRight: 10,
									/*
									events: {
										load: function () {
											var series = this.series[0];
													var x = (new Date()).getTime(); // current time
													var y = 0;
													series.addPoint([x, y], true, true);
										}
									}*/
								},
								title: {
									text: 'Hygrométrie'
								},
								xAxis: {
									type: 'datetime'
								},
								yAxis: {
									title: {
										text: '%'
									},
									plotBands: [{ // Light air
								        from: 0,
								        to: 60,
								        color: 'rgba(0, 255, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											},{ // Light air
								        from: 60,
								        to: 80,
								        color: 'rgba(255, 153, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											},{ // Light air
								        from: 80,
								        to: 100,
								        color: 'rgba(255, 0, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											}],
									plotLines: [{
										value: 0,
										width: 1,
										color: '#808080'
									}],
									min: 0,     
									max: 100
								},
								tooltip: {
									formatter: function () {
										return '<b>' + this.series.name + '</b><br/>' +
											Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
											Highcharts.numberFormat(this.y, 2);
									}
								},
								plotOptions: {
								    series: {
								        marker: {
								            enabled: false
								        }
								    }
								},
								legend: {
									enabled: false
								},
								exporting: {
									enabled: false
								},
								series: [{
									name: 'Hygrométrie',
									data: (function () {
										// generate an array of random data
										var data = [],
											time = (new Date()).getTime(),
											i;

										for (i = -10; i <= 0; i += 1) {
											data.push({
												x: time + i * 2000,
												y: 0
											});
										}
										return data;
									}())
								}]
							});
						  	
						  	</script>
                            	 
                            	 <script>
								 		var gaugeOptions = {
										
									    chart: {
									        type: 'solidgauge'
									    },
							
									    title: null,
							
									    pane: {
									    	center: ['50%', '70%'],
									        size: '100%',
									        startAngle: -90,
									        endAngle: 90,
									        background: {
									            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
									            innerRadius: '60%',
									            outerRadius: '100%',
									            shape: 'arc'
									        }
									    },
							
									    tooltip: {
									        enabled: false
									    },
							
									    // the value axis
									    yAxis: {
									        stops: [
									            [0.5, '#55BF3B'], // green
									            [0.8, '#DDDF0D'], // yellow
									            [0.95, '#DF5353'] // red
									        ],
									        lineWidth: 0,
									        minorTickInterval: null,
									        tickAmount: 2,
									        title: {
									            y: -70
									        },
									        labels: {
									            y: 16
									        }
									    },
							
									    plotOptions: {
									        solidgauge: {
									            dataLabels: {
									                y: 5,
									                borderWidth: 0,
									                useHTML: true
									            }
									        }
									    }
									};
							
									
									// The speed gauge
									var jaugeHygr = Highcharts.chart('jauge_hygr', Highcharts.merge(gaugeOptions, {
									    yAxis: {
									        min: 0,
									        max: 100,
									        title: {
									            text: ''
									        }
									    },
							
									    credits: {
									        enabled: false
									    },
							
									    series: [{
									        name: '',
									        data: [0],
									        dataLabels: {
									            format: '<div style="text-align:center"><span style="font-size:25px;color:' +
									                ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
									                   '<span style="font-size:12px;color:silver">%</span></div>'
									        },
									        tooltip: {
									            valueSuffix: ' %'
									        }
									    }]
							
									}));
							
									/*
									// Bring life to the dials
									setInterval(function () {
										var hygrometrie = "<s:property value='ti.hygrometrie'/>";									    // Speed
									    var point,
									        newVal,
									        inc;
									
									    if (jaugeHygr) {
									        point = jaugeHygr.series[0].points[0];
									        inc = parseFloat(hygrometrie);
									        newVal = inc;
											
									        if (newVal < 0 || newVal > 200) {
									            newVal = point.y - inc;
									        }
											
									        point.update(newVal);
									    }
									}, 1000);
									*/
									
									
									
								</script>
								
								
                            	 
                            	 
                            </div>
                        </div>
                   </div>
                   <div class="col-md-3">
                        <div class="panel panel-info panel">
                            <div class="panel-heading bg-green ">
                                <div class="panel-title "><img src="assets/img/bright-lightbulb.png" width="45" height="45" alt="" class="ti-icon" /><s:text name="ti.luminosite"/> </div>
                            </div>
                            <div class="panel-body">
                            	<div class="etat_line ti-text"><div class="horizontal-spaces"><span id="luminosite"><s:property value="ti.lux"/></span> lux</div><div class="horizontal-spaces"> <s:text name="ti.min"/> : <span id="minlumi"><s:property value="minlumi"/></span> lux</div><div class="horizontal-spaces"> <s:text name="ti.max"/> : <span id="maxlumi"><s:property value="maxlumi"/></span> lux</div><div class="horizontal-spaces"> <s:text name="ti.moyenne"/> : <span id="avglumi"><s:property value="avglumi"/></span> lux</div></div>
                            	<!-- 
                            	<canvas id="canvlumi" width="230" height="200"></canvas>
                            	 -->
                            	 
                            	 
                            	 <ul class="nav nav-tabs">
								  <li class="active"><a href="#tab31" data-toggle="tab">Compteur</a></li>
								  <li><a href="#tab32" data-toggle="tab">Courbe</a></li>
								</ul>
								<div class="tab-content">
								  <div class="tab-pane active" id="tab31">
                            	 	<div id="jauge_lumi" style="width: 100%; height: 250px; float: left"></div>
								  </div>
								  <div class="tab-pane" id="tab32">
								  	<div id="chart_lumi" style="width: 230px; height: 250px; float: left"></div>
								  	
								  </div>
								</div>
                            	 <script type="text/javascript">
						  	
						  		var chartLumi = Highcharts.chart('chart_lumi', {
								chart: {
									type: 'spline',
									animation: Highcharts.svg, // don't animate in old IE
									marginRight: 10,
									/*
									events: {
										load: function () {
											var series = this.series[0];
													var x = (new Date()).getTime(); // current time
													var y = 0;
													series.addPoint([x, y], true, true);
										}
									}*/
								},
								title: {
									text: 'Luminosité'
								},
								xAxis: {
									type: 'datetime'
								},
								yAxis: {
									title: {
										text: 'lux'
									},
									plotBands: [{ // Light air
								        from: 0,
								        to: 2000,
								        color: 'rgba(0, 255, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											},{ // Light air
								        from: 2000,
								        to: 5000,
								        color: 'rgba(255, 153, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											},{ // Light air
								        from: 5000,
								        to: 15000,
								        color: 'rgba(255, 0, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											}],
									plotLines: [{
										value: 0,
										width: 1,
										color: '#808080'
									}],
									min: 0,     
									max: 15000
								},
								tooltip: {
									formatter: function () {
										return '<b>' + this.series.name + '</b><br/>' +
											Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
											Highcharts.numberFormat(this.y, 2);
									}
								},
								plotOptions: {
								    series: {
								        marker: {
								            enabled: false
								        }
								    }
								},
								legend: {
									enabled: false
								},
								exporting: {
									enabled: false
								},
								series: [{
									name: 'Luminosité',
									data: (function () {
										// generate an array of random data
										var data = [],
											time = (new Date()).getTime(),
											i;

										for (i = -10; i <= 0; i += 1) {
											data.push({
												x: time + i * 2000,
												y: 0
											});
										}
										return data;
									}())
								}]
							});
						  	
						  	</script>
                            	 
                            	 <script>
								 		var gaugeOptions = {
										
									    chart: {
									        type: 'solidgauge'
									    },
							
									    title: null,
							
									    pane: {
									    	center: ['50%', '70%'],
									        size: '100%',
									        startAngle: -90,
									        endAngle: 90,
									        background: {
									            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
									            innerRadius: '60%',
									            outerRadius: '100%',
									            shape: 'arc'
									        }
									    },
							
									    tooltip: {
									        enabled: false
									    },
							
									    // the value axis
									    yAxis: {
									        stops: [
									            [0.1, '#55BF3B'], // green
									            [0.5, '#DDDF0D'], // yellow
									            [0.9, '#DF5353'] // red
									        ],
									        lineWidth: 0,
									        minorTickInterval: null,
									        tickAmount: 2,
									        title: {
									            y: -70
									        },
									        labels: {
									            y: 16
									        }
									    },
							
									    plotOptions: {
									        solidgauge: {
									            dataLabels: {
									                y: 5,
									                borderWidth: 0,
									                useHTML: true
									            }
									        }
									    }
									};
							
									
									// The speed gauge
									var jaugeLumi = Highcharts.chart('jauge_lumi', Highcharts.merge(gaugeOptions, {
									    yAxis: {
									        min: 0,
									        max: 15000,
									        title: {
									            text: ''
									        }
									    },
							
									    credits: {
									        enabled: false
									    },
							
									    series: [{
									        name: '',
									        data: [0],
									        dataLabels: {
									            format: '<div style="text-align:center"><span style="font-size:25px;color:' +
									                ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
									                   '<span style="font-size:12px;color:silver">lux</span></div>'
									        },
									        tooltip: {
									            valueSuffix: ' lux'
									        }
									    }]
							
									}));
							
									/*
									// Bring life to the dials
									setInterval(function () {
										var luminosite = "<s:property value='ti.lux'/>";									    // Speed
									    var point,
									        newVal,
									        inc;
									
									    if (jaugeLumi) {
									        point = jaugeLumi.series[0].points[0];
									        inc = parseFloat(luminosite);
									        newVal = inc;
											
									        if (newVal < 0 || newVal > 200) {
									            newVal = point.y - inc;
									        }
											
									        point.update(newVal);
									    }
									}, 1000);
									*/
									
									
								</script>
                            </div>
                        </div>
                   </div>
                   <div class="col-md-3">
                        <div class="panel panel-info panel">
                            <div class="panel-heading bg-green ">
                                <div class="panel-title "><img src="assets/img/explosive.png" width="45" height="45" alt="" class="ti-icon" /><s:text name="ti.chocs"/></div>
                            </div>
                            <div class="panel-body">
                            	<div class="etat_line ti-text"><div class="horizontal-spaces">x : <span id="accx"><s:property value="ti.acceleration_x"/></span> g / y : <span id="accy"><s:property value="ti.acceleration_y"/></span> g / z : <span id="accz"><s:property value="ti.acceleration_z"/></span> g</div><div class="horizontal-spaces"> <s:text name="ti.norme"/> : <span id="norm"><s:property value="global_acc"/></span> g</div><div class="horizontal-spaces">-</div><div class="horizontal-spaces">-</div></div>
                            	<!--
                            	<canvas id="canvchoc" width="230" height="200"></canvas>
                            	-->
                            	
                            	
                            	
                            	
                            	 <ul class="nav nav-tabs">
								  <li class="active"><a href="#tab41" data-toggle="tab">Compteur</a></li>
								  <li><a href="#tab42" data-toggle="tab">Courbe</a></li>
								</ul>
								<div class="tab-content">
								  <div class="tab-pane active" id="tab41">
                            	 <div id="jauge_norm" style="width: 100%; height: 250px; float: left"></div>
								  </div>
								  <div class="tab-pane" id="tab42">
								  	<div id="chart_norm" style="width: 230px; height: 250px; float: left"></div>
								  	
								  </div>
								</div>
                            	 <script type="text/javascript">
						  	
						  		var chartNorm = Highcharts.chart('chart_norm', {
								chart: {
									type: 'spline',
									animation: Highcharts.svg, // don't animate in old IE
									marginRight: 10,
									/*
									events: {
										load: function () {
											var series = this.series[0];
													var x = (new Date()).getTime(); // current time
													var y = 0;
													series.addPoint([x, y], true, true);
										}
									}*/
								},
								title: {
									text: 'Vibrations'
								},
								xAxis: {
									type: 'datetime'
								},
								yAxis: {
									title: {
										text: 'g'
									},
									plotBands: [{ // Light air
								        from: 0,
								        to: 1,
								        color: 'rgba(0, 255, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											},{ // Light air
								        from: 1,
								        to: 2,
								        color: 'rgba(255, 153, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											},{ // Light air
								        from: 2,
								        to: 4,
								        color: 'rgba(255, 0, 0, 0.2)',
								        label: {
								            style: {
								                color: '#606060'
								            }
								        }
											}],
									plotLines: [{
										value: 0,
										width: 1,
										color: '#808080'
									}],
									min: 0,     
									max: 4
								},
								tooltip: {
									formatter: function () {
										return '<b>' + this.series.name + '</b><br/>' +
											Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
											Highcharts.numberFormat(this.y, 2);
									}
								},
								plotOptions: {
								    series: {
								        marker: {
								            enabled: false
								        }
								    }
								},
								legend: {
									enabled: false
								},
								exporting: {
									enabled: false
								},
								series: [{
									name: 'Vibrations',
									data: (function () {
										// generate an array of random data
										var data = [],
											time = (new Date()).getTime(),
											i;

										for (i = -10; i <= 0; i += 1) {
											data.push({
												x: time + i * 2000,
												y: 0
											});
										}
										return data;
									}())
								}]
							});
						  	
						  	</script>
                            	 
                            	 <script>
								 		var gaugeOptions = {
										
									    chart: {
									        type: 'solidgauge'
									    },
							
									    title: null,
							
									    pane: {
									    	center: ['50%', '70%'],
									        size: '100%',
									        startAngle: -90,
									        endAngle: 90,
									        background: {
									            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
									            innerRadius: '60%',
									            outerRadius: '100%',
									            shape: 'arc'
									        }
									    },
							
									    tooltip: {
									        enabled: false
									    },
							
									    // the value axis
									    yAxis: {
									        stops: [
									            [0.1, '#55BF3B'], // green
									            [0.5, '#DDDF0D'], // yellow
									            [0.9, '#DF5353'] // red
									        ],
									        lineWidth: 0,
									        minorTickInterval: null,
									        tickAmount: 2,
									        title: {
									            y: -70
									        },
									        labels: {
									            y: 16
									        }
									    },
							
									    plotOptions: {
									        solidgauge: {
									            dataLabels: {
									                y: 5,
									                borderWidth: 0,
									                useHTML: true
									            }
									        }
									    }
									};
							
									
									// The speed gauge
									var jaugeNorm = Highcharts.chart('jauge_norm', Highcharts.merge(gaugeOptions, {
									    yAxis: {
									        min: 0,
									        max: 4,
									        title: {
									            text: ''
									        }
									    },
							
									    credits: {
									        enabled: false
									    },
							
									    series: [{
									        name: '',
									        data: [0],
									        dataLabels: {
									            format: '<div style="text-align:center"><span style="font-size:25px;color:' +
									                ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
									                   '<span style="font-size:12px;color:silver">g</span></div>'
									        },
									        tooltip: {
									            valueSuffix: ' g'
									        }
									    }]
							
									}));
							
									/*
									// Bring life to the dials
									setInterval(function () {
										var norme = "<s:property value ='global_acc'/>";								    // Speed
									    var point,
									        newVal,
									        inc;
									
									    if (jaugeNorm) {
									        point = jaugeNorm.series[0].points[0];
									        inc = parseFloat(norme);
									        newVal = inc;
											
									        if (newVal < 0 || newVal > 200) {
									            newVal = point.y - inc;
									        }
											
									        point.update(newVal);
									    }
									}, 1000);
									*/
									
									
								</script>
                            </div>
                        </div>
                   </div>
                </div>
                
                <div class="maxwidth">
                	<div class="panel panel-info panel">
                            <div class="panel-heading bg-green" data-toggle="collapse" data-target="#demo">
                                <div class="panel-title ">RCR</div>
                            </div>
                            <div class="panel-body" id="demo" class="collapse">
                	   
						
						<div id="chart_rcr" style="width: 100%; float: left"></div>
						
						<script type="text/javascript">
						  	
						  		var chartRcr = Highcharts.chart('chart_rcr', {
								chart: {
									type: 'spline',
									animation: Highcharts.svg, // don't animate in old IE
									marginRight: 10,
									/*
									events: {
										load: function () {
											var series = this.series[0];
													var x = (new Date()).getTime(); // current time
													var y = 0;
													series.addPoint([x, y], true, true);
										}
									}*/
								},
								title: {
									text: 'RCR'
								},
								xAxis: {
									type: 'datetime'
								},
								yAxis: {
									title: {
										text: '%'
									},
									plotLines: [{
										value: 0,
										width: 1,
										color: '#808080'
									}],
									min: 0,     
									max: 100
								},
								tooltip: {
									formatter: function () {
										return '<b>' + this.series.name + '</b><br/>' +
											Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
											Highcharts.numberFormat(this.y, 2);
									}
								},
								plotOptions: {
								    series: {
								        marker: {
								            enabled: false
								        }
								    }
								},
								legend: {
									enabled: false
								},
								exporting: {
									enabled: false
								},
								series: [{
									name: 'RCR',
									data: [],
									color: '#000000'
								},{
									name: 'Vert',
									data: [],
									color: '#28C6AF' 
								},{
									name: 'Jaune',
									data: [],
									color: '#FFD837'
								},{
									name:'Rouge',
									data: [],
									color: '#E6443C'
								}]
							});
						  	
						  	</script>
					
						</div>
					</div>
				        
                
                </div>
                        
                
                
                <div class="col-md-4 left">
					<label for="box"><s:text name="general.majauto"/></label>
					<input type="checkbox" id="box"/>
				</div>
        	</div>
        	
        	</div>
        	<div class="col-md-1 right">
                <s:a action="informationlot.action"><s:param name="id_lot"><s:property value="detailSurLot.id" /></s:param>
                    <div class="btn bg-black btn-retour-ec6 "><s:text name="detail.retour"/></div>
                </s:a>
                <!-- end row maxwidth -->
            </div>
            <footer>
            <a href="http://biotraq.fr" target="_blank" class="alignright">http://biotraq.fr</a>
        		</footer>
    	</s:else>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    	<script type="text/javascript">
    		var $_GET=[];
    		window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,function(a,name,value){$_GET[name]=value;});
    		//Récupère les valeurs
    		var temperature = "<s:property value='ti.temperature_ext'/>";
    		var maxtemperature = "<s:property value='maxtemp'/>";
    		var mintemperature = "<s:property value='mintemp'/>";
    		var avgtemperature = "<s:property value='avgtemp'/>";
    		var hygrometrie = "<s:property value='ti.hygrometrie'/>";
    		var maxhygrometrie = "<s:property value='maxhygr'/>";
    		var minhygrometrie = "<s:property value='minhygr'/>";
    		var avghygrometrie = "<s:property value='avghygr'/>";
    		var luminosite = "<s:property value='ti.lux'/>";
    		var maxluminosite = "<s:property value='maxlumi'/>";
    		var minluminosite = "<s:property value='minlumi'/>";
    		var avgluminosite = "<s:property value='avglumi'/>";
    		var accx = "<s:property value='ti.acceleration_x'/>";
    		var accy = "<s:property value='ti.acceleration_y'/>";
    		var accz = "<s:property value='ti.acceleration_z'/>";
    		var norme = "<s:property value ='global_acc'/>" - 1;
			$(document).ready(function() {
				console.log('ready')
				$("#box").change(function() {
					if($("#box").attr("checked"))
						console.log('checked change')
						load_charts();
				});
				drawSpeedometers();
				setTimeout(load_charts, 2000);
			});
			

			var start_time = 0;
			var stop_time = 0;
			
			function load_charts() {
				console.log('load_charts');
				if(document.getElementById("box").checked) {
					console.log('checked')
					if (start_time == 0) {
						start_time = (new Date()).getTime();
						stop_time = (start_time + 120*60000);
						series_g = chartRcr.series[1];
						series_g.addPoint([start_time, 100]);
						series_g.addPoint([stop_time, 0]);
						series_o = chartRcr.series[2];
						series_o.addPoint([start_time, 90]);
						series_o.addPoint([stop_time, -10]);
						series_r = chartRcr.series[3];
						series_r.addPoint([start_time, 75]);
						series_r.addPoint([stop_time, -25]);
					}
					var xmlhttp = new XMLHttpRequest();
			        xmlhttp.onreadystatechange = function() {
				        if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					        //Réponse du serveur
				        	var response = xmlhttp.responseText;
				        	console.log(xmlhttp)
				        	//Mise à jour du texte
				        	temperature = $(response).find("#temperature").text();
				        	maxtemperature = $(response).find("#maxtemperature").text();
				        	mintemperature = $(response).find("#mintemperature").text();
				        	avgtemperature = $(response).find("#avgtemperature").text();
				        	hygrometrie = $(response).find("#hygrometrie").text();
				        	maxhygrometrie = $(response).find("#maxhygrometrie").text();
				        	minhygrometrie = $(response).find("#minhygrometrie").text();
				        	avghygrometrie = $(response).find("#avghygrometrie").text();
				        	luminosite = $(response).find("#luminosite").text();
				        	maxluminosite = $(response).find("#maxluminosite").text();
				        	minluminosite = $(response).find("#minluminosite").text();
				        	avgluminosite = $(response).find("#avgluminosite").text();
				        	accx = $(response).find("#accx").text();
				        	accy = $(response).find("#accy").text();
				        	accz = $(response).find("#accz").text();
				        	norme = $(response).find("#norm").text() - 1;
				        	
				        	if (jaugeTemp) {
						        point = jaugeTemp.series[0].points[0];
						        inc = parseFloat(Number(parseFloat(temperature)).toFixed(2));
						        newVal = inc;
						        point.update(newVal);
						    }
				        	if (jaugeHygr) {
						        point = jaugeHygr.series[0].points[0];
						        inc = parseFloat(Number(parseFloat(hygrometrie)).toFixed(2));
						        newVal = inc;
						        point.update(newVal);
						    }
				        	if (jaugeLumi) {
						        point = jaugeLumi.series[0].points[0];
						        inc = parseFloat(Number(parseFloat(luminosite)).toFixed(2));
						        newVal = inc;
						        point.update(newVal);
						    }
				        	if (jaugeNorm) {
						        point = jaugeNorm.series[0].points[0];
						        if(norme > 0) {
						        	inc = parseFloat(Number(parseFloat(norme)).toFixed(2));
						        	console.log(inc)
						        } else {
						        	inc = 0
						        }
						        
						        newVal = inc;
						        point.update(newVal);
						    }
				        	
				        	if (chartRcr) {
				        		series = chartRcr.series[0];
								x = (new Date()).getTime(); // current time
								T = parseFloat(temperature)
								t = x - start_time
								rcr = 100*Math.exp(-0.5*T/4*t/(120*60000))*(120*60000-t)/(120*60000);
								console.log(rcr)
								y = parseFloat(Number(parseFloat(rcr)).toFixed(2));
								series.addPoint([x, y]);
				        	}
				        	
				        	if (chartTemp) {
				        		series = chartTemp.series[0];
								x = (new Date()).getTime(); // current time
								y = parseFloat(Number(parseFloat(temperature)).toFixed(2));
								series.addPoint([x, y], true, true);
				        	}
				        	
				        	if (chartHygr) {
				        		series = chartHygr.series[0];
								x = (new Date()).getTime(); // current time
								y = parseFloat(Number(parseFloat(hygrometrie)).toFixed(2));
								series.addPoint([x, y], true, true);
				        	}
				        	
				        	if (chartLumi) {
				        		series = chartLumi.series[0];
								x = (new Date()).getTime(); // current time
								y = parseFloat(Number(parseFloat(luminosite)).toFixed(2));
								series.addPoint([x, y], true, true);
				        	}
				        	
				        	if (chartNorm) {
				        		series = chartNorm.series[0];
								x = (new Date()).getTime(); // current time
								if(norme > 0) {
						        	y = parseFloat(Number(parseFloat(norme)).toFixed(2));
						        } else {
						        	y = 0
						        }
								series.addPoint([x, y], true, true);
				        	}
				        	//Mise à jour du compteur
					        $("canvas").each(function() {
								$(this).get(0).getContext("2d").clearRect(0, 0, $(this).attr("width"), $(this).attr("height"));
						    });
				    		drawSpeedometers();
				    		setTimeout(load_charts, 2000);
				        }
			        };
			      //Demande au serveur de rafraîchir les informations
				    xmlhttp.open("GET", "tiajax.action?id_lot=" + $_GET["id_lot"], true);
				    xmlhttp.send();
				}
			}

			 //Dessin du compteur
			function drawSpeedometers() {
				$("#temperature").text(temperature);
				$("#maxtemp").text(maxtemperature);
				$("#mintemp").text(mintemperature);
				$("#avgtemp").text(avgtemperature);
				$("#hygrometrie").text(hygrometrie);
				$("#maxhygr").text(maxhygrometrie);
				$("#minhygr").text(minhygrometrie);
				$("#avghygr").text(avghygrometrie);
				$("#luminosite").text(luminosite);
				$("#maxlumi").text(maxluminosite);
				$("#minlumi").text(minluminosite);
				$("#avglumi").text(avgluminosite);
				$("#avglumi").text(avgluminosite);
				$("#accx").text(accx);
				$("#accy").text(accy);
				$("#accz").text(accz);
				$("#norm").text(norme);
				var compteur = new Image();
				var aiguille = new Image();
				compteur.src = "/biotraq/assets/img/speedometer-BTQ.png";
				aiguille.src = "/biotraq/assets/img/aiguille-speedometer-BTQ2.png";
				compteur.onload = function() {
					//aiguille.onload = function() {
					$("canvas").each(function() {
						var context = $(this).get(0).getContext('2d');
						context.drawImage(compteur, 20, 0, 200, 200);
						var angle = 0;
						//angle e [-130 ; 80]
						//milieu = -25
						if($(this).attr("id") == "canvtemp") {
							if(temperature > 0) {
								angle = Math.max(-130, Math.min(80, parseFloat(temperature) * 7 - 158));
							}
							else {
								angle = 80;
							}
						}
						else if($(this).attr("id") == "canvhygr") {
							angle = Math.max(-130, Math.min(80, parseFloat(hygrometrie) * 2.1 - 130));
						}
						else if($(this).attr("id") == "canvlumi") {
							angle = Math.max(-130, Math.min(80, parseFloat(luminosite) * 2 - 130));   //0.042
						}
						else if($(this).attr("id") == "canvchoc") {
							angle = Math.max(-130, Math.min(80, parseFloat(norme) * 8.4 - 130));;
						}
						drawRotatedImage(aiguille, 120, 130, 100, 100, angle);
						function drawRotatedImage(image, x, y, w, h, angle) {
				    		context.save();
				    		context.translate(x, y);
				    		context.rotate(angle * Math.PI / 180);
				    		context.drawImage(image, -(w/2), -(h/2), w, h);
				    		context.restore(); 
				    	}
					});//}
				}
			}
			 
			 
			
			 
			 
    	</script>
    	
    	
	</body>
</html>