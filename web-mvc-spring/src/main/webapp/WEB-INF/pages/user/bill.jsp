<%@ include file="/common/taglibs.jsp" %>

<head>
    <title><fmt:message key="bill.title"/></title>
    <meta name="menu" content="PersonalMenu"/>
    
    <script src="/scripts/echarts.simple.min.js"></script>
</head>

<c:if test="${not empty searchError}">
    <div class="alert alert-danger alert-dismissable">
        <a href="#" data-dismiss="alert" class="close">&times;</a>
        <c:out value="${searchError}"/>
    </div>
</c:if>
<div class="container">
	<div class="row">
		<div class="col-sm-3">
			<div class="panel panel-primary">
				<div class="panel-heading">
			        <h3 class="panel-title"><fmt:message key="bill.menu.store" /></h3>
			    </div>
			    <div class="panel-body">
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.store.income" /></a> | 
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.store.expense" /></a><br />
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.store.detail" /></a>
			    </div>
			    <div class="panel-heading">
			        <h3 class="panel-title"><fmt:message key="bill.menu.account" /></h3>
			    </div>
			    <div class="panel-body">
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.account.store" /></a> | 
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.account.debit" /></a><br />
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.store.detail" /></a> |
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.account.stock" /></a><br />
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.account.financial" /></a>
			    </div>
			    <div class="panel-heading">
			        <h3 class="panel-title"><fmt:message key="bill.menu.debit" /></h3>
			    </div>
			    <div class="panel-body">
					<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.debit.add" /></a> | 
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.debit.giveback" /></a>
			    </div>
			    <div class="panel-heading">
			        <h3 class="panel-title"><fmt:message key="bill.menu.dc" /></h3>
			    </div>
			    <div class="panel-body">
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.dc.giveback" /></a>
			    </div>
			    <div class="panel-heading">
			        <h3 class="panel-title"><fmt:message key="bill.menu.stock" /></h3>
			    </div>
			    <div class="panel-body">
					<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.stock.transin" /></a> |
					<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.stock.transout" /></a> |
					<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.stock.buy" /></a> | 
					<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.stock.sell" /></a>
			    </div>
			    <div class="panel-heading">
			        <h3 class="panel-title"><fmt:message key="bill.menu.account.financial" /></h3>
			    </div>
			    <div class="panel-body">
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.financial.subscribe" /></a> |
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.financial.redeem" /></a>
			    </div>
			    
			    <div class="panel-heading">
			        <h3 class="panel-title"><fmt:message key="bill.menu.plan" /></h3>
			    </div>
			    <div class="panel-body">
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.plan.income" /></a> |
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.plan.expense" /></a><br>
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.plan.money" /></a> |
			    </div>
			    
			    <div class="panel-heading">
			        <h3 class="panel-title"><fmt:message key="bill.menu.system" /></h3>
			    </div>
			    <div class="panel-body">
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.system.dict" /></a> |
			    	<a href="<c:url value='/userform'/>"><fmt:message key="bill.menu.system.salary" /></a>
			    </div>
			</div>
		</div>
		<div class="col-sm-9">
			<div class="panel panel-primary">
			 <div class="panel-heading">
			        <h3 class="panel-title"><fmt:message key="bill.statistics" /> </h3>
			  </div>
			  <div class="panel-body">
			  	<fmt:message key="bill.statistics.store" /> = 0 <br>
			  	<fmt:message key="bill.statistics.dc" /> = 0 | <fmt:message key="bill.statistics.dc.limit" /> = 0<br>
			  	<fmt:message key="bill.statistics.debit" /> = 0 | <fmt:message key="bill.statistics.debit.limit" /> = 0<br>
			  	<fmt:message key="bill.statistics.stock" /> = 0 | <fmt:message key="bill.statistics.stock.position" /> = 0<br>
			  	<fmt:message key="bill.statistics.financial" /> = 0<br>
			  	<fmt:message key="bill.statistics.total" /> = 0 | <fmt:message key="bill.statistics.total.store" /> = 0 | <fmt:message key="bill.statistics.total.financial" /> = 0<br>
			  	<fmt:message key="bill.statistics.total.debit" /> = 0 | <fmt:message key="bill.statistics.total.stock" /> = 0 | <fmt:message key="bill.statistics.total.stock.position" /> = 0
			  </div>
			  
			  <div class="panel-body">
			  	<div class="row">
			  		<div class="col-sm-4 ">
			  			<div class="panel panel-primary">
				  			<div class="panel-heading">
						        <h3 class="panel-title"><fmt:message key="bill.charts.money" /> </h3>
						  </div>
				  			<div class="panel-body" id="statistics_money" style="height:200px"></div>
				  		</div>
			  		</div>
			  		
			  		<div class="col-sm-4 ">
			  			<div class="panel panel-primary">
				  			<div class="panel-heading">
						        <h3 class="panel-title"><fmt:message key="bill.charts.month.income" /> </h3>
						  </div>
				  			<div id="statistics_monty_income" class="panel-body" style="height:200px">
				  				
				  			</div>
				  		</div>
			  		</div>
			  		
			  		<div class="col-sm-4 ">
			  			<div class="panel panel-primary">
				  			<div class="panel-heading">
						        <h3 class="panel-title"><fmt:message key="bill.charts.year.income" /> </h3>
						  </div>
				  			<div id="statistics_year_income" class="panel-body" style="height:200px">
				  				
				  			</div>
				  		</div>
			  		</div>
			  	</div>
			  	
			  	<div class="row">
			  		<div class="col-sm-4 ">
			  			<div class="panel panel-primary">
				  			<div class="panel-heading">
						        <h3 class="panel-title"><fmt:message key="bill.charts.month.expense" /> </h3>
						  </div>
				  			<div class="panel-body" id="statistics_month_expense" style="height:200px"></div>
				  		</div>
			  		</div>
			  		
			  		<div class="col-sm-4 ">
			  			<div class="panel panel-primary">
				  			<div class="panel-heading">
						        <h3 class="panel-title"><fmt:message key="bill.charts.year.expense" /> </h3>
						  </div>
				  			<div id="statistics_year_expense" class="panel-body" style="height:200px">
				  				
				  			</div>
				  		</div>
			  		</div>
			  		
			  		<div class="col-sm-4 ">
			  			<div class="panel panel-primary">
				  			<div class="panel-heading">
						        <h3 class="panel-title"><fmt:message key="bill.charts.salary" /> </h3>
						  </div>
				  			<div id="statistics_salary" class="panel-body" style="height:200px">
				  				
				  			</div>
				  		</div>
			  		</div>
			  	</div>
			  	</div>
			  	<div class="panel-heading">
			        <h3 class="panel-title"><fmt:message key="bill.report.account" /> </h3>
			   </div>
			   <div class="panel-body">
			  				<display:table name="userList" cellspacing="0" cellpadding="0" requestURI=""
						                   defaultsort="1" id="users" pagesize="25" class="table table-condensed table-striped table-hover" export="true">
						        <display:column property="username" escapeXml="true" sortable="true" titleKey="user.username" style="width: 25%"
						                        url="/userform?from=list" paramId="id" paramProperty="id"/>
						        <display:column property="fullName" escapeXml="true" sortable="true" titleKey="activeUsers.fullName"
						                        style="width: 34%"/>
						        <display:column property="email" sortable="true" titleKey="user.email" style="width: 25%" autolink="true"
						                        media="html"/>
						        <display:column property="email" titleKey="user.email" media="csv xml excel pdf"/>
						        <display:column sortProperty="enabled" sortable="true" titleKey="user.enabled"
						                        style="width: 16%; padding-left: 15px" media="html">
						            <input type="checkbox" disabled="disabled" <c:if test="${users.enabled}">checked="checked"</c:if>/>
						        </display:column>
						        <display:column property="enabled" titleKey="user.enabled" media="csv xml excel pdf"/>
						
						        <display:setProperty name="paging.banner.item_name"><fmt:message key="userList.user"/></display:setProperty>
						        <display:setProperty name="paging.banner.items_name"><fmt:message key="userList.users"/></display:setProperty>
						
						        <display:setProperty name="export.excel.filename" value="User List.xls"/>
						        <display:setProperty name="export.csv.filename" value="User List.csv"/>
						        <display:setProperty name="export.pdf.filename" value="User List.pdf"/>
						    </display:table>
			  		</div>
			  	</div>
			  </div>
			</div>
		</div>
