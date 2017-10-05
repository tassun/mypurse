                	<div id="page_login" class="pt-page pt-page-1 pt-page-current">
						<div class="row">
                        	<form class="cbp-mc-form" id="login_form" name="login_form" autocomplete="off">
                                <div id="loginformarea" class="login_form portal-area">     
                                	<label id="login_label">${fsLabel.getText('login_label','Sign In')}</label>   
									<br/> 
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
										<input type="text" id="login_user" name="user" placeholder="${fsLabel.getText('login_user_placeholder','User')}" />
									</div>
                                    <br/>
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"></i></span>
										<input type="password" id="login_pass" name="password" placeholder="${fsLabel.getText('login_pass_placeholder','Password')}" autocomplete="off"/>
									</div>
									<br/>
                                    <input type="button" onclick="connectServer();" id="login_button" value="${fsLabel.getText('login_button','Sign In')}"/>
									<!--
									<br/>
                                    <input type="button" onclick="registerClick();" id="register_button" value="${fsLabel.getText('register_button','REGISTER')}"/>
									-->
									<br/>
									<div class="row">
										<a href="javascript:void(0)" onclick="forgotClick()" id="forgot_password" class="enter-class" title="Forgot Password">${fsLabel.getText('forgot_password','Forgot Password?')}</a>	
										<a href="javascript:void(0)" onclick="registerClick()" id="register_button" class="enter-class pull-right" title="Register">${fsLabel.getText('register_button','REGISTER')}</a>
									</div>
                                </div>
                            </form>
						</div>
                    </div>                                                        
