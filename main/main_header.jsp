<jsp:useBean id="fsScreen" scope="request" class="com.fs.dev.library.ScreenUtility"/>
				<div class="navbar-header">					
					<div id="mainmenu" class="my-control-menu menu-class" style="display:none;">
						<a href="javascript:void(0)" class="dropdown-toggle active-trigger" data-toggle="dropdown" id="mainmenutrigger" title="Menu"><i class="fa fa-bars"></i></a>
					</div>
				</div>				
				<div class="navbar-header">
					<div id="homelayer" class="my-control-menu home" style="display:none;"><a href="javascript:void(0)" id="homemenutrigger" title="Home" onclick="goHome()"><i class="fa fa-home"></i></a></div>			
				</div>
				<div class="navbar-header">
					<div id="productlayer" class="product"><img id="productimage" src="images/mypurse.png" width="40" height="40" alt="" /></div>			
				</div>
				<div class="navbar-header">					
					<div id="logolayer" class="logo">
						<a href="javascript:void(0)" id="programtitle" style="text-align: top;cursor: default;">MyPURSE</a>
					</div>
				</div>
				<ul id="navmenuitem" class="nav navbar-nav navbar-right navbar-user">			
					<li class="dropdown user-dropdown" id="usermenuitem" style="display:none;">
						<a href="javascript:void(0)" id="accessor_linker" class="dropdown-toggle" data-toggle="dropdown" title="My Information"><span id="accessor_label">Administrator</span><b class="caret"></b></a>
						<ul class="dropdown-menu">							
							<li><a href="javascript:void(0)" onclick="profileClick()"><i class="fa fa-user"></i>&nbsp;<span id="profile_label">Profile</span></a></li>
							<li><a href="javascript:void(0)" onclick="changeClick()" pendata-toggle="modal" data-target="#changeUserPasswordModal"><i class="fa fa-lock"></i>&nbsp;<span id="changepwd_label">Change Password</span></a></li>
							<li class="divider"></li>
							<li><a href="javascript:void(0)" onclick="logOut()"><i class="fa fa-power-off"></i>&nbsp;<span id="logout_label">Sign Out</span></a></li>
						</ul>
					</li>		
					<li class="dropdown user-dropdown" id="languagemenuitem">
						<a href="javascript:void(0)" id="languagemenuitemlink" class="dropdown-toggle" data-toggle="dropdown">	<img id="languageimage" alt="" src="img/lang/<%=fsScreen.getDefaultLanguage(request,response)%>.png" width="20px" title="Language"><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0)" onclick="$('#languageimage').attr('src','img/lang/EN.png'); fs_switchLanguage('EN',true);"><img alt="" src="img/lang/EN.png" width="20px" title="English"/><span id="englishlanguage" style="padding-left: 15px;">English</span></a></li>
							<li><a href="javascript:void(0)" onclick="$('#languageimage').attr('src','img/lang/TH.png'); fs_switchLanguage('TH',true);"><img alt="" src="img/lang/TH.png" width="20px" title="Thai"/><span id="thailanguage" style="padding-left: 15px;">Thai</span></a></li>
						</ul>
					</li>
				</ul>
				<div class="navbar-header navbar-right">
					<div id="loginlayer" class="my-control-menu login"><a href="javascript:void(0);" id="loginmenutrigger" class="header-label-class header-menu" title="Sign In" onclick="doLogin()">Sign In</a></div>			
				</div>
				<div class="navbar-header navbar-right">
					<div id="registerlayer" class="registration"><a href="javascript:void(0);" id="registermenutrigger" class="header-label-class header-menu" title="Register" onclick="registerClick()">Register</a></div>
				</div>