<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('statistics_money'));
		var option = {
			    title : {
			        text: 'money',
			        subtext: 'O(∩_∩)O',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient : 'vertical',
			        x : 'left',
			        data:['debit','stock','dc','financial','store']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {
			                show: true, 
			                type: ['pie', 'funnel'],
			                option: {
			                    funnel: {
			                        x: '25%',
			                        width: '50%',
			                        funnelAlign: 'left',
			                        max: 1548
			                    }
			                }
			            },
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    series : [
			        {
			            name:'debit',
			            type:'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:335, name:'debit'},
			                {value:310, name:'stock'},
			                {value:234, name:'dc'},
			                {value:135, name:'financial'},
			                {value:1548, name:'store'}
			            ]
			        }
			    ]
			};
		myChart.setOption(option);
		
		option = {
			    title : {
			        text: '某地区蒸发量和降水量',
			        subtext: '纯属虚构'
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['蒸发量','降水量']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'蒸发量',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'降水量',
			            type:'bar',
			            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
			            markPoint : {
			                data : [
			                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183, symbolSize:18},
			                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name : '平均值'}
			                ]
			            }
			        }
			    ]
			};
		echarts.init(document.getElementById('statistics_monty_income')).setOption(option);
		
		option = {
			    title : {
			        text: 'money',
			        subtext: 'O(∩_∩)O',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient : 'vertical',
			        x : 'left',
			        data:['me','wife']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {
			                show: true, 
			                type: ['pie', 'funnel'],
			                option: {
			                    funnel: {
			                        x: '25%',
			                        width: '50%',
			                        funnelAlign: 'left',
			                        max: 1548
			                    }
			                }
			            },
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    series : [
			        {
			            name:'debit',
			            type:'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:335, name:'me'},
			                {value:310, name:'wife'},
			            ]
			        }
			    ]
			};
		echarts.init(document.getElementById('statistics_year_income')).setOption(option);
		
		option = {
			    title : {
			        text: '某地区蒸发量和降水量',
			        subtext: '纯属虚构'
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['蒸发量','降水量']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'蒸发量',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'降水量',
			            type:'bar',
			            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
			            markPoint : {
			                data : [
			                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183, symbolSize:18},
			                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name : '平均值'}
			                ]
			            }
			        }
			    ]
			};
		echarts.init(document.getElementById('statistics_month_expense')).setOption(option);
		
		option = {
			    title : {
			        text: 'money',
			        subtext: 'O(∩_∩)O',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient : 'vertical',
			        x : 'left',
			        data:['cellphone','live','net','clothes','insurance']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {
			                show: true, 
			                type: ['pie', 'funnel'],
			                option: {
			                    funnel: {
			                        x: '25%',
			                        width: '50%',
			                        funnelAlign: 'left',
			                        max: 1548
			                    }
			                }
			            },
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    series : [
			        {
			            name:'debit',
			            type:'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:10, name:'cellphone'},
			                {value:150, name:'live'},
			                {value:10, name:'net'},
			                {value:50, name:'clothes'},
			                {value:50, name:'insurance'}
			            ]
			        }
			    ]
			};
		echarts.init(document.getElementById('statistics_year_expense')).setOption(option);
		
		option = {
			    title : {
			        text: '未来一周气温变化',
			        subtext: '纯属虚构'
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['最高气温','最低气温']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            boundaryGap : false,
			            data : ['周一','周二','周三','周四','周五','周六','周日']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value',
			            axisLabel : {
			                formatter: '{value} °C'
			            }
			        }
			    ],
			    series : [
			        {
			            name:'最高气温',
			            type:'line',
			            data:[11, 11, 15, 13, 12, 13, 10],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'最低气温',
			            type:'line',
			            data:[1, -2, 2, 5, 3, 2, 0],
			            markPoint : {
			                data : [
			                    {name : '周最低', value : -2, xAxis: 1, yAxis: -1.5}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name : '平均值'}
			                ]
			            }
			        }
			    ]
			};
		echarts.init(document.getElementById('statistics_salary')).setOption(option);
</script>